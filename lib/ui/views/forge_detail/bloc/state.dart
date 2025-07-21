import 'package:clones_desktop/domain/models/forge_task/forge_app.dart';
import 'package:clones_desktop/domain/models/training_pool.dart';
import 'package:clones_desktop/ui/views/manage_task/bloc/state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum ViewModeTasks {
  edit,
  preview,
}

@freezed
class ForgeDetailState with _$ForgeDetailState {
  const factory ForgeDetailState({
    @Default('') String gymName,
    @Default(1) double pricePerDemo,
    @Default(10) int uploadLimitValue,
    @Default('none') String uploadLimitType,
    @Default(TrainingPoolStatus.noFunds) TrainingPoolStatus? gymStatus,
    TrainingPool? pool,
    @Default(ViewModeTasks.edit) ViewModeTasks viewModeTasks,
    String? error,
    @Default([]) List<ForgeApp> apps,
    @Default(false) bool isUpdateGymStatusSuccess,
    @Default(false) bool isUpdatePoolSuccess,
    @Default(false) bool isRefreshBalanceSuccess,
    @Default(false) bool hasUnsavedChanges,
    @Default(false) bool showNewAppForm,
    @Default(false) bool showManageTaskModal,
    @Default(ManageTaskModalType.create)
    ManageTaskModalType manageTaskModalType,
    String? newAppName,
    String? newAppDomain,
    int? editingTaskAppIdx,
    int? editingTaskIdx,
  }) = _ForgeDetailState;
  const ForgeDetailState._();
}
