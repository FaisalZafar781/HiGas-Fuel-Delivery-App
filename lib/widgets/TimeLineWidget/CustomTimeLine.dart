import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class CustomTimeline extends StatelessWidget {
  final int itemCount;
  final List<Color> nodeColors;
  final Color connectorColor;
  final double nodeSize;
  final double spacing; // Add a spacing parameter
  final bool useCustomStartEndIndicators; // Optional parameter for custom start and end indicators

  // Constructor to accept customizations
  const CustomTimeline({
    Key? key,
    required this.itemCount,
    required this.nodeColors,
    required this.connectorColor,
    this.nodeSize = 14.0, // Default size for the nodes
    this.spacing = 32.0, // Default spacing between nodes
    this.useCustomStartEndIndicators = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        connectorBuilder: (context, index, type) {
          // Using a dashed line as connector
          return DashedLineConnector(color: connectorColor);
        },
        indicatorBuilder: (context, index) {
          // Custom node colors based on the index
          if (useCustomStartEndIndicators) {
            if (index == 0) {
              return _CustomIndicator(label: "A", color: nodeColors[index], size: nodeSize);
            } else if (index == itemCount - 1) {
              return _CustomIndicator(label: "B", color: nodeColors[index], size: nodeSize);
            }
          }
          return DotIndicator(
            color: nodeColors[index],
            size: nodeSize,
          );
        },
        itemExtentBuilder: (context, index) => spacing, // Define spacing between nodes
        itemCount: itemCount, // Number of timeline items
      ),
    );
  }
}

class _CustomIndicator extends StatelessWidget {
  final String label;
  final Color color;
  final double size;

  const _CustomIndicator({
    Key? key,
    required this.label,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
