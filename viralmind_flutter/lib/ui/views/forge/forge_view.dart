import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/application/wallet.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/token.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/components/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_existing_gym_card.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_detail.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_new_gym_card.dart';
import 'package:viralmind_flutter/ui/views/forge/components/generate_gym_modal.dart';
import 'package:viralmind_flutter/utils/env.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  bool _showGenerateGymModal = false;
  String? _error;
  String _skills = '';
  TrainingPool? _selectedPool;

  Future<void> _handleSave(Map<String, dynamic> generatedResponse) async {
    try {
      final walletAddress = ref.watch(walletAddressProvider).valueOrNull;
      if (walletAddress == null) return;
      final content = generatedResponse['content'];
      if (content != null) {
        final poolName = content['name'] ?? 'Unnamed Gym';
        final apps =
            (content['apps'] as List?)?.cast<Map<String, dynamic>>() ?? [];
        final skills = _skills;
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
          _skills = '';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final overlayWidth = constraints.maxWidth;
        final overlayHeight = constraints.maxHeight;
        return Stack(
          children: [
            poolsAsync.when(
              data: _buildPools,
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(20),
                child: MessageBox(
                  messageBoxType: MessageBoxType.warning,
                  content: Text(
                    error.toString(),
                    style: const TextStyle(color: Color(0xFFFF8400)),
                  ),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
            if (_showGenerateGymModal)
              GenerateGymModal(
                skills: _skills,
                onSkillsChange: (skills) {
                  setState(() {
                    _skills = skills;
                  });
                },
                onClose: () {
                  setState(() => _showGenerateGymModal = false);
                },
                onSave: _handleSave,
              ),
            if (_selectedPool != null)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                left: _selectedPool != null ? 0 : overlayWidth,
                top: 0,
                width: overlayWidth,
                height: overlayHeight,
                child: IgnorePointer(
                  ignoring: _selectedPool == null,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _selectedPool != null ? 1.0 : 0.0,
                    child: Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.3),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCubic,
                            width: _selectedPool != null ? overlayWidth : 0,
                            height: _selectedPool != null
                                ? overlayHeight * 0.92
                                : 0,
                            child: _selectedPool != null
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 32,
                                          right: 32,
                                          top: 32,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _selectedPool!.name,
                                              style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                                color: VMColors.primary,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.close_fullscreen,
                                                color: VMColors.secondary,
                                                size: 32,
                                              ),
                                              tooltip: 'Close',
                                              onPressed: () => setState(
                                                () => _selectedPool = null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
                                          ),
                                          child: ForgeGymDetail(
                                            pool: _selectedPool!,
                                            onBack: () => setState(
                                              () => _selectedPool = null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildPools(List<TrainingPool> pools) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forge',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                    color: VMColors.secondaryText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AutoSizeText(
                    'Collect crowd-powered demonstrations, perfect for training AI agents.',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    minFontSize: 14,
                    style: TextStyle(
                      fontSize: 24,
                      color: VMColors.primaryText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
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
              ),
            _buildPoolsGrid(pools),
          ],
        ),
      ),
    );
  }

  Widget _buildPoolsGrid(List<TrainingPool> pools) {
    final sortedPools = List<TrainingPool>.from(pools)
      ..sort((a, b) {
        if (a.status == TrainingPoolStatus.live &&
            b.status != TrainingPoolStatus.live) {
          return -1;
        }
        if (a.status != TrainingPoolStatus.live &&
            b.status == TrainingPoolStatus.live) {
          return 1;
        }
        return b.createdAt!.compareTo(a.createdAt!);
      });

    return GridView.extent(
      maxCrossAxisExtent: 350,
      childAspectRatio: 0.95,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ForgeNewGymCard(
          onTap: () => setState(() {
            _skills = '';
            _showGenerateGymModal = true;
          }),
        ),
        ...sortedPools.map(
          (pool) => ForgeExistingGymCard(
            pool: pool,
            onTap: () => setState(() => _selectedPool = pool),
          ),
        ),
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
