import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/ui/components/card.dart';
import 'package:viralmind_flutter/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:viralmind_flutter/ui/components/responsive_two_column_layout.dart';
import 'package:viralmind_flutter/ui/views/forge_detail/layouts/components/forge_gym_header.dart';
import 'package:viralmind_flutter/utils/breakpoints.dart';

class ForgeGymDeployTab extends ConsumerStatefulWidget {
  const ForgeGymDeployTab({super.key});

  static const String routeName = '/forge/gym/deploy';

  @override
  ConsumerState<ForgeGymDeployTab> createState() => _ForgeGymDeployTabState();
}

class _ForgeGymDeployTabState extends ConsumerState<ForgeGymDeployTab> {
  final _nameController = TextEditingController();
  final _tickerController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _supplyPresetController = TextEditingController();
  final _minLiquidityController = TextEditingController();

  double _tokenGatedPercentage = 10;
  bool _autoGenerateTerms = false;
  bool _advancedOptionsExpanded = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
    _tickerController.addListener(() => setState(() {}));
    _descriptionController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tickerController.dispose();
    _descriptionController.dispose();
    _supplyPresetController.dispose();
    _minLiquidityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const ForgeGymHeader(),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > Breakpoints.desktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildMainForm(),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildSidebarInfo(),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildMainForm(),
                    const SizedBox(height: 24),
                    _buildSidebarInfo(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMainForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildGeneralInfoSection(),
        const SizedBox(height: 24),
        _buildTokenSetupSection(),
        const SizedBox(height: 24),
        _buildLegalSection(),
        const SizedBox(height: 24),
        _buildAdvancedOptionsSection(),
      ],
    );
  }

  Widget _buildSidebarInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DeploymentStatusCard(),
        const SizedBox(height: 24),
        _CostBreakdownCard(),
        const SizedBox(height: 24),
        _AgentPreviewCard(
          name: _nameController.text,
          ticker: _tickerController.text,
          description: _descriptionController.text,
        ),
      ],
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required Color color,
  }) {
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
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

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
          const SizedBox(height: 24),
          const ResponsiveTwoColumnLayout(
            children: [
              _FileUploadBox(
                label: 'Agent Logo',
                icon: Icons.cloud_upload,
                text: 'Click to upload image',
              ),
              SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTokenSetupSection() {
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
                controller: _supplyPresetController,
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
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Slider(
            value: _tokenGatedPercentage,
            max: 50,
            onChanged: (val) => setState(() => _tokenGatedPercentage = val),
            activeColor: VMColors.secondary,
            inactiveColor: Colors.grey.withValues(alpha: 0.5),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0%'),
                Text('25%'),
                Text('50%'),
              ],
            ),
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
                activeColor: VMColors.primary,
                checkColor: Colors.white,
              ),
              const Text('Auto-generate Terms & Conditions'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedOptionsSection() {
    return CardWidget(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (expanded) {
            setState(() {
              _advancedOptionsExpanded = expanded;
            });
          },
          title: _buildSectionHeader(
            icon: Icons.settings,
            title: 'Advanced Options',
            color: VMColors.containerIcon3,
          ),
          trailing: Icon(
            _advancedOptionsExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
          ),
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: ResponsiveTwoColumnLayout(
                children: [
                  _FormTextField(
                    label: 'HuggingFace API Key',
                    hint: 'Optional API key',
                    obscureText: true,
                  ),
                  _FormTextField(
                    label: 'Custom URL',
                    hint: 'https://myagent.com',
                    keyboardType: TextInputType.url,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 0.5,
            ),
            gradient: VMColors.gradientInputFormBackground,
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color!
                        .withValues(alpha: 0.2),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

// A widget for uploading files with a dashed border.
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        const SizedBox(height: 8),
        DottedBorder(
          options: RectDottedBorderOptions(
            dashPattern: const [10, 5],
            color: Colors.grey.withValues(alpha: 0.5),
            padding: const EdgeInsets.all(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(icon, size: 32, color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DeploymentStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deployment Status',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 16),
          _buildStatusItem(
            context: context,
            step: '1',
            label: 'Deploy SPL Token',
            buttonText: 'Sign Tx',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          _buildStatusItem(
            context: context,
            step: '2',
            label: 'Create Raydium Pool',
            buttonText: 'Pending',
            onPressed: null,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem({
    required BuildContext context,
    required String step,
    required String label,
    required String buttonText,
    required VoidCallback? onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .primaryContainer
            .withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey,
                child: Text(step, style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          if (onPressed != null)
            BtnPrimary(buttonText: buttonText, onTap: onPressed),
          if (onPressed == null)
            BtnPrimary(
              buttonText: buttonText,
              onTap: null,
              btnPrimaryType: BtnPrimaryType.dark,
            ),
        ],
      ),
    );
  }
}

class _CostBreakdownCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cost Breakdown',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 16),
          const _CostRow(label: 'Token Creation', cost: '0.1 SOL'),
          const SizedBox(height: 12),
          const _CostRow(label: 'Liquidity Pool', cost: '5.0 SOL'),
          const SizedBox(height: 12),
          const _CostRow(label: 'Platform Fee', cost: '0.05 SOL'),
          const SizedBox(height: 12),
          Divider(color: Colors.grey.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '5.15 SOL',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        Text(
          cost,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
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
  final String name;
  final String ticker;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Agent Preview',
            style: Theme.of(context).textTheme.titleSmall,
          ),
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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  ticker.isEmpty ? r'$ARTX' : ticker,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    description.isEmpty
                        ? 'Description will appear here...'
                        : description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
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
