import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/forge_gym_detail.dart';

class ForgeGymDetailShell extends ConsumerWidget {
  const ForgeGymDetailShell({
    super.key,
    required this.poolId,
    required this.child,
  });

  final String poolId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poolAsync = ref.watch(poolProvider(poolId));
    return poolAsync.when(
      data: (pool) {
        return ForgeGymDetail(
          pool: pool,
          child: child,
        );
      },
      loading: () => const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: CircularProgressIndicator(),
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
