import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/application/session/provider.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/wallet_not_connected.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/components/forge_existing_gym_card.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/components/forge_new_gym_card.dart';

class ForgeView extends ConsumerStatefulWidget {
  const ForgeView({super.key});

  static const String routeName = '/forge';

  @override
  ConsumerState<ForgeView> createState() => _ForgeViewState();
}

class _ForgeViewState extends ConsumerState<ForgeView> {
  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }
    final poolsAsync = ref.watch(listPoolsProvider);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forge',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            poolsAsync.when(
              data: (pools) {
                final allPools = [null, ...pools];
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: allPools.length,
                  itemBuilder: (context, index) {
                    final pool = allPools[index];
                    if (pool == null) {
                      return ForgeNewGymCard(
                        onTap: () {
                          // TODO(reddwarf03): implement
                        },
                      );
                    }
                    return ForgeExistingGymCard(
                      pool: pool,
                      onTap: () {
                        context.go(
                          '/forge/${pool.id}/settings',
                          extra: pool,
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(20),
                child: MessageBox(
                  messageBoxType: MessageBoxType.warning,
                  content: Text(
                    error.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
