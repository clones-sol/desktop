import 'package:clones_desktop/application/factory.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/forge_factory_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgeFactoryDetailShell extends ConsumerWidget {
  const ForgeFactoryDetailShell({
    super.key,
    required this.factoryId,
    required this.child,
  });

  final String factoryId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factoryAsync = ref.watch(getFactoryProvider(factoryId: factoryId));
    return factoryAsync.when(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (factoryData) {
        return ForgeFactoryDetail(
          factory: factoryData,
          child: child,
        );
      },
      loading: () => const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 0.5,
          ),
        ),
      ),
      error: (err, stack) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}
