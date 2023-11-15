
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color primary;
  final Color secundary;
  final Function() onPress;

  const BotonGordo({super.key, required this.icon, required this.texto, required this.primary, required this.secundary, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _BotonModel(),
      child: Builder(builder: (context) {

        Provider.of<_BotonModel>(context, listen: false)._icon=icon;
        Provider.of<_BotonModel>(context, listen: false)._texto=texto;
        Provider.of<_BotonModel>(context, listen: false)._onPress=onPress;
        Provider.of<_BotonModel>(context, listen: false)._primary=primary;
        Provider.of<_BotonModel>(context, listen: false)._secundary=secundary;

        return GestureDetector(
          onTap: onPress,
          child: Stack(
          children: [
            _BotonGordoBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 140, width: 40,),
                FaIcon(icon,
                color: Colors.white,
                size: 40,),
                const SizedBox(width: 20,),
                Expanded(child: Text(texto, style: const TextStyle(color: Colors.white,fontSize: 18),)),
                const FaIcon(FontAwesomeIcons.chevronRight,color: Colors.white,),
                const SizedBox(width: 40,),
              ],
            )
          ],
              ),
        );
      },)
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  final primary=Provider.of<_BotonModel>(context, listen: false)._primary;
  final secundary=Provider.of<_BotonModel>(context, listen: false)._secundary;
  final icon = Provider.of<_BotonModel>(context,listen: false)._icon;
    return Container(
      width: double.infinity,
      height: 100,
      // color: Colors.red,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.white.withOpacity(0.2),offset: const Offset(4, 6),blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors:[
          // Color(0xff6989F5),
          // Color(0xff906EF5),
          primary!,
          secundary!
        ] )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          Positioned(
            right: -20,
            top:-20,
              child: FaIcon(
            icon,
            size: 150,
            color: Colors.white.withOpacity(0.2),
          )),
        ]),
      ),
      // child: Text('Boton Gordo'),
    );
  }
}


class _BotonModel with ChangeNotifier {

   IconData? _icon;
   String? _texto;
   Color? _primary;
   Color? _secundary;
   Function() _onPress = () {};



}