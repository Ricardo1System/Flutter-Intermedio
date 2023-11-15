import 'package:disenos/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/radial_progres.dart';

class GraficasCirculares extends StatefulWidget {
  const GraficasCirculares({super.key});

  @override
  State<GraficasCirculares> createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgres(
                porcentaje: porcentaje,
                colorPrimary: Colors.amber,
                colorSecundary: Colors.black,
                grosorPrimario: 4,
                grosorSecundario: 10  ,
              ),
              CustomRadialProgres(
                porcentaje: porcentaje,
                colorPrimary: Colors.pink,
                colorSecundary: Colors.yellow,
                grosorPrimario: 12,
                grosorSecundario: 12,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgres(
                porcentaje: porcentaje,
                colorPrimary: Colors.brown,
                colorSecundary: Colors.green,
                grosorPrimario: 8,
                grosorSecundario: 2,
              ),
              CustomRadialProgres(
                porcentaje: porcentaje,
                colorPrimary: Colors.orange,
                colorSecundary: Colors.purple,
                grosorPrimario: 8,
                grosorSecundario: 5,
              ), 
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgres extends StatelessWidget {
  const CustomRadialProgres({
    super.key,
    required this.porcentaje,
    required this.colorPrimary,
    required this.colorSecundary,
    required this.grosorPrimario,
    required this.grosorSecundario,
  });

  final double porcentaje;
  final Color colorPrimary;
  final Color colorSecundary;
  final int grosorPrimario;
  final int grosorSecundario;

  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    return SizedBox(
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimary: colorPrimary,
        colorSecundary: colorSecundary,
        grosorPrimario: grosorPrimario,
        gosorSecundario: grosorSecundario,
      ),
    );
  }
}
