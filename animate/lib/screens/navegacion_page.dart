import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavecacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            'Notifications Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: const _BotonFlotante(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context,)._numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items:[
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Natifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: BounceInDown(
                    from: 10, 
                    animate: (numero > 0) ? true :false,
                    child: Bounce(
                      from: 10,
                      controller: (p0) => Provider.of<_NotificationModel>(context)._bounceController=p0 ,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle
                        ),
                        width: 12,
                        height: 12,
                        child: Text('${numero}',style: TextStyle(color: Colors.white, fontSize: 7),),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  ),
            ],
          ),
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class _BotonFlotante extends StatelessWidget {
  const _BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int numero = Provider.of<_NotificationModel>(context, listen: false)._numero;
         numero++;
        Provider.of<_NotificationModel>(context, listen: false).numero=numero;
        if (numero >=2) {
          final controller= Provider.of<_NotificationModel>(context,listen: false)._bounceController;
          controller!.forward(from: 0.0);
        }
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}


class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController? _bounceController;

  int get numero => this._numero;
  set numero(int valor){
    _numero=valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController!;
  set bounceController(AnimationController controller){
    _bounceController=controller;
    notifyListeners();
  }
}
