import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
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
    _updateNotifier();
  }

  @override
  void didUpdateWidget(covariant ForgeGymDetail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pool.id != widget.pool.id) {
      _updateNotifier();
    }
  }

  void _updateNotifier() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(forgeDetailNotifierProvider.notifier).setPool(widget.pool);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                onTap: () {},
                                buttonText: 'Refresh Balance',
                                btnPrimaryType: BtnPrimaryType.outlinePrimary,
                              ),
                              const SizedBox(width: 16),
                              BtnPrimary(
                                onTap: () {},
                                buttonText: 'Save',
                              ),
                              const SizedBox(width: 16),
                              BtnPrimary(
                                onTap: () {
                                  ref.read(forgeDetailNotifierProvider.notifier)
                                    ..setPool(
                                      pool.copyWith(
                                        status: pool.status ==
                                                TrainingPoolStatus.live
                                            ? TrainingPoolStatus.paused
                                            : TrainingPoolStatus.live,
                                      ),
                                    )
                                    ..save();
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
