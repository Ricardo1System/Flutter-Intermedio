import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimary = Colors.pink,
    this.colorSecundary = Colors.grey,
    this.grosorPrimario=4,
    this.gosorSecundario=10,
  });

  final double porcentaje;
  final Color colorPrimary;
  final Color colorSecundary;
  final int grosorPrimario;
  final int gosorSecundario;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
              painter: _MiradialProgress(
            widget.colorPrimary,
            widget.colorSecundary,
            (widget.porcentaje - diferenciaAnimar) +
                (diferenciaAnimar * controller.value),
                widget.grosorPrimario,
                widget.gosorSecundario
          )),
        );
      },
    );
  }
}

class _MiradialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimary;
  final Color colorsSecundary;
   final int grosorPrimario;
  final int gosorSecundario;

  _MiradialProgress(this.colorPrimary, this.colorsSecundary, this.porcentaje, this.grosorPrimario, this.gosorSecundario);


  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradiente= new LinearGradient(colors: [
      Color(0xFFC012FF),
      Color(0xFF6D05E8),
      Colors.red,
    ]);

    Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    final paint = Paint()
      ..strokeWidth = grosorPrimario.toDouble()
      ..color = colorPrimary
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = Paint()
      ..strokeWidth = gosorSecundario.toDouble()
      // ..color = colorsSecundary
      ..shader= gradiente.createShader(rect)
      ..strokeCap= StrokeCap.round 
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
