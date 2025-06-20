import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/bloc/state.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/layouts/generate_gym_modal_step1.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/layouts/generate_gym_modal_step2.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/layouts/generate_gym_modal_step3.dart';

class GenerateGymModal extends ConsumerStatefulWidget {
  const GenerateGymModal({
    super.key,
    required this.onClose,
    this.skills,
  });
  final VoidCallback onClose;
  final String? skills;

  @override
  ConsumerState<GenerateGymModal> createState() => _GenerateGymModalState();
}

class _GenerateGymModalState extends ConsumerState<GenerateGymModal> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (widget.skills != null) {
        ref
            .read(generateGymNotifierProvider.notifier)
            .setSkills(widget.skills!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final generateGym = ref.watch(generateGymNotifierProvider);
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
              width: generateGym.currentStep == GenerateGymStep.generating
                  ? MediaQuery.of(context).size.width * 0.4
                  : MediaQuery.of(context).size.width * 0.8,
              height: generateGym.currentStep == GenerateGymStep.preview
                  ? MediaQuery.of(context).size.height * 0.8
                  : null,
              child: Column(
                mainAxisSize: generateGym.currentStep == GenerateGymStep.preview
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Generate a gym',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: widget.onClose,
                        icon: Icon(
                          Icons.close,
                          color: VMColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (generateGym.currentStep == GenerateGymStep.input) ...[
                    GenerateGymModalStep1(
                      onClose: widget.onClose,
                    ),
                  ] else if (generateGym.currentStep ==
                      GenerateGymStep.generating) ...[
                    const GenerateGymModalStep2(),
                  ] else if (generateGym.currentStep ==
                      GenerateGymStep.preview) ...[
                    Expanded(
                      child: GenerateGymModalStep3(
                        onClose: widget.onClose,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
