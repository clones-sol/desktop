import 'package:clones_desktop/ui/views/referral/bloc/provider.dart';
import 'package:clones_desktop/application/session/provider.dart';
import 'package:clones_desktop/ui/views/referral/layouts/components/referral_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReferralView extends ConsumerWidget {
  const ReferralView({super.key});

  static const String routeName = '/referral';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: const ReferralContent(),
    );
  }
} 