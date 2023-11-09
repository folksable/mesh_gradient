import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:mesh_gradient/src/mesh_gradient_options.dart';
import 'package:mesh_gradient/src/mesh_gradient_painter.dart';
import 'package:mesh_gradient/src/mesh_gradient_point.dart';

class MeshGradient extends StatefulWidget {
  const MeshGradient({
    super.key,
    required this.points,
    required this.options,
    this.child,
  });

  final List<MeshGradientPoint> points;
  final Widget? child;
  final MeshGradientOptions options;

  @override
  State<MeshGradient> createState() => _MeshGradientState();
}

const String assetPath = 'packages/mesh_gradient/shaders/point_mesh_gradient.frag';

class _MeshGradientState extends State<MeshGradient> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: assetPath,
      (context, shader, child) {
        return CustomPaint(
          painter: MeshGradientPainter(
            shader: shader,
            points: widget.points,
            options: widget.options,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
