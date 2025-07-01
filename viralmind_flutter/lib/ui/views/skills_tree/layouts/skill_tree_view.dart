import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphview/GraphView.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/application/session/provider.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/ui/components/design_widget/message_box/message_box.dart';
import 'package:viralmind_flutter/ui/components/wallet_not_connected.dart';

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

// Custom radial algorithm for skill tree (similar to Svelte D3 implementation)
class RadialSkillTreeAlgorithm extends Algorithm {
  @override
  void init(Graph? graph) {
    // Initialize the algorithm
  }

  @override
  void step(Graph? graph) {
    // No animation steps needed for static layout
  }

  @override
  void setDimensions(double width, double height) {
    // Not needed for this algorithm
  }

  @override
  Size run(Graph? graph, double width, double height) {
    if (graph == null) return Size.zero;

    final nodes = graph.nodes;

    // Find root node
    Node? rootNode;
    final appNodes = <Node>[];
    final taskNodes = <Node>[];

    // Categorize nodes
    for (final node in nodes) {
      final data = node.key?.value as SkillTreeNodeData?;
      if (data?.id == 'root') {
        rootNode = node;
      } else if (data is SkillTreeAppNode) {
        appNodes.add(node);
      } else if (data is SkillTreeTaskNode) {
        taskNodes.add(node);
      }
    }

    if (rootNode != null) {
      // Position root at center
      rootNode.position = Offset.zero;

      // Position app nodes in a circle around root
      const appRadius = 600.0;
      final appSpacing = 2 * pi / appNodes.length;

      for (var i = 0; i < appNodes.length; i++) {
        final angle = i * appSpacing;
        final x = appRadius * cos(angle);
        final y = appRadius * sin(angle);
        appNodes[i].position = Offset(x, y);
      }

      // Group tasks by their parent app
      final tasksByApp = <String, List<Node>>{};
      for (final taskNode in taskNodes) {
        final taskData = taskNode.key?.value as SkillTreeTaskNode;
        final appName = taskData.id.split('-').first;
        tasksByApp.putIfAbsent(appName, () => []).add(taskNode);
      }

      // Position tasks around their parent apps with concentric circles
      for (final entry in tasksByApp.entries) {
        final appName = entry.key;
        var tasks = entry.value;

        // Find the parent app node
        final appNode = appNodes.firstWhere(
          (node) {
            final data = node.key?.value as SkillTreeAppNode?;
            return data?.name == appName;
          },
          orElse: () => appNodes.first,
        );

        final appPos = appNode.position;

        // Sort tasks into circles based on available space
        final circles = <List<Node>>[];
        var currentCircleIndex = 0;

        while (tasks.isNotEmpty) {
          // Calculate max tasks that can fit in this circle
          final radius = 250.0 + (currentCircleIndex * 150.0);
          final circumference = 2 * pi * radius;
          const taskWidth = 140.0; // Approximate width of a task node
          final maxTasksInCircle = (circumference / taskWidth).floor();

          final tasksForThisCircle = tasks.take(maxTasksInCircle).toList();
          circles.add(tasksForThisCircle);
          tasks = tasks.skip(maxTasksInCircle).toList();
          currentCircleIndex++;
        }

        // Position tasks in each circle with offset angles
        for (var circleIndex = 0; circleIndex < circles.length; circleIndex++) {
          final tasksInCircle = circles[circleIndex];
          final radius = 250.0 + (circleIndex * 150.0);
          final angleSpacing = 2 * pi / tasksInCircle.length;
          // Add an offset to each circle to avoid radial alignment
          final circleOffset = circleIndex * pi / circles.length;

          for (var i = 0; i < tasksInCircle.length; i++) {
            final angle = (i * angleSpacing) + circleOffset;
            final x = appPos.dx + radius * cos(angle);
            final y = appPos.dy + radius * sin(angle);
            tasksInCircle[i].position = Offset(x, y);
          }
        }
      }
    }

    // Calculate size to encompass all nodes
    var minX = double.infinity;
    var minY = double.infinity;
    var maxX = double.negativeInfinity;
    var maxY = double.negativeInfinity;

    for (final node in nodes) {
      final pos = node.position;
      minX = min(minX, pos.dx);
      minY = min(minY, pos.dy);
      maxX = max(maxX, pos.dx);
      maxY = max(maxY, pos.dy);
    }

    return Size(maxX - minX + 1000, maxY - minY + 1000);
  }

  @override
  void setFocusedNode(Node? focusedNode) {
    // Not needed for this algorithm
  }
}

// Custom painter for drawing edges
class EdgePainter extends CustomPainter {
  EdgePainter(this.edges);

  final List<Edge> edges;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = VMColors.primary
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (final edge in edges) {
      final start = edge.source.position;
      final end = edge.destination.position;

      // Offset the points to center of the view
      final offsetStart = Offset(
        start.dx + size.width / 2,
        start.dy + size.height / 2,
      );
      final offsetEnd = Offset(
        end.dx + size.width / 2,
        end.dy + size.height / 2,
      );

      canvas.drawLine(offsetStart, offsetEnd, paint);
    }
  }

  @override
  bool shouldRepaint(EdgePainter oldDelegate) => true;
}

class SkillTreeView extends ConsumerStatefulWidget {
  const SkillTreeView({super.key});

  static const routeName = '/skills-tree';

  @override
  ConsumerState<SkillTreeView> createState() => _SkillTreeViewState();
}

class _SkillTreeViewState extends ConsumerState<SkillTreeView> {
  final Graph _graph = Graph();
  late Algorithm _algorithm;

  @override
  void initState() {
    super.initState();
    _algorithm = RadialSkillTreeAlgorithm();
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
            ..color = Colors.white
            ..strokeWidth = 3
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke,
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
              ..color = Colors.white
              ..strokeWidth = 2
              ..strokeCap = StrokeCap.round
              ..style = PaintingStyle.stroke,
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionNotifierProvider);
    if (session.isConnected == false) {
      return const WalletNotConnected();
    }

    final appsAsync = ref.watch(getAppsForSkillsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
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
            return Center(
              child: InteractiveViewer(
                constrained: false,
                boundaryMargin: const EdgeInsets.all(2000),
                minScale: 0.1,
                maxScale: 2,
                child: Container(
                  width: 4000,
                  height: 4000,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: -1000,
                        top: -1000,
                        child: CustomPaint(
                          size: const Size(4000, 4000),
                          painter: EdgePainter(_graph.edges),
                        ),
                      ),
                      Positioned(
                        left: 930,
                        top: 920,
                        child: GraphView(
                          graph: _graph,
                          algorithm: _algorithm,
                          paint: Paint()
                            ..color = Colors.transparent
                            ..strokeWidth = 0
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
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: MessageBox(
                    messageBoxType: MessageBoxType.warning,
                    content: Text(
                      error.toString(),
                      style: const TextStyle(color: Color(0xFFFF8400)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppNode(SkillTreeAppNode data) {
    final isRoot = data.id == 'root';
    return Container(
      width: isRoot ? 180 : 160,
      height: isRoot ? 180 : 160,
      decoration: BoxDecoration(
        color: isRoot
            ? VMColors.primary.withValues(alpha: 0.9)
            : VMColors.tertiary.withValues(alpha: 0.85),
        border: Border.all(
          color: (data.seen ?? false)
              ? VMColors.secondary
              : VMColors.primary.withValues(alpha: 0.3),
          width: isRoot ? 3 : 2,
        ),
        borderRadius: BorderRadius.circular(isRoot ? 20 : 16),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: VMColors.primaryText,
                    fontSize: isRoot ? 22 : 18,
                  ),
                ),
                if (!isRoot) ...[
                  const SizedBox(height: 4),
                  AutoSizeText(
                    data.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: VMColors.secondaryText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (data.iconUrl != null)
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  data.iconUrl!,
                  width: isRoot ? 36 : 32,
                  height: isRoot ? 36 : 32,
                  errorBuilder: (c, o, s) => Icon(Icons.apps,
                      size: isRoot ? 36 : 32, color: Colors.grey),
                ),
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
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isCompleted
              ? VMColors.secondary.withValues(alpha: 0.8)
              : VMColors.secondary.withValues(alpha: 0.5),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isCompleted
                      ? VMColors.secondary
                      : VMColors.primary.withValues(alpha: 0.4),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      data.name,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: VMColors.primaryText,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.network(
                          data.parentIconUrl,
                          width: 20,
                          height: 20,
                          errorBuilder: (c, o, s) => const Icon(
                            Icons.web_asset_off,
                            size: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (data.score != null)
                        Expanded(
                          child: AutoSizeText(
                            '${data.score!.toInt()}%',
                            style: const TextStyle(
                              color: VMColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        )
                      else if (isCompleted)
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: VMColors.primary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const AutoSizeText(
                              'unclaimed',
                              style: TextStyle(
                                color: VMColors.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
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
