import 'package:flutter/material.dart';
import 'package:transaction/pages/pagina2_page.dart';


class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 1'),),
      body: Center(
        child: Text('Pagina1'),
     ),
     floatingActionButton: 
     FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      onPressed: () {
       Navigator.push(context, _crearRuta());
     },),
   );
  }
  
  Route _crearRuta() {

    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    
      // transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curveAnimation=CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        // return SlideTransition(
        //   position: Tween<Offset>(begin: Offset(0.5, 1.0) ,end: Offset(0, 0) ).animate(curveAnimation),
        //   child: child, 
        //   );
        // ----------------------------------------------------------------------------------------------------
        // return ScaleTransition(
        //   child: child,
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation));
        // -------------------------------------------------------------------------------------------------------
        // return RotationTransition(
        //   turns: Tween(begin: 0.0, end: 1.0).animate(curveAnimation),
        //   child: child,
        // );
        // ---------------------------------------------------------------------------------------------------------
        return FadeTransition(
          child: child,
          opacity: Tween(begin: 0.0,end: 1.0 ).animate(curveAnimation)
          );
      },

    
    );

  }
}