import 'package:flutter/material.dart';


class ZapatoDescripcion extends StatelessWidget {
  const ZapatoDescripcion({super.key, required this.titulo, required this.descrition});

  final String titulo;
  final String descrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text(titulo, style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          Text(descrition, style: const TextStyle(color: Colors.black54, height: 1.6),),

        ],
      ),
    );
  }
}