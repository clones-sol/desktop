import 'package:clones_desktop/application/agent.dart';
import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/domain/models/agent/agent_deployment.dart';
import 'package:clones_desktop/domain/models/agent/agent_legal.dart';
import 'package:clones_desktop/domain/models/agent/agent_tokenomics.dart';
import 'package:clones_desktop/domain/models/agent/deployment_version.dart';
import 'package:clones_desktop/domain/models/agent/factory_agent.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:clones_desktop/ui/components/responsive_two_column_layout.dart';
import 'package:clones_desktop/ui/views/forge_detail/bloc/provider.dart';
import 'package:clones_desktop/ui/views/forge_detail/layouts/components/forge_factory_header.dart';
import 'package:clones_desktop/utils/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// Main widget that fetches agent data and delegates to the appropriate view.
class ForgeFactoryDeployTab extends ConsumerWidget {
  const ForgeFactoryDeployTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pool = ref.watch(forgeDetailNotifierProvider).pool;
    if (pool == null) return const SizedBox.shrink();

    // Note: The 'agentByPoolIdProvider' is assumed to exist.
    // It should fetch the agent data for the given poolId.
    // It returns Future<FactoryAgent?>
    final agentAsync = ref.watch(agentByPoolIdProvider(pool.id));

    return agentAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text('Error loading agent: $err'),
      ),
      data: (agent) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ForgeFactoryHeader(),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > Breakpoints.desktop;
                  final mainContent = agent == null
                      ? _AgentCreationForm(poolId: pool.id)
                      : _AgentManagementView(agent: agent);

                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: mainContent,
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _Sidebar(agent: agent),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        mainContent,
                        const SizedBox(height: 24),
                        _Sidebar(agent: agent),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// Manages the view based on the agent's current status.
class _AgentManagementView extends ConsumerWidget {
  const _AgentManagementView({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to real-time updates for the agent
    final _ = ref.watch(agentUpdatesProvider(agent.id));

    switch (agent.deployment.status) {
      case AgentDeploymentStatus.draft:
        return _AgentCreationForm(poolId: agent.poolId, existingAgent: agent);

      case AgentDeploymentStatus.pendingTokenSignature:
      case AgentDeploymentStatus.tokenCreated:
      case AgentDeploymentStatus.pendingPoolSignature:
        return _DeploymentInProgressView(agent: agent);

      case AgentDeploymentStatus.deployed:
        return _DeployedView(agent: agent);

      case AgentDeploymentStatus.failed:
        return _FailedView(agent: agent);

      case AgentDeploymentStatus.deactivated:
      case AgentDeploymentStatus.archived:
        return CardWidget(
          child: Center(
            child: Text(
              'This agent is currently ${agent.deployment.status.name}.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
    }
  }
}

// Handles the creation and draft form for agent configuration.
class _AgentCreationForm extends ConsumerStatefulWidget {
  const _AgentCreationForm({required this.poolId, this.existingAgent});
  final String poolId;
  final FactoryAgent? existingAgent;

  @override
  ConsumerState<_AgentCreationForm> createState() => __AgentCreationFormState();
}

class __AgentCreationFormState extends ConsumerState<_AgentCreationForm> {
  final _nameController = TextEditingController();
  final _tickerController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _supplyController = TextEditingController();
  final _minLiquidityController = TextEditingController();

  double _tokenGatedPercentage = 10;
  bool _autoGenerateTerms = true;

  @override
  void initState() {
    super.initState();
    final agent = widget.existingAgent;
    if (agent != null) {
      _nameController.text = agent.name;
      _tickerController.text = agent.ticker;
      _descriptionController.text = agent.description;
      _supplyController.text = agent.tokenomics.supply.toString();
      _minLiquidityController.text =
          agent.tokenomics.minLiquiditySol.toString();
      _tokenGatedPercentage = agent.tokenomics.gatedPercentage;
      _autoGenerateTerms = agent.legal.autoGeneratedTerms;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tickerController.dispose();
    _descriptionController.dispose();
    _supplyController.dispose();
    _minLiquidityController.dispose();
    super.dispose();
  }

  void _submit() {
    final isDraft = widget.existingAgent != null;
    final agentData = {
      'name': _nameController.text,
      'ticker': _tickerController.text,
      'description': _descriptionController.text,
      'tokenomics': AgentTokenomics(
        supply: int.tryParse(_supplyController.text) ?? 0,
        minLiquiditySol: double.tryParse(_minLiquidityController.text) ?? 0,
        gatedPercentage: _tokenGatedPercentage,
      ),
      'legal': AgentLegal(
        autoGeneratedTerms: _autoGenerateTerms,
      ),
    };

    if (isDraft) {
      // Call provider to initiate deployment
      ref.read(initiateDeploymentProvider(widget.existingAgent!.id).future);
    } else {
      // Call provider to create agent
      ref.read(
        createAgentProvider(
          poolId: widget.poolId,
          agentName: agentData['name']! as String,
          ticker: agentData['ticker']! as String,
          description: agentData['description']! as String,
          tokenomics: agentData['tokenomics']! as AgentTokenomics,
          legal: agentData['legal']! as AgentLegal,
        ).future,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildGeneralInfoSection(),
        const SizedBox(height: 24),
        _buildTokenSetupSection(),
        const SizedBox(height: 24),
        _buildLegalSection(),
        const SizedBox(height: 24),
        //_buildAdvancedOptionsSection(),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: BtnPrimary(
            buttonText: widget.existingAgent == null
                ? 'Create Agent Draft'
                : 'Initiate Deployment',
            onTap: _submit,
          ),
        ),
      ],
    );
  }

  // Methods to build form sections, adapted from the original file
  Widget _buildGeneralInfoSection() {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.info_outline,
            title: 'General Information',
            color: VMColors.containerIcon2,
          ),
          const SizedBox(height: 24),
          ResponsiveTwoColumnLayout(
            children: [
              _FormTextField(
                label: 'Agent Name',
                hint: 'My AI Agent',
                controller: _nameController,
              ),
              _FormTextField(
                label: 'Ticker',
                hint: r'$ARTX',
                controller: _tickerController,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _FormTextField(
            label: 'Description',
            hint: "Describe your AI agent's capabilities and purpose...",
            controller: _descriptionController,
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildTokenSetupSection() {
    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.paid,
            title: 'Token Setup',
            color: VMColors.containerIcon1,
          ),
          const SizedBox(height: 24),
          ResponsiveTwoColumnLayout(
            children: [
              _FormTextField(
                label: 'Supply Preset',
                hint: '1000000',
                controller: _supplyController,
                keyboardType: TextInputType.number,
              ),
              _FormTextField(
                label: 'Min Liquidity (SOL)',
                hint: '5.0',
                controller: _minLiquidityController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Token Gated Percentage: ${_tokenGatedPercentage.toStringAsFixed(0)}%',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Slider(
            value: _tokenGatedPercentage,
            max: 50,
            onChanged: (val) => setState(() => _tokenGatedPercentage = val),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalSection() {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.gavel,
            title: 'Legal',
            color: VMColors.containerIcon3,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _autoGenerateTerms,
                onChanged: (val) => setState(() => _autoGenerateTerms = val!),
              ),
              const Text('Auto-generate Terms & Conditions'),
            ],
          ),
        ],
      ),
    );
  }
}

// View for when deployment is in progress.
class _DeploymentInProgressView extends ConsumerWidget {
  const _DeploymentInProgressView({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _DeploymentStepsIndicator(status: agent.deployment.status),
        const SizedBox(height: 24),
        _SignTransactionCard(agent: agent),
        const SizedBox(height: 24),
        _StatusFeedCard(agent: agent),
      ],
    );
  }
}

// View for a successfully deployed agent.
class _DeployedView extends ConsumerWidget {
  const _DeployedView({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _DeploymentStepsIndicator(status: agent.deployment.status),
        const SizedBox(height: 24),
        _AgentSummaryCard(agent: agent),
        const SizedBox(height: 24),
        _ManageVersionsCard(agent: agent),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BtnPrimary(
              buttonText: 'Deactivate',
              onTap: () {
                ref.read(deactivateAgentProvider(agent.id));
              },
              btnPrimaryType: BtnPrimaryType.dark,
            ),
          ],
        ),
      ],
    );
  }
}

// View for a failed deployment.
class _FailedView extends ConsumerWidget {
  const _FailedView({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        children: [
          Icon(Icons.error_outline, color: theme.colorScheme.error, size: 48),
          const SizedBox(height: 16),
          Text('Deployment Failed', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            agent.deployment.lastError ?? 'An unknown error occurred.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          BtnPrimary(
            buttonText: 'Retry Deployment',
            onTap: () {
              ref.read(retryDeploymentProvider(agent.id).future);
            },
          ),
        ],
      ),
    );
  }
}

// ---- SUB-WIDGETS ----

class _Sidebar extends StatelessWidget {
  const _Sidebar({this.agent});
  final FactoryAgent? agent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (agent != null &&
            agent!.deployment.status != AgentDeploymentStatus.draft)
          _SignTransactionCard(agent: agent!),
        if (agent == null ||
            agent!.deployment.status == AgentDeploymentStatus.draft)
          _CostBreakdownCard(),
        const SizedBox(height: 24),
        if (agent != null) _AgentPreviewCard.fromAgent(agent!),
      ],
    );
  }
}

class _DeploymentStepsIndicator extends StatelessWidget {
  const _DeploymentStepsIndicator({required this.status});
  final AgentDeploymentStatus status;

  @override
  Widget build(BuildContext context) {
    final steps = [
      'Draft',
      'Token',
      'Pool',
      'Deployed',
    ];
    int currentStep;
    switch (status) {
      case AgentDeploymentStatus.draft:
        currentStep = 0;
        break;
      case AgentDeploymentStatus.pendingTokenSignature:
      case AgentDeploymentStatus.tokenCreated:
        currentStep = 1;
        break;
      case AgentDeploymentStatus.pendingPoolSignature:
        currentStep = 2;
        break;
      case AgentDeploymentStatus.deployed:
        currentStep = 3;
        break;
      case AgentDeploymentStatus.failed:
        currentStep = 0;
        break;
      case AgentDeploymentStatus.deactivated:
      case AgentDeploymentStatus.archived:
        currentStep = 0;
        break;
    }

    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deployment Progress',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 24),
          LinearPercentIndicator(
            percent: (currentStep + 1) / steps.length,
            lineHeight: 8,
            barRadius: const Radius.circular(4),
            progressColor: VMColors.primary,
            backgroundColor: Colors.grey.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: steps.asMap().entries.map((entry) {
              final index = entry.key;
              final label = entry.value;
              final isCompleted = index <= currentStep;
              return Text(
                label,
                style: TextStyle(
                  fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                  color: isCompleted ? VMColors.primary : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SignTransactionCard extends ConsumerWidget {
  const _SignTransactionCard({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final canSignToken =
        agent.deployment.status == AgentDeploymentStatus.pendingTokenSignature;
    final canSignPool =
        agent.deployment.status == AgentDeploymentStatus.pendingPoolSignature;
    final tokenDone = agent.deployment.status.index >
        AgentDeploymentStatus.pendingTokenSignature.index;
    final poolDone = agent.deployment.status.index >
        AgentDeploymentStatus.pendingPoolSignature.index;

    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Actions Required', style: theme.textTheme.titleSmall),
          const SizedBox(height: 16),
          _buildStatusItem(
            context: context,
            step: '1',
            label: 'Deploy SPL Token',
            isDone: tokenDone,
            onPressed: canSignToken
                ? () {
                    // Call provider to get unsigned tx and sign it
                  }
                : null,
          ),
          const SizedBox(height: 16),
          _buildStatusItem(
            context: context,
            step: '2',
            label: 'Create Raydium Pool',
            isDone: poolDone,
            onPressed: canSignPool
                ? () {
                    // Call provider to get unsigned tx and sign it
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem({
    required BuildContext context,
    required String step,
    required String label,
    required bool isDone,
    required VoidCallback? onPressed,
  }) {
    final theme = Theme.of(context);
    String buttonText;
    if (isDone) {
      buttonText = 'Completed';
    } else if (onPressed != null) {
      buttonText = 'Sign Tx';
    } else {
      buttonText = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: isDone ? VMColors.primary : Colors.grey,
                child: isDone
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : Text(
                        step,
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
              const SizedBox(width: 12),
              Text(label, style: theme.textTheme.bodyMedium),
            ],
          ),
          BtnPrimary(
            buttonText: buttonText,
            onTap: onPressed,
            btnPrimaryType: onPressed == null
                ? BtnPrimaryType.dark
                : BtnPrimaryType.primary,
          ),
        ],
      ),
    );
  }
}

class _StatusFeedCard extends ConsumerWidget {
  const _StatusFeedCard({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updates = ref.watch(agentUpdatesProvider(agent.id));
    final theme = Theme.of(context);

    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Real-Time Status', style: theme.textTheme.titleSmall),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: updates.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Text('Error listening for updates: $err'),
              data: (message) {
                // This is a simplified version. A real implementation
                // would maintain a list of messages.
                return ListView(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.info_outline,
                        color: VMColors.primary,
                      ),
                      title: Text(message.toString()), // Simplified
                      subtitle: Text(DateTime.now().toIso8601String()),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AgentSummaryCard extends StatelessWidget {
  const _AgentSummaryCard({required this.agent});
  final FactoryAgent agent;
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.summarize,
            title: 'Agent Summary',
            color: VMColors.containerIcon1,
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.tag),
            title: const Text('Name'),
            subtitle: Text(agent.name),
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: const Text('Ticker'),
            subtitle: Text(agent.ticker),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Description'),
            subtitle: Text(agent.description),
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Endpoint'),
            subtitle:
                Text(agent.deployment.versions.first.customUrl ?? 'Not set'),
          ),
        ],
      ),
    );
  }
}

class _ManageVersionsCard extends ConsumerWidget {
  const _ManageVersionsCard({required this.agent});
  final FactoryAgent agent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            icon: Icons.layers,
            title: 'Manage Versions',
            color: VMColors.containerIcon3,
          ),
          const SizedBox(height: 16),
          const Text('Add New Version'),
          const SizedBox(height: 8),
          const _FormTextField(label: 'Version Tag', hint: 'e.g., v1.1-beta'),
          const SizedBox(height: 16),
          const _FormTextField(
            label: 'Custom URL',
            hint: 'https://new.endpoint.com',
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: BtnPrimary(buttonText: 'Add Version', onTap: () {}),
          ),
          const SizedBox(height: 24),
          const Text('Active Versions'),
          const Divider(),
          ...agent.deployment.versions.map(
            (v) => ListTile(
              title: Text(v.versionTag),
              subtitle: Text(v.customUrl ?? 'No URL'),
              trailing: v.status == DeploymentVersionStatus.active
                  ? const Chip(label: Text('Active'))
                  : TextButton(
                      onPressed: () {},
                      child: const Text('Set Active'),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CostBreakdownCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cost Breakdown', style: theme.textTheme.titleSmall),
          const SizedBox(height: 16),
          const _CostRow(label: 'Token Creation', cost: '~0.1 SOL'),
          const SizedBox(height: 12),
          const _CostRow(label: 'Liquidity Pool', cost: '~5.0 SOL'),
          const SizedBox(height: 12),
          const _CostRow(label: 'Platform Fee', cost: '~0.05 SOL'),
          const SizedBox(height: 12),
          Divider(color: Colors.grey.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Est.',
                style: theme.textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '~5.15 SOL',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: VMColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CostRow extends StatelessWidget {
  const _CostRow({required this.label, required this.cost});
  final String label;
  final String cost;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodySmall),
        Text(
          cost,
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _AgentPreviewCard extends StatelessWidget {
  const _AgentPreviewCard({
    required this.name,
    required this.ticker,
    required this.description,
  });

  factory _AgentPreviewCard.fromAgent(FactoryAgent agent) {
    return _AgentPreviewCard(
      name: agent.name,
      ticker: agent.ticker,
      description: agent.description,
    );
  }

  final String name;
  final String ticker;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Agent Preview', style: theme.textTheme.titleSmall),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: VMColors.gradientBtnPrimary,
                  ),
                  child: const Icon(Icons.adb, color: Colors.white, size: 32),
                ),
                const SizedBox(height: 12),
                Text(
                  name.isEmpty ? 'My AI Agent' : name,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  ticker.isEmpty ? r'$ARTX' : ticker,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    description.isEmpty
                        ? 'Description will appear here...'
                        : description,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSectionHeader({
  required IconData icon,
  required String title,
  required Color color,
}) {
  return Builder(
    builder: (context) {
      final theme = Theme.of(context);
      return Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color.withValues(alpha: 0.7), size: 20),
          ),
          const SizedBox(width: 10),
          Text(title, style: theme.textTheme.titleSmall),
        ],
      );
    },
  );
}

class _FormTextField extends StatelessWidget {
  const _FormTextField({
    required this.label,
    required this.hint,
    this.controller,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardType,
  });
  final String label;
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: theme.colorScheme.primaryContainer,
              width: 0.5,
            ),
            gradient: VMColors.gradientInputFormBackground,
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              hintText: hint,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color:
                    theme.textTheme.bodyMedium?.color!.withValues(alpha: 0.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FileUploadBox extends StatelessWidget {
  const _FileUploadBox({
    required this.label,
    required this.icon,
    required this.text,
  });
  final String label;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Text(label, style: theme.textTheme.titleSmall)]),
        const SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Column(
                children: [
                  Icon(icon, size: 32, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(text, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
