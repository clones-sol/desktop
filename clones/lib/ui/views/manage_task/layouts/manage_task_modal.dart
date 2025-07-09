import 'dart:ui';

import 'package:clones/assets.dart';
import 'package:clones/domain/models/forge_task/forge_task_item.dart';
import 'package:clones/ui/components/card.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones/ui/views/manage_task/bloc/provider.dart';
import 'package:clones/ui/views/manage_task/bloc/state.dart';
import 'package:clones/ui/views/manage_task/layouts/components/manage_task_modal_price_per_demo.dart';
import 'package:clones/ui/views/manage_task/layouts/components/manage_task_modal_prompt.dart';
import 'package:clones/ui/views/manage_task/layouts/components/manage_task_modal_upload_limit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageTaskModal extends ConsumerStatefulWidget {
  const ManageTaskModal({
    super.key,
    required this.tokenSymbol,
    required this.onDone,
    required this.onClose,
    required this.modalType,
    this.task,
  });
  final String tokenSymbol;
  final void Function(ForgeTaskItem? task) onDone;
  final VoidCallback onClose;
  final ManageTaskModalType modalType;
  final ForgeTaskItem? task;

  @override
  ConsumerState<ManageTaskModal> createState() => _ManageTaskModalState();
}

class _ManageTaskModalState extends ConsumerState<ManageTaskModal> {
  @override
  void initState() {
    Future(() async {
      ref
          .read(manageTaskNotifierProvider.notifier)
          .setModalType(widget.modalType);
      if (widget.task != null) {
        ref.read(manageTaskNotifierProvider.notifier)
          ..setPrompt(widget.task!.prompt)
          ..setPricePerDemo(widget.task!.rewardLimit ?? 0)
          ..setUploadLimitValue(widget.task!.uploadLimit ?? 0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),
        ),
        Center(
          child: CardWidget(
            padding: CardPadding.large,
            child: SizedBox(
              width: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.modalType == ManageTaskModalType.create
                            ? 'Create a new task'
                            : 'Edit task',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: () => widget.onClose(),
                        icon: Icon(
                          Icons.close,
                          color: VMColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ManageTaskModalPrompt(),
                  const SizedBox(height: 20),
                  ManageTaskModalPricePerDemo(
                    tokenSymbol: widget.tokenSymbol,
                  ),
                  const SizedBox(height: 20),
                  const ManageTaskModalUploadLimit(),
                  const SizedBox(height: 20),
                  _footerButtons(ref),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerButtons(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BtnPrimary(
          buttonText: 'Cancel',
          onTap: widget.onClose,
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        const SizedBox(width: 10),
        BtnPrimary(
          buttonText: widget.modalType == ManageTaskModalType.create
              ? 'Add task'
              : 'Save task',
          onTap: () {
            final state = ref.read(manageTaskNotifierProvider);
            final ForgeTaskItem result;
            if (widget.modalType == ManageTaskModalType.create) {
              result = ForgeTaskItem(
                prompt: state.prompt,
                rewardLimit: state.pricePerDemo,
                uploadLimit: state.uploadLimitValue,
              );
            } else {
              result = widget.task!.copyWith(
                prompt: state.prompt,
                rewardLimit: state.pricePerDemo,
                uploadLimit: state.uploadLimitValue,
              );
            }
            widget.onDone(result);
          },
          isLocked: ref.watch(manageTaskNotifierProvider).prompt.isEmpty,
        ),
      ],
    );
  }
}
