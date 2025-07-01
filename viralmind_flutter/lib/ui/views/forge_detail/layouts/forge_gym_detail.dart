import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/domain/models/ui/gym_filter.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/components/forge_gym_detail_sidebar.dart';

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
        ..setAlertEmail(widget.pool.ownerEmail ?? '')
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
    ref
      ..listen(forgeDetailNotifierProvider.select((value) => value),
          (previous, next) {
        if (next.isUpdatePoolSuccess == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Gym updated successfully!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        } else if (next.isUpdatePoolSuccess == false && next.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to update gym: ${next.error}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }
        ref.read(forgeDetailNotifierProvider.notifier)
          ..setIsUpdatePoolSuccess(false)
          ..setError(null);
      })
      ..listen(forgeDetailNotifierProvider.select((value) => value),
          (previous, next) {
        if (next.isUpdateGymStatusSuccess == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Gym status updated successfully!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          );
        } else if (next.isUpdateGymStatusSuccess == false &&
            next.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to update gym status: ${next.error}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }
        ref.read(forgeDetailNotifierProvider.notifier)
          ..setIsUpdateGymStatusSuccess(false)
          ..setError(null);
      })
      ..listen(forgeDetailNotifierProvider.select((value) => value),
          (previous, next) {
        if (next.isRefreshBalanceSuccess == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Balance refreshed successfully!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          );
        } else if (next.isRefreshBalanceSuccess == false &&
            next.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to refresh balance: ${next.error}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }
        ref.read(forgeDetailNotifierProvider.notifier)
          ..setIsRefreshBalanceSuccess(false)
          ..setError(null);
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
