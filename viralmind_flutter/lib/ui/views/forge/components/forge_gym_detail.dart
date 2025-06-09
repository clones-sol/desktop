import 'package:flutter/material.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_overview_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_settings_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_tasks_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_uploads_tab.dart';

class ForgeGymDetail extends StatefulWidget {
  const ForgeGymDetail({super.key, required this.pool, this.onBack});
  final TrainingPool pool;
  final VoidCallback? onBack;

  @override
  State<ForgeGymDetail> createState() => _ForgeGymDetailState();
}

class _ForgeGymDetailState extends State<ForgeGymDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final bool _loading = false;
  String? _error;

  @override
  void initState() {
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack ?? () => Navigator.of(context).pop(),
        ),
        title: Text(widget.pool.name),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Settings'),
            Tab(text: 'Tasks'),
            Tab(text: 'Uploads'),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child:
                      Text(_error!, style: const TextStyle(color: Colors.red)))
              : TabBarView(
                  controller: _tabController,
                  children: [
                    ForgeGymOverviewTab(pool: widget.pool),
                    ForgeGymSettingsTab(pool: widget.pool),
                    ForgeGymTasksTab(pool: widget.pool),
                    ForgeGymUploadsTab(pool: widget.pool),
                  ],
                ),
    );
  }
}
