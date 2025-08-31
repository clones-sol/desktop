import 'dart:convert';
import 'package:http/http.dart' as http;

/// Repository for The Graph subgraph queries
/// Handles factory discovery and pool analytics via GraphQL
class SubgraphRepository {
  SubgraphRepository({
    http.Client? httpClient,
    bool useMainnet = false,
  })  : _httpClient = httpClient ?? http.Client(),
        _endpoint = useMainnet ? _mainnetEndpoint : _sepoliaEndpoint;
  static const String _sepoliaEndpoint =
      'https://api.studio.thegraph.com/query/YOUR_SUBGRAPH_ID/clones-factory-sepolia/version/latest';
  static const String _mainnetEndpoint =
      'https://api.studio.thegraph.com/query/YOUR_SUBGRAPH_ID/clones-factory-mainnet/version/latest';

  final http.Client _httpClient;
  final String _endpoint;

  /// Execute GraphQL query against the subgraph
  Future<Map<String, dynamic>> _query(
    String query, [
    Map<String, dynamic>? variables,
  ]) async {
    try {
      final response = await _httpClient.post(
        Uri.parse(_endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'query': query,
          if (variables != null) 'variables': variables,
        }),
      );

      if (response.statusCode != 200) {
        throw SubgraphException(
          'HTTP ${response.statusCode}: ${response.body}',
        );
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (data.containsKey('errors')) {
        final errors = data['errors'] as List;
        throw SubgraphException(
          'GraphQL errors: ${errors.map((e) => e['message']).join(', ')}',
        );
      }

      return data['data'] as Map<String, dynamic>;
    } catch (e) {
      throw SubgraphException('Subgraph query failed: $e');
    }
  }

  // =====================================
  // FACTORY DISCOVERY METHODS
  // =====================================

  /// Search pools with optional filters for desktop factory browser
  Future<List<PoolSearchResult>> searchPools({
    String? searchText,
    String? tokenAddress,
    String? creatorAddress,
    String? minFunding,
    int limit = 25,
    int skip = 0,
  }) async {
    const query = r'''
      query GetPoolsForSearch(
        $first: Int!,
        $skip: Int!,
        $search: String,
        $tokenFilter: [Bytes!],
        $creatorFilter: Bytes,
        $minFunding: BigInt!
      ) {
        pools(
          first: $first,
          skip: $skip,
          where: {
            and: [
              { isActive: true },
              { totalFunded_gte: $minFunding },
              { creator: $creatorFilter },
              { token_in: $tokenFilter },
              {
                or: [
                  { description_contains_nocase: $search },
                ]
              }
            ]
          },
          orderBy: lastActivityAt,
          orderDirection: desc
        ) {
          id
          creator
          token {
            id
            symbol
            name
            decimals
          }
          factory {
            id
            treasury
          }
          totalFunded
          totalClaimed
          totalUsers
          totalClaims
          totalFees
          isActive
          lastActivityAt
          description
          skills
          createdAt
          updatedAt
        }
      }
    ''';

    final variables = {
      'first': limit,
      'skip': skip,
      'search': searchText,
      'tokenFilter': tokenAddress != null ? [tokenAddress] : null,
      'creatorFilter': creatorAddress,
      'minFunding': minFunding ?? '0',
    };

    final data = await _query(query, variables);
    if (data['pools'] == null) {
      return [];
    }
    final pools = data['pools'] as List;

    return pools.map((pool) => PoolSearchResult.fromJson(pool)).toList();
  }

  /// Get pools by skills and task types for advanced search
  Future<List<PoolMetadataResult>> searchBySkills({
    required List<String> skills,
    int limit = 20,
  }) async {
    const query = r'''
      query GetPoolsBySkills(
        $skills: [String!]!,
        $first: Int!
      ) {
        poolMetadata(
          first: $first,
          where: {
            and: [
              { skills_contains: $skills },
              { pool_: { isActive: true } }
            ]
          },
          orderBy: updatedAt,
          orderDirection: desc
        ) {
          id
          pool {
            id
            creator
            token {
              symbol
              name
              decimals
            }
            totalFunded
            totalUsers
            lastActivityAt
          }
          skills
          description
          searchString
        }
      }
    ''';

    final variables = {
      'skills': skills,
      'first': limit,
    };

    final data = await _query(query, variables);
    final poolMetadata = data['poolMetadata'] as List;

    return poolMetadata
        .map((meta) => PoolMetadataResult.fromJson(meta))
        .toList();
  }

  /// Get factory overview statistics for dashboard
  Future<FactoryOverview> getFactoryOverview() async {
    const query = '''
      query GetFactoryOverview {
        factoryStats(id: "factory-stats") {
          totalPools
          totalVolume
          totalFees
          totalUsers
          totalClaims
          averagePoolSize
          updatedAt
        }
        
        factories {
          id
          totalPools
          publisher
          oldPublisher
          graceEndTime
          allowedTokens {
            symbol
            name
            isAllowed
            totalPools
            totalVolume
          }
        }
      }
    ''';

    final data = await _query(query);
    return FactoryOverview.fromJson(data);
  }

  // =====================================
  // POOL ANALYTICS METHODS
  // =====================================

  /// Get detailed information for a specific pool
  Future<PoolDetails?> getPoolDetails(String poolId) async {
    const query = r'''
      query GetPoolDetails($poolId: Bytes!) {
        pool(id: $poolId) {
          id
          creator
          token {
            id
            symbol
            name
            decimals
            totalPools
          }
          factory {
            id
            publisher
            treasury
          }
          
          totalFunded
          totalClaimed  
          totalFees
          totalUsers
          totalClaims
          isActive
          lastActivityAt
          
          claims(
            first: 10,
            orderBy: timestamp,
            orderDirection: desc
          ) {
            id
            user {
              id
            }
            cumulativeAmount
            grossAmount
            feeAmount
            netAmount
            timestamp
            transactionHash
          }
          
          fundings(
            first: 10,
            orderBy: timestamp,
            orderDirection: desc
          ) {
            id
            funder {
              id
            }
            amount
            timestamp
            transactionHash
          }
          
          description
          skills
        }
      }
    ''';

    final data = await _query(query, {'poolId': poolId});
    final pool = data['pool'];

    return pool != null ? PoolDetails.fromJson(pool) : null;
  }

  /// Get user claim history for farmer dashboard
  Future<UserClaimHistory?> getUserClaimHistory(
    String userAddress, {
    int limit = 50,
    int skip = 0,
  }) async {
    const query = r'''
      query GetUserClaimHistory(
        $userAddress: Bytes!,
        $first: Int!,
        $skip: Int!
      ) {
        user(id: $userAddress) {
          id
          totalClaimed
          totalFeesPaid
          uniquePools
          totalClaims
          firstActivityAt
          lastActivityAt
          
          claims(
            first: $first,
            skip: $skip,
            orderBy: timestamp,
            orderDirection: desc
          ) {
            id
            pool {
              id
              creator
              token {
                symbol
                name
                decimals
              }
              description
            }
            cumulativeAmount
            grossAmount
            feeAmount
            netAmount
            timestamp
            transactionHash
            blockNumber
          }
        }
      }
    ''';

    final variables = {
      'userAddress': userAddress,
      'first': limit,
      'skip': skip,
    };

    final data = await _query(query, variables);
    final user = data['user'];

    return user != null ? UserClaimHistory.fromJson(user) : null;
  }

  /// Get creator's pools for factory management dashboard
  Future<List<CreatorPool>> getCreatorPools(
    String creatorAddress, {
    int limit = 50,
  }) async {
    const query = r'''
      query GetCreatorPools(
        $creatorAddress: Bytes!,
        $first: Int!
      ) {
        pools(
          where: {
            creator: $creatorAddress
          },
          first: $first,
          orderBy: createdAt,
          orderDirection: desc
        ) {
          id
          token {
            symbol
            name
            decimals
          }
          totalFunded
          totalClaimed
          totalUsers
          totalClaims
          totalFees
          isActive
          lastActivityAt
          createdAt
          
          claims(first: 3, orderBy: timestamp, orderDirection: desc) {
            timestamp
            netAmount
          }
          
          fundings(first: 3, orderBy: timestamp, orderDirection: desc) {
            timestamp  
            amount
          }
        }
      }
    ''';

    final variables = {
      'creatorAddress': creatorAddress,
      'first': limit,
    };

    final data = await _query(query, variables);
    final pools = data['pools'] as List;

    return pools.map((pool) => CreatorPool.fromJson(pool)).toList();
  }

  // =====================================
  // ANALYTICS METHODS
  // =====================================

  /// Get token analytics for dashboard
  Future<List<TokenAnalytics>> getTokenAnalytics() async {
    const query = '''
      query GetTokenAnalytics {
        tokens(
          where: {
            isAllowed: true
          },
          orderBy: totalVolume,
          orderDirection: desc
        ) {
          id
          symbol
          name
          decimals
          isAllowed
          totalPools
          totalVolume
          totalFees
          
          pools(
            first: 5,
            orderBy: totalFunded,
            orderDirection: desc
          ) {
            id
            creator
            totalFunded
            totalClaimed
            totalUsers
            lastActivityAt
          }
        }
      }
    ''';

    final data = await _query(query);
    final tokens = data['tokens'] as List;

    return tokens.map((token) => TokenAnalytics.fromJson(token)).toList();
  }

  /// Get daily statistics for analytics dashboard
  Future<List<DailyStats>> getDailyStats({
    required String startDate,
    required String endDate,
  }) async {
    const query = r'''
      query GetDailyStats(
        $startDate: String!,
        $endDate: String!
      ) {
        dailyStats(
          where: {
            date_gte: $startDate,
            date_lte: $endDate
          },
          orderBy: date,
          orderDirection: asc
        ) {
          id
          date
          poolsCreated
          volume
          fees
          uniqueUsers
          totalClaims
          batchClaims
          averageGasPrice
          totalGasUsed
          averageClaimCost
        }
      }
    ''';

    final variables = {
      'startDate': startDate,
      'endDate': endDate,
    };

    final data = await _query(query, variables);
    final stats = data['dailyStats'] as List;

    return stats.map((stat) => DailyStats.fromJson(stat)).toList();
  }

  /// Health check for monitoring subgraph status
  Future<SubgraphHealth> checkHealth() async {
    const query = '''
      query HealthCheck {
        _meta {
          deployment
          hasIndexingErrors
          block {
            number
            timestamp
          }
        }
      }
    ''';

    try {
      final data = await _query(query);
      return SubgraphHealth.fromJson(data['_meta']);
    } catch (e) {
      return SubgraphHealth(
        isHealthy: false,
        hasIndexingErrors: true,
        errorMessage: e.toString(),
        deployment: 'unknown',
        blockNumber: 0,
        blockTimestamp: 0,
      );
    }
  }

  void dispose() {
    _httpClient.close();
  }
}

// =====================================
// DATA MODELS
// =====================================

class PoolSearchResult {
  PoolSearchResult({
    required this.id,
    required this.creator,
    required this.token,
    required this.factory,
    required this.totalFunded,
    required this.totalClaimed,
    required this.totalUsers,
    required this.totalClaims,
    required this.totalFees,
    required this.isActive,
    required this.lastActivityAt,
    this.description,
    required this.skills,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PoolSearchResult.fromJson(Map<String, dynamic> json) {
    return PoolSearchResult(
      id: json['id'],
      creator: json['creator'],
      token: TokenInfo.fromJson(json['token']),
      factory: FactoryInfo.fromJson(json['factory']),
      totalFunded: json['totalFunded'],
      totalClaimed: json['totalClaimed'],
      totalUsers: json['totalUsers'],
      totalClaims: json['totalClaims'],
      totalFees: json['totalFees'],
      isActive: json['isActive'],
      lastActivityAt: int.parse(json['lastActivityAt']),
      description: json['description'],
      skills: List<String>.from(json['skills'] ?? []),
      createdAt: int.parse(json['createdAt']),
      updatedAt: int.parse(json['updatedAt']),
    );
  }
  final String id;
  final String creator;
  final TokenInfo token;
  final FactoryInfo factory;
  final String totalFunded;
  final String totalClaimed;
  final String totalUsers;
  final String totalClaims;
  final String totalFees;
  final bool isActive;
  final int lastActivityAt;
  final String? description;
  final List<String> skills;
  final int createdAt;
  final int updatedAt;
}

class TokenInfo {
  TokenInfo({
    required this.id,
    required this.symbol,
    required this.name,
    required this.decimals,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    return TokenInfo(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      decimals: json['decimals'],
    );
  }
  final String id;
  final String symbol;
  final String name;
  final int decimals;
}

class FactoryInfo {
  FactoryInfo({
    required this.id,
    required this.treasury,
  });

  factory FactoryInfo.fromJson(Map<String, dynamic> json) {
    return FactoryInfo(
      id: json['id'],
      treasury: json['treasury'],
    );
  }
  final String id;
  final String treasury;
}

class PoolMetadataResult {
  PoolMetadataResult({
    required this.id,
    required this.pool,
    required this.skills,
    this.description,
    required this.searchString,
  });

  factory PoolMetadataResult.fromJson(Map<String, dynamic> json) {
    return PoolMetadataResult(
      id: json['id'],
      pool: PoolBasicInfo.fromJson(json['pool']),
      skills: List<String>.from(json['skills'] ?? []),
      description: json['description'],
      searchString: json['searchString'],
    );
  }
  final String id;
  final PoolBasicInfo pool;
  final List<String> skills;
  final String? description;
  final String searchString;
}

class PoolBasicInfo {
  PoolBasicInfo({
    required this.id,
    required this.creator,
    required this.token,
    required this.totalFunded,
    required this.totalUsers,
    required this.lastActivityAt,
  });

  factory PoolBasicInfo.fromJson(Map<String, dynamic> json) {
    return PoolBasicInfo(
      id: json['id'],
      creator: json['creator'],
      token: TokenInfo.fromJson(json['token']),
      totalFunded: json['totalFunded'],
      totalUsers: json['totalUsers'],
      lastActivityAt: int.parse(json['lastActivityAt']),
    );
  }
  final String id;
  final String creator;
  final TokenInfo token;
  final String totalFunded;
  final String totalUsers;
  final int lastActivityAt;
}

class FactoryOverview {
  FactoryOverview({
    this.factoryStats,
    required this.factories,
  });

  factory FactoryOverview.fromJson(Map<String, dynamic> json) {
    return FactoryOverview(
      factoryStats: json['factoryStats'] != null
          ? FactoryStats.fromJson(json['factoryStats'])
          : null,
      factories: (json['factories'] as List)
          .map((factory) => Factory.fromJson(factory))
          .toList(),
    );
  }
  final FactoryStats? factoryStats;
  final List<Factory> factories;
}

class FactoryStats {
  FactoryStats({
    required this.totalPools,
    required this.totalVolume,
    required this.totalFees,
    required this.totalUsers,
    required this.totalClaims,
    required this.averagePoolSize,
    required this.updatedAt,
  });

  factory FactoryStats.fromJson(Map<String, dynamic> json) {
    return FactoryStats(
      totalPools: json['totalPools'],
      totalVolume: json['totalVolume'],
      totalFees: json['totalFees'],
      totalUsers: json['totalUsers'],
      totalClaims: json['totalClaims'],
      averagePoolSize: json['averagePoolSize'],
      updatedAt: int.parse(json['updatedAt']),
    );
  }
  final String totalPools;
  final String totalVolume;
  final String totalFees;
  final String totalUsers;
  final String totalClaims;
  final String averagePoolSize;
  final int updatedAt;
}

class Factory {
  Factory({
    required this.id,
    required this.totalPools,
    required this.publisher,
    this.oldPublisher,
    this.graceEndTime,
    required this.allowedTokens,
  });

  factory Factory.fromJson(Map<String, dynamic> json) {
    return Factory(
      id: json['id'],
      totalPools: json['totalPools'],
      publisher: json['publisher'],
      oldPublisher: json['oldPublisher'],
      graceEndTime:
          json['graceEndTime'] != null ? int.parse(json['graceEndTime']) : null,
      allowedTokens: (json['allowedTokens'] as List)
          .map((token) => AllowedToken.fromJson(token))
          .toList(),
    );
  }
  final String id;
  final String totalPools;
  final String publisher;
  final String? oldPublisher;
  final int? graceEndTime;
  final List<AllowedToken> allowedTokens;
}

class AllowedToken {
  AllowedToken({
    required this.symbol,
    required this.name,
    required this.isAllowed,
    required this.totalPools,
    required this.totalVolume,
  });

  factory AllowedToken.fromJson(Map<String, dynamic> json) {
    return AllowedToken(
      symbol: json['symbol'],
      name: json['name'],
      isAllowed: json['isAllowed'],
      totalPools: json['totalPools'],
      totalVolume: json['totalVolume'],
    );
  }
  final String symbol;
  final String name;
  final bool isAllowed;
  final String totalPools;
  final String totalVolume;
}

class PoolDetails {
  PoolDetails({
    required this.id,
    required this.creator,
    required this.token,
    required this.factory,
    required this.totalFunded,
    required this.totalClaimed,
    required this.totalFees,
    required this.totalUsers,
    required this.totalClaims,
    required this.isActive,
    required this.lastActivityAt,
    required this.claims,
    required this.fundings,
    this.description,
    required this.skills,
  });

  factory PoolDetails.fromJson(Map<String, dynamic> json) {
    return PoolDetails(
      id: json['id'],
      creator: json['creator'],
      token: TokenInfo.fromJson(json['token']),
      factory: FactoryInfo.fromJson(json['factory']),
      totalFunded: json['totalFunded'],
      totalClaimed: json['totalClaimed'],
      totalFees: json['totalFees'],
      totalUsers: json['totalUsers'],
      totalClaims: json['totalClaims'],
      isActive: json['isActive'],
      lastActivityAt: int.parse(json['lastActivityAt']),
      claims: (json['claims'] as List)
          .map((claim) => ClaimInfo.fromJson(claim))
          .toList(),
      fundings: (json['fundings'] as List)
          .map((funding) => FundingInfo.fromJson(funding))
          .toList(),
      description: json['description'],
      skills: List<String>.from(json['skills'] ?? []),
    );
  }
  final String id;
  final String creator;
  final TokenInfo token;
  final FactoryInfo factory;
  final String totalFunded;
  final String totalClaimed;
  final String totalFees;
  final String totalUsers;
  final String totalClaims;
  final bool isActive;
  final int lastActivityAt;
  final List<ClaimInfo> claims;
  final List<FundingInfo> fundings;
  final String? description;
  final List<String> skills;
}

class ClaimInfo {
  ClaimInfo({
    required this.id,
    required this.user,
    required this.cumulativeAmount,
    required this.grossAmount,
    required this.feeAmount,
    required this.netAmount,
    required this.timestamp,
    required this.transactionHash,
  });

  factory ClaimInfo.fromJson(Map<String, dynamic> json) {
    return ClaimInfo(
      id: json['id'],
      user: UserInfo.fromJson(json['user']),
      cumulativeAmount: json['cumulativeAmount'],
      grossAmount: json['grossAmount'],
      feeAmount: json['feeAmount'],
      netAmount: json['netAmount'],
      timestamp: int.parse(json['timestamp']),
      transactionHash: json['transactionHash'],
    );
  }
  final String id;
  final UserInfo user;
  final String cumulativeAmount;
  final String grossAmount;
  final String feeAmount;
  final String netAmount;
  final int timestamp;
  final String transactionHash;
}

class FundingInfo {
  FundingInfo({
    required this.id,
    required this.funder,
    required this.amount,
    required this.timestamp,
    required this.transactionHash,
  });

  factory FundingInfo.fromJson(Map<String, dynamic> json) {
    return FundingInfo(
      id: json['id'],
      funder: UserInfo.fromJson(json['funder']),
      amount: json['amount'],
      timestamp: int.parse(json['timestamp']),
      transactionHash: json['transactionHash'],
    );
  }
  final String id;
  final UserInfo funder;
  final String amount;
  final int timestamp;
  final String transactionHash;
}

class UserInfo {
  UserInfo({required this.id});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(id: json['id']);
  }
  final String id;
}

class UserClaimHistory {
  UserClaimHistory({
    required this.id,
    required this.totalClaimed,
    required this.totalFeesPaid,
    required this.uniquePools,
    required this.totalClaims,
    required this.firstActivityAt,
    required this.lastActivityAt,
    required this.claims,
  });

  factory UserClaimHistory.fromJson(Map<String, dynamic> json) {
    return UserClaimHistory(
      id: json['id'],
      totalClaimed: json['totalClaimed'],
      totalFeesPaid: json['totalFeesPaid'],
      uniquePools: json['uniquePools'],
      totalClaims: json['totalClaims'],
      firstActivityAt: int.parse(json['firstActivityAt']),
      lastActivityAt: int.parse(json['lastActivityAt']),
      claims: (json['claims'] as List)
          .map((claim) => UserClaim.fromJson(claim))
          .toList(),
    );
  }
  final String id;
  final String totalClaimed;
  final String totalFeesPaid;
  final String uniquePools;
  final String totalClaims;
  final int firstActivityAt;
  final int lastActivityAt;
  final List<UserClaim> claims;
}

class UserClaim {
  UserClaim({
    required this.id,
    required this.pool,
    required this.cumulativeAmount,
    required this.grossAmount,
    required this.feeAmount,
    required this.netAmount,
    required this.timestamp,
    required this.transactionHash,
    required this.blockNumber,
  });

  factory UserClaim.fromJson(Map<String, dynamic> json) {
    return UserClaim(
      id: json['id'],
      pool: PoolBasicInfoWithDescription.fromJson(json['pool']),
      cumulativeAmount: json['cumulativeAmount'],
      grossAmount: json['grossAmount'],
      feeAmount: json['feeAmount'],
      netAmount: json['netAmount'],
      timestamp: int.parse(json['timestamp']),
      transactionHash: json['transactionHash'],
      blockNumber: json['blockNumber'],
    );
  }
  final String id;
  final PoolBasicInfoWithDescription pool;
  final String cumulativeAmount;
  final String grossAmount;
  final String feeAmount;
  final String netAmount;
  final int timestamp;
  final String transactionHash;
  final String blockNumber;
}

class PoolBasicInfoWithDescription {
  PoolBasicInfoWithDescription({
    required this.id,
    required this.creator,
    required this.token,
    this.description,
  });

  factory PoolBasicInfoWithDescription.fromJson(Map<String, dynamic> json) {
    return PoolBasicInfoWithDescription(
      id: json['id'],
      creator: json['creator'],
      token: TokenInfo.fromJson(json['token']),
      description: json['description'],
    );
  }
  final String id;
  final String creator;
  final TokenInfo token;
  final String? description;
}

class CreatorPool {
  CreatorPool({
    required this.id,
    required this.token,
    required this.totalFunded,
    required this.totalClaimed,
    required this.totalUsers,
    required this.totalClaims,
    required this.totalFees,
    required this.isActive,
    required this.lastActivityAt,
    required this.createdAt,
    required this.claims,
    required this.fundings,
  });

  factory CreatorPool.fromJson(Map<String, dynamic> json) {
    return CreatorPool(
      id: json['id'],
      token: TokenInfo.fromJson(json['token']),
      totalFunded: json['totalFunded'],
      totalClaimed: json['totalClaimed'],
      totalUsers: json['totalUsers'],
      totalClaims: json['totalClaims'],
      totalFees: json['totalFees'],
      isActive: json['isActive'],
      lastActivityAt: int.parse(json['lastActivityAt']),
      createdAt: int.parse(json['createdAt']),
      claims: (json['claims'] as List)
          .map((claim) => SimpleActivity.fromJson(claim))
          .toList(),
      fundings: (json['fundings'] as List)
          .map((funding) => SimpleActivity.fromJson(funding))
          .toList(),
    );
  }
  final String id;
  final TokenInfo token;
  final String totalFunded;
  final String totalClaimed;
  final String totalUsers;
  final String totalClaims;
  final String totalFees;
  final bool isActive;
  final int lastActivityAt;
  final int createdAt;
  final List<SimpleActivity> claims;
  final List<SimpleActivity> fundings;
}

class SimpleActivity {
  SimpleActivity({
    required this.timestamp,
    this.amount,
    this.netAmount,
  });

  factory SimpleActivity.fromJson(Map<String, dynamic> json) {
    return SimpleActivity(
      timestamp: int.parse(json['timestamp']),
      amount: json['amount'],
      netAmount: json['netAmount'],
    );
  }
  final int timestamp;
  final String? amount;
  final String? netAmount;
}

class TokenAnalytics {
  TokenAnalytics({
    required this.id,
    required this.symbol,
    required this.name,
    required this.decimals,
    required this.isAllowed,
    required this.totalPools,
    required this.totalVolume,
    required this.totalFees,
    required this.pools,
  });

  factory TokenAnalytics.fromJson(Map<String, dynamic> json) {
    return TokenAnalytics(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      decimals: json['decimals'],
      isAllowed: json['isAllowed'],
      totalPools: json['totalPools'],
      totalVolume: json['totalVolume'],
      totalFees: json['totalFees'],
      pools: json['pools'] == null
          ? []
          : (json['pools'] as List)
              .map((pool) => TopPool.fromJson(pool))
              .toList(),
    );
  }
  final String id;
  final String symbol;
  final String name;
  final int decimals;
  final bool isAllowed;
  final String totalPools;
  final String totalVolume;
  final String totalFees;
  final List<TopPool> pools;
}

class TopPool {
  TopPool({
    required this.id,
    required this.creator,
    required this.totalFunded,
    required this.totalClaimed,
    required this.totalUsers,
    required this.lastActivityAt,
  });

  factory TopPool.fromJson(Map<String, dynamic> json) {
    return TopPool(
      id: json['id'],
      creator: json['creator'],
      totalFunded: json['totalFunded'],
      totalClaimed: json['totalClaimed'],
      totalUsers: json['totalUsers'],
      lastActivityAt: int.parse(json['lastActivityAt']),
    );
  }
  final String id;
  final String creator;
  final String totalFunded;
  final String totalClaimed;
  final String totalUsers;
  final int lastActivityAt;
}

class DailyStats {
  DailyStats({
    required this.id,
    required this.date,
    required this.poolsCreated,
    required this.volume,
    required this.fees,
    required this.uniqueUsers,
    required this.totalClaims,
    required this.batchClaims,
    required this.averageGasPrice,
    required this.totalGasUsed,
    required this.averageClaimCost,
  });

  factory DailyStats.fromJson(Map<String, dynamic> json) {
    return DailyStats(
      id: json['id'],
      date: json['date'],
      poolsCreated: json['poolsCreated'],
      volume: json['volume'],
      fees: json['fees'],
      uniqueUsers: json['uniqueUsers'],
      totalClaims: json['totalClaims'],
      batchClaims: json['batchClaims'],
      averageGasPrice: json['averageGasPrice'],
      totalGasUsed: json['totalGasUsed'],
      averageClaimCost: json['averageClaimCost'],
    );
  }
  final String id;
  final String date;
  final String poolsCreated;
  final String volume;
  final String fees;
  final String uniqueUsers;
  final String totalClaims;
  final String batchClaims;
  final String averageGasPrice;
  final String totalGasUsed;
  final String averageClaimCost;
}

class SubgraphHealth {
  SubgraphHealth({
    required this.isHealthy,
    required this.hasIndexingErrors,
    this.errorMessage,
    required this.deployment,
    required this.blockNumber,
    required this.blockTimestamp,
  });

  factory SubgraphHealth.fromJson(Map<String, dynamic> json) {
    return SubgraphHealth(
      isHealthy: !(json['hasIndexingErrors'] ?? false),
      hasIndexingErrors: json['hasIndexingErrors'] ?? false,
      deployment: json['deployment'] ?? 'unknown',
      blockNumber: int.parse(json['block']['number']),
      blockTimestamp: int.parse(json['block']['timestamp']),
    );
  }
  final bool isHealthy;
  final bool hasIndexingErrors;
  final String? errorMessage;
  final String deployment;
  final int blockNumber;
  final int blockTimestamp;
}

class SubgraphException implements Exception {
  SubgraphException(this.message);
  final String message;

  @override
  String toString() => 'SubgraphException: $message';
}
