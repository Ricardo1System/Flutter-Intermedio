import 'package:flutter/material.dart';


class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Pagina 2'),),
      body: Center(
        child: Text('Pagina 2'),
     ),
     floatingActionButton: 
     FloatingActionButton(
      child: Icon(Icons.arrow_back),
      onPressed: () {
       
     },),
   );
  }
}