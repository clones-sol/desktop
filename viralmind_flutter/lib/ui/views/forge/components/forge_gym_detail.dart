import 'package:flutter/material.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/training_pool.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_overview_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_settings_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_tasks_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/forge_gym_uploads_tab.dart';
import 'package:viralmind_flutter/ui/views/forge/components/generate_gym_modal.dart';

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

  // Ajout pour la modal de génération
  bool _showGenerateGymModal = false;

  // Pour rafraîchir les tâches après génération
  void _handleRegenerateTasks() {
    setState(() => _showGenerateGymModal = true);
  }

  void _handleCloseGenerateGymModal() {
    setState(() => _showGenerateGymModal = false);
  }

  void _handleSaveGenerateGymModal(Map<String, dynamic> generatedResponse) {
    // TODO: Mettre à jour les apps du pool avec la réponse générée
    setState(() => _showGenerateGymModal = false);
    // TODO: Rafraîchir la liste des apps dans ForgeGymTasksTab si besoin
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: TabBar(
              indicatorColor: VMColors.secondary,
              dividerColor: Colors.transparent,
              labelColor: VMColors.secondary,
              unselectedLabelColor: VMColors.secondaryText,
              controller: _tabController,
              tabAlignment: TabAlignment.fill,
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
            onSkillsChange:
                (skills) {}, // Optionnel: mettre à jour les skills du pool
            onClose: _handleCloseGenerateGymModal,
            onSave: _handleSaveGenerateGymModal,
          ),
      ],
    );
  }
}
