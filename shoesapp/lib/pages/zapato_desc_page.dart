import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/helpers/helpers.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/widgets/custom_widgets.dart';


class ZapatoDescriptionPage extends StatelessWidget {
  const ZapatoDescriptionPage({super.key});


  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return  Scaffold(
      body: Column(
        children: [
          Stack(children:[

           const Hero(
            tag: 'zapato_1',
            child: ZapatoSizePreview(fullScreem:true)),
          Positioned(
            top: 80,
            child: FloatingActionButton(
            onPressed: () {
            Navigator.pop(context);
            cambiarStatusDark();
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 0,
            child: const Icon(Icons.chevron_left, color: Colors.white, size: 60,),
          ),
          
          )
          ]),
          const Expanded(child: 
            SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descrition:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
              _MontoBuyNow(),
              _ColoresYMas(),
              _BotonesLike(),
            ],
              ),
            )
          )
        ],
      )
   );
  }
}

class _BotonesLike extends StatelessWidget {
  const _BotonesLike();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(icon: Icon(Icons.star, size: 25, color: Colors.red,)),
          _BotonSombreado(icon: Icon(Icons.shopping_cart, size: 25, color: Colors.grey.withOpacity(0.4),)),
          _BotonSombreado(icon: Icon(Icons.settings, size: 25, color: Colors.grey.withOpacity(0.4),)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  const _BotonSombreado({
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
      child: icon,

    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:30.0),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 90,
                child: _BotonColor(Color(0xFF364D56),4,'assets/imgs/negro.png')),
              Positioned(
                left: 60,
                child: _BotonColor(Color(0xFF2099F1),3,'assets/imgs/azul.png')),
              Positioned(
                left: 30,
                child: _BotonColor(Color(0xFFFFAD29),2,'assets/imgs/amarillo.png')),
              _BotonColor(Color(0xFFC6D642),1,'assets/imgs/verde.png'),
            ],
          )),
          // Spacer(),
          CustomBoton(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xFFFFC675) ,)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  const _BotonColor(this.color, this.index, this.urlImage);

  final Color color;
  final int index;
  final String urlImage;
  @override
  Widget build(BuildContext context) {
     final zapatoModel=Provider.of<ZapatoModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index*100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          zapatoModel.assetsImage=urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30.0),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text('\$180.0', style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            const Spacer(),
            Bounce(
              duration: Duration(seconds: 1),
              from: 10,
              child: const CustomBoton(texto: 'Buy Now', ancho: 120, alto: 40,))
          ],
        ),
      ),
    );
  }
}