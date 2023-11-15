import 'package:animate_do/animate_do.dart';
import 'package:disenos/theme/theme.dart';
import 'package:disenos/widgets/boton_gordo.dart';
import 'package:disenos/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);

    bool isLarge=false;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge=true;
    }else{
      isLarge= false;
    }
    
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
    ];

    List<Widget> itemMap=List.generate(items.length,(index) {
        return FadeInLeft(
          duration: Duration(milliseconds: 2500),
          child: BotonGordo(
              icon: items[index].icon,
              texto: items[index].texto,
              primary: items[index].color1,
              secundary: items[index].color2,
              onPress: () {
                print('${items[index].texto}');
              }),
        );
    },);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top:(isLarge)? 230:10),
            child: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 80,),
                  // const BotonGordoTemp(),
                  ...itemMap
                ],
              ),
            ),
          ),
          if(isLarge)
          FadeInRight(
            duration: Duration(milliseconds: 2500),
            child: _Encabezado())
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia',
          subtitulo: 'Solicitado',
          primary: Color(0xff6989F5),
          secundary: Color(0xff906EF5),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,)))
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      // icon: FontAwesomeIcons.carCrash,
      icon: Icons.access_time_rounded,
      onPress: () { print('Hola'); },
      primary: Colors.green,
      secundary: Colors.amber,
      texto: 'Accidente',
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Asistencia Medica',
      titulo: 'Solicitado',
      primary: Color(0xff526BF6),
      secundary: Color(0xff67ACF2),
    );
  }
}