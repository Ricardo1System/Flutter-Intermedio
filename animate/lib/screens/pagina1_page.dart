import 'package:animate/screens/navegacion_page.dart';
import 'package:animate/screens/twitter_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated_do'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, CupertinoDialogRoute(builder: (context) =>const TwitterPage(), context: context));
          }, icon: const FaIcon(FontAwesomeIcons.twitter )),
          FadeInLeft(
            from: 50,
            child: IconButton(onPressed: () {
              Navigator.push(context, CupertinoDialogRoute(builder: (context) =>const Pagina1Page(), context: context));
            }, icon: const Icon(Icons.navigate_next_rounded ) ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(

        child: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NavecacionPage() ,));
        },
        child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1100),
              child: const Icon(Icons.new_releases,color: Colors.blue, size: 40,)),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)),
            FadeInDown(
              delay: const Duration(milliseconds: 1000),
              child: const Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
     ),
   );
  }
}