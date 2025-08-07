import 'package:flutter/material.dart';

class AxTreeOverlay extends StatelessWidget {
  const AxTreeOverlay({
    super.key,
    required this.tree,
    required this.resolution,
    required this.videoSize,
  });
  final List<dynamic> tree;
  final Size resolution;
  final Size videoSize;

  List<_Box> _renderAxTreeOverlay(List<dynamic> tree) {
    final boxes = <_Box>[];
    for (final node in tree) {
      if (node['bbox'] != null &&
          (node['bbox']['width'] ?? 0) > 0 &&
          (node['bbox']['height'] ?? 0) > 0) {
        boxes.add(
          _Box(
            x: node['bbox']['x']?.toDouble() ?? 0,
            y: node['bbox']['y']?.toDouble() ?? 0,
            width: node['bbox']['width']?.toDouble() ?? 0,
            height: node['bbox']['height']?.toDouble() ?? 0,
            name: node['name'] ?? '',
            role: node['role'] ?? '',
          ),
        );
      }
      if (node['children'] != null && (node['children'] as List).isNotEmpty) {
        boxes.addAll(_renderAxTreeOverlay(List.from(node['children'])));
      }
    }
    return boxes;
  }

  @override
  Widget build(BuildContext context) {
    final boxes = _renderAxTreeOverlay(tree);
    final scaleX = videoSize.width / resolution.width;
    final scaleY = videoSize.height / resolution.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    return Stack(
      children: [
        // semi-transparent black overlay sized to video
        Container(
          width: videoSize.width,
          height: videoSize.height,
          color: Colors.black.withValues(alpha: 0.5),
        ),
        // scaled container with positioned boxes
        Positioned(
          top: 0,
          left: 0,
          width: videoSize.width,
          height: videoSize.height,
          child: Transform.scale(
            scale: scale,
            alignment: Alignment.topLeft,
            child: Stack(
              children: boxes.map((box) {
                return Positioned(
                  left: box.x,
                  top: box.y,
                  width: box.width,
                  height: box.height,
                  child: Tooltip(
                    message:
                        '${box.name.isNotEmpty ? box.name : "Unnamed"} (${box.role})',
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                        color: Colors.transparent,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        color: Colors.black.withValues(alpha: 0.75),
                        child: Text(
                          box.name.isNotEmpty ? box.name : box.role,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _Box {
  _Box({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.name,
    required this.role,
  });
  final double x, y, width, height;
  final String name, role;
}
