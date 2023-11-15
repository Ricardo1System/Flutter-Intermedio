import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/pages/zapato_desc_page.dart';
import 'package:shoesapp/pages/zapato_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => ZapatoModel(),)

    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShoesApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: ZapatoPage(),
      // home: ZapatoDescriptionPage(),
    );
  }
}

