import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viralmind_flutter/application/pool.dart';
import 'package:viralmind_flutter/domain/models/upload/upload_limit.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/setters.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/bloc/state.dart';

part 'provider.g.dart';

@riverpod
class ForgeDetailNotifier extends _$ForgeDetailNotifier
    with ForgeDetailSetters {
  ForgeDetailNotifier();

  @override
  ForgeDetailState build() {
    return const ForgeDetailState();
  }

  Future<void> refreshBalance() async {
    setIsRefreshBalanceSuccess(false);
    setError(null);
    final pool = state.pool;
    if (pool == null) {
      throw Exception('Pool not found');
    }

    try {
      await ref.read(
        refreshPoolProvider(
          poolId: pool.id,
        ).future,
      );
      setIsRefreshBalanceSuccess(true);
    } catch (e) {
      setError(e.toString());
    }

    // TODO(reddwarf0): Need in backend a getPool function
    final pools = await ref.refresh(listPoolsProvider.future);
    final newPool = pools.firstWhere((p) => p.id == state.pool?.id);
    ref.read(forgeDetailNotifierProvider.notifier).setPool(newPool);
  }

  Future<void> updateGymStatus() async {
    setIsUpdateGymStatusSuccess(false);
    try {
      await _updatePool();
      setIsUpdateGymStatusSuccess(true);

      // TODO(reddwarf0): Need in backend a getPool function
      final pools = await ref.refresh(listPoolsProvider.future);
      final newPool = pools.firstWhere((p) => p.id == state.pool?.id);
      ref.read(forgeDetailNotifierProvider.notifier).setPool(newPool);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> updatePool() async {
    setIsUpdatePoolSuccess(false);
    try {
      await _updatePool();
      setIsUpdatePoolSuccess(true);

      // TODO(reddwarf0): Need in backend a getPool function
      final pools = await ref.refresh(listPoolsProvider.future);
      final newPool = pools.firstWhere((p) => p.id == state.pool?.id);
      ref.read(forgeDetailNotifierProvider.notifier).setPool(newPool);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> _updateAlertEmail() async {
    ref.read(
      updatePoolEmailProvider(
        poolId: state.pool?.id ?? '',
        email: state.alertEmail,
      ),
    );
  }

  Future<void> _updatePool() async {
    setError(null);
    final pool = state.pool;
    if (pool == null) {
      throw Exception('Pool not found');
    }

    await ref.read(
      updatePoolProvider(
        poolId: pool.id,
        poolName: state.gymName,
        status: state.gymStatus,
        skills: pool.skills,
        pricePerDemo: state.pricePerDemo,
        uploadLimit: state.uploadLimitType == 'none'
            ? null
            : UploadLimit(
                type: state.uploadLimitValue,
                limitType:
                    UploadLimitTypeExtension.parse(state.uploadLimitType) ??
                        UploadLimitType.perTask,
              ),
      ).future,
    );

    if ((pool.ownerEmail == null && state.alertEmail.isNotEmpty) ||
        (pool.ownerEmail != null &&
            state.alertEmail.isNotEmpty &&
            pool.ownerEmail != state.alertEmail)) {
      await _updateAlertEmail();
    }
  }
}
