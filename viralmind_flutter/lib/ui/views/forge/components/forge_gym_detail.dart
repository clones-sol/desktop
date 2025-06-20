import 'package:flutter/material.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_overview_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_settings_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_tasks_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_uploads_tab.dart';
import 'package:viralmind_flutter/ui/views/generate_gym/layouts/generate_gym_modal.dart';

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

  // To show the generate gym modal
  bool _showGenerateGymModal = false;

  // To refresh the tasks after generation
  void _handleRegenerateTasks() {
    setState(() => _showGenerateGymModal = true);
  }

  void _handleCloseGenerateGymModal() {
    setState(() => _showGenerateGymModal = false);
  }

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
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Text(
                        _error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        ForgeGymOverviewTab(pool: widget.pool),
                        ForgeGymSettingsTab(pool: widget.pool),
                        ForgeGymTasksTab(
                          pool: widget.pool,
                          onRegenerateTasks: _handleRegenerateTasks,
                        ),
                        ForgeGymUploadsTab(pool: widget.pool),
                      ],
                    ),
        ),
        if (_showGenerateGymModal)
          GenerateGymModal(
            skills: widget.pool.skills,
            onClose: _handleCloseGenerateGymModal,
          ),
      ],
    );
  }
}
