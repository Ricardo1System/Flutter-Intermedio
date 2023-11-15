

import 'package:disenos/models/layout_model.dart';
import 'package:disenos/pages/laucher_tablet_page.dart';
import 'package:disenos/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/laucher_page.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChange>(create: (context) => ThemeChange(2),),
        ChangeNotifierProvider<LayoutModel>(create: (context) => LayoutModel(),),
      ],
    child: const MyApp()));
}
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => ThemeChange(2),
//     child: const MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChange>(context);
    return MaterialApp(
      theme: appTheme.currenttheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(builder: (context, orientation) {
        final screenSize=MediaQuery.of(context).size;
        if (screenSize.width > 500 ) {
            return LauncherTabletPage();
        } else {
        return LauncherPage();
        }
      },),
      // home: LauncherPage()
    );
  }
}



