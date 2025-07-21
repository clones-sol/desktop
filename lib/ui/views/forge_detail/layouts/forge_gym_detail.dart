import 'package:clones_desktop/application/apps.dart';
import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/domain/models/ui/gym_filter.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_gym_detail_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeGymDetail extends ConsumerStatefulWidget {
  const ForgeGymDetail({
    super.key,
    required this.pool,
    required this.child,
  });
  final TrainingPool pool;
  final Widget child;

  @override
  ConsumerState<ForgeGymDetail> createState() => _ForgeGymDetailState();
}

class _ForgeGymDetailState extends ConsumerState<ForgeGymDetail> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final apps = await ref.read(
        getAppsForGymProvider(filter: GymFilter(poolId: widget.pool.id)).future,
      );

      ref.read(forgeDetailNotifierProvider.notifier)
        ..setIsUpdateGymStatusSuccess(false)
        ..setIsUpdatePoolSuccess(false)
        ..setIsRefreshBalanceSuccess(false)
        ..setError(null)
        ..setApps(apps)
        ..setGymName(widget.pool.name)
        ..setGymStatus(widget.pool.status)
        ..setPricePerDemo(widget.pool.pricePerDemo ?? 0)
        ..setUploadLimitValue(widget.pool.uploadLimit?.type ?? 10)
        ..setUploadLimitType(
          widget.pool.uploadLimit?.limitType.name.toLowerCase() ?? 'none',
        )
        ..setPool(widget.pool);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    ref.listen(forgeDetailNotifierProvider, (previous, next) {
      if (previous == null) {
        return;
      }
      // Pool update success
      if (next.isUpdatePoolSuccess && !previous.isUpdatePoolSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gym updated successfully!',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        );
        ref
            .read(forgeDetailNotifierProvider.notifier)
            .setIsUpdatePoolSuccess(false);
      }

      // Gym status update success
      if (next.isUpdateGymStatusSuccess && !previous.isUpdateGymStatusSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gym status updated successfully!',
              style: theme.textTheme.bodyMedium,
            ),
            width: mediaQuery.size.width * 0.5,
          ),
        );
        ref
            .read(forgeDetailNotifierProvider.notifier)
            .setIsUpdateGymStatusSuccess(false);
      }

      // Balance refresh success
      if (next.isRefreshBalanceSuccess && !previous.isRefreshBalanceSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Balance refreshed successfully!',
              style: theme.textTheme.bodyMedium,
            ),
            width: mediaQuery.size.width * 0.5,
          ),
        );
        ref
            .read(forgeDetailNotifierProvider.notifier)
            .setIsRefreshBalanceSuccess(false);
      }

      // Error handling
      if (next.error != null && previous.error == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'An error occurred: ${next.error}',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        );
        ref.read(forgeDetailNotifierProvider.notifier).setError(null);
      }
    });

    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) return const SizedBox.shrink();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: ForgeGymDetailSidebar(
                      poolId: widget.pool.id,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: constraints.maxHeight * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.05),
                          Colors.white.withValues(alpha: 0.2),
                          Colors.white.withValues(alpha: 0.05),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: widget.child,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BtnPrimary(
                                onTap: () async {
                                  await ref
                                      .read(
                                        forgeDetailNotifierProvider.notifier,
                                      )
                                      .refreshBalance();
                                },
                                buttonText: 'Refresh Balance',
                                btnPrimaryType: BtnPrimaryType.outlinePrimary,
                              ),
                              const SizedBox(width: 16),
                              BtnPrimary(
                                onTap: () {
                                  ref
                                      .read(
                                        forgeDetailNotifierProvider.notifier,
                                      )
                                      .updatePool();
                                },
                                buttonText: 'Save',
                              ),
                              const SizedBox(width: 16),
                              if (pool.status != TrainingPoolStatus.noFunds &&
                                  pool.status != TrainingPoolStatus.noGas)
                                BtnPrimary(
                                  onTap: () {
                                    ref
                                        .read(
                                          forgeDetailNotifierProvider.notifier,
                                        )
                                        .setGymStatus(
                                          pool.status == TrainingPoolStatus.live
                                              ? TrainingPoolStatus.paused
                                              : TrainingPoolStatus.live,
                                        );
                                    ref
                                        .read(
                                          forgeDetailNotifierProvider.notifier,
                                        )
                                        .updateGymStatus();
                                  },
                                  buttonText:
                                      pool.status == TrainingPoolStatus.live
                                          ? 'Pause Gym'
                                          : 'Activate Gym',
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
