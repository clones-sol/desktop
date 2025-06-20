import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';

// Base class for node data
abstract class SkillTreeNodeData {
  SkillTreeNodeData({required this.id, required this.name});
  final String id;
  final String name;
}

// Data for App nodes
class SkillTreeAppNode extends SkillTreeNodeData {
  SkillTreeAppNode({
    required super.id,
    required super.name,
    this.domain,
    this.description,
    this.iconUrl,
    this.seen,
  });
  final String? domain;
  final String? description;
  final String? iconUrl;
  final bool? seen;
}

// Data for Task nodes
class SkillTreeTaskNode extends SkillTreeNodeData {
  SkillTreeTaskNode({
    required super.id,
    required super.name,
    this.completed,
    this.recordingId,
    this.score,
    required this.parentIconUrl,
  });
  final bool? completed;
  final String? recordingId;
  final double? score;
  final String parentIconUrl;
}

class SkillTree extends ConsumerStatefulWidget {
  const SkillTree({super.key});

  @override
  ConsumerState<SkillTree> createState() => _SkillTreeState();
}

class _SkillTreeState extends ConsumerState<SkillTree> {
  final Graph _graph = Graph();
  late Algorithm _algorithm;

  @override
  void initState() {
    super.initState();
    _algorithm = FruchtermanReingoldAlgorithm();
  }

  void _buildGraph(List<ForgeApp> apps) {
    _graph.nodes.clear();
    _graph.edges.clear();

    final rootData = SkillTreeAppNode(
      id: 'root',
      name: 'Desktop',
      iconUrl: 'https://viralmind.ai/favicon.png',
    );
    final rootNode = Node.Id(rootData);
    _graph.addNode(rootNode);

    for (final app in apps) {
      final iconUrl =
          'https://s2.googleusercontent.com/s2/favicons?domain=${app.domain}&sz=64';
      final appData = SkillTreeAppNode(
        id: app.name,
        name: app.name,
        domain: app.domain,
        description: app.description,
        iconUrl: iconUrl,
        seen: app.seen,
      );
      final appNode = Node.Id(appData);
      _graph
        ..addNode(appNode)
        ..addEdge(
          rootNode,
          appNode,
          paint: Paint()
            ..color = Colors.white.withValues(alpha: 0.8)
            ..strokeWidth = 1,
        );

      for (final task in app.tasks) {
        final taskData = SkillTreeTaskNode(
          id: '${app.name}-${task.prompt}',
          name: task.prompt,
          completed: task.completed,
          recordingId: task.recordingId,
          score: task.score?.toDouble(),
          parentIconUrl: iconUrl,
        );
        final taskNode = Node.Id(taskData);
        _graph
          ..addNode(taskNode)
          ..addEdge(
            appNode,
            taskNode,
            paint: Paint()
              ..color = Colors.white.withValues(alpha: 0.8)
              ..strokeWidth = 1,
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appsAsync = ref.watch(getAppsForSkillsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final logoSize = screenWidth * 0.25;
        const minLogoSize = 120.0;
        const maxLogoSize = 400.0;
        logoSize.clamp(minLogoSize, maxLogoSize);

        return appsAsync.when(
          data: (apps) {
            if (apps.isEmpty) {
              return const Center(
                child: Text(
                  'No skills available.',
                  style: TextStyle(color: VMColors.primaryText),
                ),
              );
            }
            _buildGraph(apps);
            return InteractiveViewer(
              constrained: false,
              boundaryMargin: const EdgeInsets.all(1000),
              minScale: 0.01,
              maxScale: 5.6,
              child: GraphView(
                graph: _graph,
                algorithm: _algorithm,
                paint: Paint()
                  ..color = Colors.green
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke,
                builder: (node) {
                  final data = node.key!.value as SkillTreeNodeData;
                  if (data is SkillTreeAppNode) {
                    return _buildAppNode(data);
                  } else if (data is SkillTreeTaskNode) {
                    return _buildTaskNode(data);
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: VMColors.primaryText),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppNode(SkillTreeAppNode data) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: VMColors.tertiary.withValues(alpha: 0.8),
        border: Border.all(
          color: (data.seen ?? false)
              ? VMColors.tertiary
              : const Color(0xFFE5E7EB),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  data.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: VMColors.primaryText,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                AutoSizeText(
                  data.description ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: VMColors.secondaryText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (data.iconUrl != null)
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.network(
                data.iconUrl!,
                width: 32,
                height: 32,
                errorBuilder: (c, o, s) =>
                    const Icon(Icons.apps, size: 32, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTaskNode(SkillTreeTaskNode data) {
    final isCompleted = data.completed ?? false;
    return GestureDetector(
      onTap: () {
        if (isCompleted) {
          debugPrint('Navigate to history recording: ${data.recordingId}');
          // TODO(reddwarf03): Implement navigation with go_router
        } else {
          debugPrint('Navigate to chat for task: ${data.name}');
          // TODO(reddwarf03): Implement navigation with go_router
        }
      },
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: VMColors.secondary.withValues(alpha: 0.8),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isCompleted
                      ? VMColors.secondary
                      : const Color(0xFFF7EDFD),
                ),
                borderRadius: BorderRadius.circular(16),
                color:
                    isCompleted ? Colors.transparent : const Color(0x80F7EDFD),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      data.name,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: VMColors.primaryText,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.network(
                        data.parentIconUrl,
                        width: 24,
                        height: 24,
                        errorBuilder: (c, o, s) => const Icon(
                          Icons.web_asset_off,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (data.score != null)
                        AutoSizeText(
                          '${data.score!.toInt()}%',
                          style: const TextStyle(
                            color: VMColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      else if (isCompleted)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7EDFD),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const AutoSizeText(
                            'unclaimed',
                            style: TextStyle(
                              color: VMColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
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
