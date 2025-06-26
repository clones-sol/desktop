import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge/bloc/provider.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/components/forge_gym_overview_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/components/forge_gym_settings_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/components/forge_gym_tasks_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/layouts/components/forge_gym_uploads_tab.dart';

class ForgeGymDetail extends ConsumerStatefulWidget {
  const ForgeGymDetail({
    super.key,
    required this.pool,
    required this.onBack,
    required this.onRegenerateTasks,
  });
  final TrainingPool pool;
  final VoidCallback onBack;
  final VoidCallback onRegenerateTasks;

  @override
  ConsumerState<ForgeGymDetail> createState() => _ForgeGymDetailState();
}

class _ForgeGymDetailState extends ConsumerState<ForgeGymDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    Future(() async {
      ref.read(forgeNotifierProvider.notifier).setPool(widget.pool);
    });
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            TabBarView(
              controller: _tabController,
              children: [
                const ForgeGymOverviewTab(),
                const ForgeGymSettingsTab(),
                ForgeGymTasksTab(
                  onRegenerateTasks: widget.onRegenerateTasks,
                ),
                const ForgeGymUploadsTab(),
              ],
            ),
          ],
        );
      },
    );
  }
}
