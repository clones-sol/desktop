import 'package:clones_desktop/assets.dart';
import 'package:clones_desktop/ui/components/card.dart';
import 'package:clones_desktop/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HubView extends ConsumerWidget {
  const HubView({super.key});

  static const String routeName = '/hub';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const SizedBox(height: 20),
            const _SearchAndFilters(),
            const SizedBox(height: 20),
            const _StatsOverview(),
            const SizedBox(height: 20),
            _AgentsGrid(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nexus',
              style: theme.textTheme.titleLarge,
            ),
            Text(
              'Tokenizing CUA Agents for the Decentralized Economy',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class _SearchAndFilters extends StatelessWidget {
  const _SearchAndFilters();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 0.5,
              ),
              gradient: ClonesColors.gradientInputFormBackground,
            ),
            child: TextField(
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText:
                    'Search for an agent by application, task, or name...',
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color!
                      .withValues(alpha: 0.2),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ClonesColors.secondaryText,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 12,
            children: [
              _FilterButton(
                icon: FontAwesomeIcons.desktop,
                label: 'Application',
                isActive: true,
              ),
              _FilterButton(
                icon: FontAwesomeIcons.listCheck,
                label: 'Task Type',
              ),
              _FilterButton(
                icon: FontAwesomeIcons.solidCircle,
                label: 'Status',
                iconColor: ClonesColors.rewardInfo,
              ),
              _FilterButton(
                icon: FontAwesomeIcons.lock,
                label: 'Token Gated',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.icon,
    required this.label,
    this.isActive = false,
    this.iconColor,
  });
  final IconData icon;
  final String label;
  final bool isActive;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: () {},
      icon: FaIcon(
        icon,
        size: 14,
        color: iconColor ?? ClonesColors.secondaryText,
      ),
      label: Row(
        children: [
          Text(label, style: theme.textTheme.bodyMedium),
          const SizedBox(width: 8),
          const FaIcon(FontAwesomeIcons.chevronDown, size: 12),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive
            ? ClonesColors.primary.withValues(alpha: 0.5)
            : Colors.black.withValues(alpha: 0.2),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isActive
                ? ClonesColors.primary
                : Colors.white.withValues(alpha: 0.2),
          ),
        ),
      ),
    );
  }
}

class _StatsOverview extends StatelessWidget {
  const _StatsOverview();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1200
            ? 4
            : (constraints.maxWidth > 600 ? 2 : 1);
        return GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 2.5,
          ),
          children: const [
            _StatCard(
              icon: FontAwesomeIcons.robot,
              value: '47',
              label: 'Active Agents',
              color: ClonesColors.containerIcon2,
            ),
            _StatCard(
              icon: FontAwesomeIcons.coins,
              value: '2.4M',
              label: 'Total Volume',
              color: ClonesColors.containerIcon1,
            ),
            _StatCard(
              icon: FontAwesomeIcons.link,
              value: '89%',
              label: 'HuggingFace Connected',
              color: ClonesColors.containerIcon4,
            ),
            _StatCard(
              icon: FontAwesomeIcons.chartLine,
              value: '+23%',
              label: 'This Week',
              color: ClonesColors.containerIcon3,
            ),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardWidget(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AgentInfo {
  _AgentInfo({
    required this.name,
    required this.ticker,
    required this.description,
    required this.icon,
    required this.tags,
    required this.buyTicker,
    required this.isBuyable,
  });
  final String name;
  final String ticker;
  final String description;
  final IconData icon;
  final List<String> tags;
  final String buyTicker;
  final bool isBuyable;
}

class _AgentsGrid extends StatelessWidget {
  final List<_AgentInfo> agents = [
    _AgentInfo(
      name: 'DesignMaster',
      ticker: r'$DSGN',
      description:
          'AI agent for automated Photoshop design tasks and image enhancement workflows.',
      icon: FontAwesomeIcons.paintbrush,
      tags: ['Token Deployed', 'Active Pool', 'HuggingFace'],
      buyTicker: r'$DSGN',
      isBuyable: true,
    ),
    _AgentInfo(
      name: 'ExcelBot Pro',
      ticker: r'$XLPRO',
      description:
          'Advanced Excel automation for data analysis, reporting and complex calculations.',
      icon: FontAwesomeIcons.table,
      tags: ['Token Deployed', 'Pool Pending', 'Token Gated'],
      buyTicker: '',
      isBuyable: false,
    ),
    _AgentInfo(
      name: 'ContentGenie',
      ticker: r'$CGENIE',
      description:
          'AI-powered content creation for social media, blogs and marketing materials.',
      icon: FontAwesomeIcons.wandMagic,
      tags: ['Fully Deployed', 'Custom URL'],
      buyTicker: r'$CGENIE',
      isBuyable: true,
    ),
    _AgentInfo(
      name: 'CodeAssist',
      ticker: r'$CODE',
      description:
          'Smart coding assistant for debugging, optimization and code generation.',
      icon: FontAwesomeIcons.code,
      tags: ['Token Deployed', 'Config Pending'],
      buyTicker: '',
      isBuyable: false,
    ),
    _AgentInfo(
      name: 'MarketMage',
      ticker: r'$MAGE',
      description:
          'AI for crypto market analysis, trend prediction and automated trading.',
      icon: FontAwesomeIcons.chartPie,
      tags: ['Fully Deployed', 'HuggingFace'],
      buyTicker: r'$MAGE',
      isBuyable: true,
    ),
    _AgentInfo(
      name: 'AudioScribe',
      ticker: r'$SCRIBE',
      description:
          'Transcribes audio and video files with high accuracy, supporting multiple languages.',
      icon: FontAwesomeIcons.microphone,
      tags: ['Token Deployed', 'Active Pool'],
      buyTicker: r'$SCRIBE',
      isBuyable: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1200
            ? 3
            : (constraints.maxWidth > 800 ? 2 : 1);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.4,
          ),
          itemCount: agents.length,
          itemBuilder: (context, index) {
            return _AgentCard(agent: agents[index]);
          },
        );
      },
    );
  }
}

class _AgentCard extends StatelessWidget {
  const _AgentCard({required this.agent});
  final _AgentInfo agent;

  Color _getTagColor(String tag) {
    switch (tag) {
      case 'Active Pool':
      case 'Token Deployed':
      case 'Fully Deployed':
      case 'HuggingFace':
        return ClonesColors.rewardInfo;
      case 'Pool Pending':
      case 'Config Pending':
        return ClonesColors.containerIcon3;
      case 'Token Gated':
        return ClonesColors.primary;
      case 'Custom URL':
        return ClonesColors.containerIcon2;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: ClonesColors.gradientBtnPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(agent.icon, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        agent.name,
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        agent.ticker,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ClonesColors.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            agent.description,
            style: theme.textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: agent.tags
                .map(
                  (tag) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getTagColor(tag).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      tag,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: _getTagColor(tag)),
                    ),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _IconButton(icon: FontAwesomeIcons.eye, onTap: () {}),
                  _IconButton(icon: FontAwesomeIcons.play, onTap: () {}),
                  _IconButton(icon: FontAwesomeIcons.copy, onTap: () {}),
                ],
              ),
              if (agent.isBuyable)
                BtnPrimary(
                  buttonText: 'Buy ${agent.buyTicker}',
                  onTap: () {},
                )
              else
                const BtnPrimary(
                  buttonText: 'Soon',
                  onTap: null,
                  btnPrimaryType: BtnPrimaryType.dark,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(
            icon,
            size: 14,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
