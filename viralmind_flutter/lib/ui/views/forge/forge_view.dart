import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/application/wallet.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/token.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_existing_gym_card.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_new_gym_card.dart';
import 'package:viralmind_flutter/ui/views/forge/components/generate_gym_modal.dart';
import 'package:viralmind_flutter/utils/env.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  bool _loadingPrices = true;
  bool _showGenerateGymModal = false;
  String? _error;
  Set<String> _refreshingPools = {};

  double _viralPrice = 0;
  double _solPrice = 0;
  double _viralPerSol = 0;

  @override
  void initState() {
    super.initState();
    _fetchPrices();
  }

  Future<void> _fetchPrices() async {
    try {
      setState(() => _loadingPrices = true);
      // TODO: Implement price fetching from Jupiter API
      // This will be implemented when we add the price service
    } catch (e) {
      debugPrint('Error fetching prices: $e');
    } finally {
      setState(() => _loadingPrices = false);
    }
  }

  void _navigateToGymDetail(TrainingPool pool) {
    // TODO: Implement navigation to gym detail page
  }

  Future<void> _handleSave(Map<String, dynamic> generatedResponse) async {
    try {
      final walletAddress = ref.watch(walletAddressProvider).valueOrNull;
      if (walletAddress == null) return;
      final content = generatedResponse['content'];
      if (content != null) {
        final poolName = content['name'] ?? 'Unnamed Gym';
        final apps =
            (content['apps'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        //TODO: get skills from generatedResponse
        const skills = '';
        final token = Token(
          type: TokenType.viral,
          symbol: 'VIRAL',
          address: Env.viralTokenAddress,
        );
        await ref.read(
          createPoolWithAppsProvider(
            poolName: poolName,
            skills: skills,
            token: token,
            apps: apps.map(ForgeApp.fromJson).toList(),
            ownerAddress: walletAddress,
          ).future,
        );
        ref.invalidate(listPoolsProvider);
        setState(() {
          _showGenerateGymModal = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final poolsAsync = ref.watch(listPoolsProvider);

    return Stack(
      children: [
        poolsAsync.when(
          data: _buildPools,
          error: (error, stack) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
        if (_showGenerateGymModal)
          GenerateGymModal(
            skills: '',
            onSkillsChange: (skills) {},
            onClose: () {
              setState(() => _showGenerateGymModal = false);
            },
            onSave: _handleSave,
          ),
      ],
    );
  }

  Widget _buildPools(List<TrainingPool> pools) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
          ],
        ),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 8,
        radius: const Radius.circular(4),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.hammer,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Forge',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Collect crowd-powered demonstrations, perfect for training AI agents.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 32),
                if (_error != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: Colors.red.withValues(alpha: 0.1)),
                    ),
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                if (pools.isEmpty)
                  _buildEmptyState()
                else
                  _buildPoolsGrid(pools),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.5,
          children: [
            ForgeNewGymCard(
                onTap: () => setState(() => _showGenerateGymModal = true)),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'No AI agent gyms found. Create one to get started!',
          style: TextStyle(
            color:
                Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPoolsGrid(List<TrainingPool> pools) {
    /* final sortedPools = List<TrainingPool>.from(_trainingPools)
      ..sort((a, b) {
        if (a.status == TrainingPoolStatus.live &&
            b.status != TrainingPoolStatus.live) return -1;
        if (a.status != TrainingPoolStatus.live &&
            b.status == TrainingPoolStatus.live) return 1;
        return b.createdAt.compareTo(a.createdAt);
      });*/

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 1.5,
      children: [
        ForgeNewGymCard(
            onTap: () => setState(() => _showGenerateGymModal = true)),
        ...pools.map((pool) => ForgeExistingGymCard(
              pool: pool,
              onTap: () => _navigateToGymDetail(pool),
            )),
      ],
    );
  }

  /* Widget _buildPoolStats(TrainingPool pool) {
    final possibleDemos = pool.pricePerDemo != null && pool.pricePerDemo! > 0
        ? (pool.tokenBalance ?? 0 / pool.pricePerDemo!).floor()
        : 0;
    final totalDemos = pool.base.demonstrations + possibleDemos;
    final demoPercentage = totalDemos > 0
        ? (pool.base.demonstrations / totalDemos * 100).clamp(0, 100)
        : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(pool.tokenBalance ?? 0).toStringAsFixed(0)} ${pool.base.token.symbol}',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Pool Balance',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.6),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        if (pool.base.pricePerDemo != null && pool.base.pricePerDemo! > 0) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Uploads / Remaining Demos',
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '${pool.base.demonstrations} / $possibleDemos',
                style: TextStyle(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Container(
                height: 6,
                width: MediaQuery.of(context).size.width * demoPercentage / 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.8),
                      Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () => _navigateToGymDetail(pool.base),
            icon: Icon(
              FontAwesomeIcons.chevronRight,
              size: 16,
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withValues(alpha: 0.8),
            ),
            label: Text(
              'View Details',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }*/
}
