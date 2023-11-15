import 'package:flutter/material.dart';


class CustomBoton extends StatelessWidget {

  final String texto;
  final double alto;
  final double ancho;
  final Color color;
  const CustomBoton({super.key, required this.texto,  this.alto=50.0,  this.ancho=150.0,  this.color=Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho,
      height: alto,
      // color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color
      ),
      child: Text(texto,style: const TextStyle(color: Colors.white,),),
    );
  }
}