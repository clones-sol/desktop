import 'package:clones_desktop/domain/models/forge_task/forge_app.dart';
import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/state.dart';
import 'package:clones_desktop/ui/views/manage_task/bloc/state.dart';
import 'package:riverpod/riverpod.dart';

mixin ForgeDetailSetters on AutoDisposeNotifier<ForgeDetailState> {
  void setPool(TrainingPool pool) {
    state = state.copyWith(pool: pool, hasUnsavedChanges: true);
  }

  void setViewModeTasks(ViewModeTasks viewModeTasks) {
    state = state.copyWith(viewModeTasks: viewModeTasks);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  void setFactoryName(String factoryName) {
    if (state.factoryName == factoryName) return;
    state = state.copyWith(factoryName: factoryName);
  }

  void setPricePerDemo(double pricePerDemo) {
    if (state.pricePerDemo == pricePerDemo) return;
    state = state.copyWith(pricePerDemo: pricePerDemo);
  }

  void setUploadLimitValue(int uploadLimitValue) {
    if (state.uploadLimitValue == uploadLimitValue) return;
    state = state.copyWith(uploadLimitValue: uploadLimitValue);
  }

  void setUploadLimitType(String uploadLimitType) {
    if (state.uploadLimitType == uploadLimitType) return;
    state = state.copyWith(uploadLimitType: uploadLimitType);
  }

  void setHasUnsavedChanges(bool hasUnsavedChanges) {
    if (state.hasUnsavedChanges == hasUnsavedChanges) return;
    state = state.copyWith(hasUnsavedChanges: hasUnsavedChanges);
  }

  void setFactoryStatus(TrainingPoolStatus factoryStatus) {
    if (state.factoryStatus == factoryStatus) return;
    state = state.copyWith(factoryStatus: factoryStatus);
  }

  void setIsUpdateFactoryStatusSuccess(bool isUpdateFactoryStatusSuccess) {
    if (state.isUpdateFactoryStatusSuccess == isUpdateFactoryStatusSuccess) {
      return;
    }
    state = state.copyWith(
      isUpdateFactoryStatusSuccess: isUpdateFactoryStatusSuccess,
    );
  }

  void setIsUpdatePoolSuccess(bool isUpdatePoolSuccess) {
    if (state.isUpdatePoolSuccess == isUpdatePoolSuccess) return;
    state = state.copyWith(isUpdatePoolSuccess: isUpdatePoolSuccess);
  }

  void setIsRefreshBalanceSuccess(bool isRefreshBalanceSuccess) {
    if (state.isRefreshBalanceSuccess == isRefreshBalanceSuccess) return;
    state = state.copyWith(isRefreshBalanceSuccess: isRefreshBalanceSuccess);
  }

  void setApps(List<ForgeApp> apps) {
    state = state.copyWith(apps: apps);
  }

  void setShowNewAppForm(bool showNewAppForm) {
    state = state.copyWith(showNewAppForm: showNewAppForm);
  }

  void setNewAppName(String newAppName) {
    state = state.copyWith(newAppName: newAppName);
  }

  void setNewAppDomain(String newAppDomain) {
    state = state.copyWith(newAppDomain: newAppDomain);
  }

  void setShowManageTaskModal(bool showManageTaskModal) {
    state = state.copyWith(showManageTaskModal: showManageTaskModal);
  }

  void setManageTaskModalType(ManageTaskModalType manageTaskModalType) {
    state = state.copyWith(manageTaskModalType: manageTaskModalType);
  }

  void setEditingTaskAppIdx(int? editingTaskAppIdx) {
    state = state.copyWith(editingTaskAppIdx: editingTaskAppIdx);
  }

  void setEditingTaskIdx(int? editingTaskIdx) {
    state = state.copyWith(editingTaskIdx: editingTaskIdx);
  }
}
