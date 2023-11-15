import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          // height: 150,
          // color: Colors.red,
          child: Row(
            children: [
              Text(texto, style: const TextStyle( fontSize: 30, fontWeight: FontWeight.bold), ),
              const Spacer(),
              const Icon(Icons.search, size: 30,),
            ],
          ),
        ),
      ),
    );
  }
}