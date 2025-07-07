import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/session/provider.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/wallet_not_connected.dart';
import 'package:viralmind_flutter/ui/views/demo_detail/bloc/provider.dart';
import 'package:viralmind_flutter/utils/format_time.dart';

class DemoDetailEvents extends ConsumerWidget {
  const DemoDetailEvents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    final demoDetail = ref.watch(demoDetailNotifierProvider);
    final events = demoDetail.events;
    final eventTypes = demoDetail.eventTypes;
    final enabledEventTypes = demoDetail.enabledEventTypes;
    final videoController = demoDetail.videoController;
    final startTime = demoDetail.startTime;

    final filteredEvents =
        events.where((e) => enabledEventTypes.contains(e.event)).toList();

    if (events.isEmpty) {
      return Center(
        child: Text(
          'No events to display.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: eventTypes.map((type) {
              final isEnabled = enabledEventTypes.contains(type);
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor:
                      isEnabled ? VMColors.tertiary : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: BorderSide(
                    color: isEnabled ? VMColors.primary : VMColors.tertiary,
                    width: 0.1,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
                onPressed: () {
                  ref
                      .read(demoDetailNotifierProvider.notifier)
                      .toggleEventType(type);
                },
                child: Text(
                  type,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: filteredEvents.length,
            itemBuilder: (context, index) {
              final event = filteredEvents[index];
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: VMColors.rewardInfo.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withAlpha(60),
                            blurRadius: 6,
                            offset: const Offset(
                              0,
                              3,
                            ),
                          ),
                        ],
                      ),
                      child: Text(
                        event.event,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: VMColors.rewardInfo,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        if (videoController != null && startTime > 0) {
                          final relativeTime = event.time - startTime;
                          videoController
                              .seekTo(Duration(milliseconds: relativeTime));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: VMColors.getEventTypeColor(event.event)
                              .withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withAlpha(60),
                              blurRadius: 6,
                              offset: const Offset(
                                0,
                                3,
                              ),
                            ),
                          ],
                        ),
                        child: Text(
                          formatTimeMs(event.time - startTime),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: VMColors.getEventTypeColor(event.event),
                              ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CardWidget(
                      padding: CardPadding.small,
                      variant: CardVariant.secondary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  const JsonEncoder.withIndent('  ')
                                      .convert(event.data),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontFamily: 'monospace',
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          BtnPrimary(
                            btnPrimaryType: BtnPrimaryType.outlinePrimary,
                            onTap: () async {
                              await Clipboard.setData(
                                ClipboardData(text: jsonEncode(event)),
                              );
                            },
                            buttonText: 'Copy',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
