import 'package:clones_desktop/application/pool.dart';
import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/ui/components/design_widget/message_box/message_box.dart';
import 'package:clones_desktop/ui/components/wallet_not_connected.dart';
import 'package:clones_desktop/ui/views/forge/bloc/provider.dart';
import 'package:clones_desktop/ui/views/forge/layouts/components/forge_existing_factory_card.dart';
import 'package:clones_desktop/ui/views/forge/layouts/components/forge_new_factory_card.dart';
import 'package:clones_desktop/ui/views/generate_factory/layouts/generate_factory_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgeView extends ConsumerWidget {
  const ForgeView({super.key});

  static const String routeName = '/forge';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }
    final poolsAsync = ref.watch(listPoolsProvider);
    return Stack(
      children: [
        Padding(
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
                const SizedBox(height: 20),
                poolsAsync.when(
                  data: (pools) {
                    final allPools = [null, ...pools];
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: allPools.length,
                      itemBuilder: (context, index) {
                        final pool = allPools[index];
                        if (pool == null) {
                          return const ForgeNewFactoryCard();
                        }
                        return ForgeExistingFactoryCard(
                          pool: pool,
                          onTap: () {
                            context.go(
                              '/forge/${pool.id}/general',
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
        ),
        if (ref.watch(forgeNotifierProvider).showGenerateFactoryModal)
          GenerateFactoryModal(
            onClose: () {
              ref
                  .read(forgeNotifierProvider.notifier)
                  .setShowGenerateFactoryModal(false);
            },
          ),
      ],
    );
  }
}
