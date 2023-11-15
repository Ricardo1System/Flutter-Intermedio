import 'package:disenos/theme/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:provider/provider.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    super.key,
  });

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacidad = Tween(begin: 0.1,end: 1.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0, 0.25,curve:Curves.easeOut )));
    opacidadOut = Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0,curve:Curves.easeOut )));
    moverDerecha= Tween(begin: 0.0,end: 150.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    agrandar= Tween(begin: 0.0,end: 2.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));


    controller.addListener(() {
      // print('status: ${controller.status} ');
      if (controller.status==AnimationStatus.completed) {
        // controller.repeat();
        // controller.reverse();
        controller.reset();
      }
      // else if(controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();
    // controller.repeat();


    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // print(rotation.value);
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(angle: rotation.value, 
          child: Opacity(
            opacity: opacidad.value,
            child: Opacity(
              opacity: opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: _Rectangulo()),
            ))),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: appTheme.currenttheme.primaryColor),
    );
  }
}
