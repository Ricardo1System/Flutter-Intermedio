import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/pages/zapato_desc_page.dart';


class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreem;

  const ZapatoSizePreview({super.key,  this.fullScreem=false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreem) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ZapatoDescriptionPage(),));
        }
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal:(fullScreem)? 5:30, 
          vertical: (fullScreem)? 0: 5.0),
        child: Container(
          width: double.infinity,
          height: (fullScreem)? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xFFFFCF53),
            borderRadius: (fullScreem)
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              const _ZapatoConSombra(),
              if(!fullScreem)
              const _ZapatoSize(),
            ],
          ),
          // color: Colors.red,
        ),
      ),
    );
  }
}

class _ZapatoSize extends StatelessWidget {
  const _ZapatoSize();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoBox(7),
          _TallaZapatoBox(7.5),
          _TallaZapatoBox(8),
          _TallaZapatoBox(8.5),
          _TallaZapatoBox(9),
          _TallaZapatoBox(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoBox extends StatelessWidget {
  const _TallaZapatoBox( this.size );

  final double size;

  @override
  Widget build(BuildContext context) {
    final zapatoModel=Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        zapatoModel.talla=size;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
       decoration: BoxDecoration(
        color: size==zapatoModel.talla? const Color(0xFFF1A23A):Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(size==zapatoModel.talla)
          const BoxShadow(color: Color(0xFFF1A23A), blurRadius: 10,offset: Offset(0, 5)),
        ]
       ),
       child: Text(
        size.toString().replaceAll('.0', ''),
        style: TextStyle(
          color: size!=zapatoModel.talla? const Color(0xFFF1A23A): Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold 
       ),),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra();

  @override
  Widget build(BuildContext context) {
     final zapatoModel=Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [

          Positioned(
            bottom: 10,
            right: 0,
            child: _ZapatoSombra()),


           Image(image: AssetImage(zapatoModel.assetsImage))
        ],
      ),
    ) ;
  }
}

class _ZapatoSombra extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xFFEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}


