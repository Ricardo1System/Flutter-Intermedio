import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton {
  final Function() onPressed;
  final IconData icon;
  const PinterestButton({required this.onPressed, required this.icon,  });
}


class PinterestMenu extends StatelessWidget {
  const PinterestMenu(
      {super.key,
      this.mostrar = true,
      this.backgroundColor=Colors.white,
      this.primaryColor=Colors.black,
      this.secundaryColor=Colors.blueGrey, required this.items});

  final bool mostrar;
  final Color backgroundColor;
  final Color primaryColor;
  final Color secundaryColor;
  final List<PinterestButton> items;

//   final List items =[
//   PinterestButton(onPressed: (){}, icon: Icons.pie_chart),
//   PinterestButton(onPressed: (){}, icon: Icons.search),
//   PinterestButton(onPressed: (){}, icon: Icons.notifications),
//   PinterestButton(onPressed: (){}, icon: Icons.supervised_user_circle),
// ];


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel() ,
        child: AnimatedOpacity(
          opacity: (mostrar)? 1:0,
          duration: const Duration(milliseconds: 250),
          child: Builder(builder: (context) {

            Provider.of<_MenuModel>(context)._backgroundColor=backgroundColor;
            Provider.of<_MenuModel>(context)._primaryColor=primaryColor;
            Provider.of<_MenuModel>(context)._secundaryColor=secundaryColor;

           return _PinterestMenuBackground(
            child: _MenuItems(menuItems: items),
          );
          },)
        ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor=Provider.of<_MenuModel>(context)._backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const <BoxShadow>[ 
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({required this.menuItems});

  final List menuItems; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinteresMenuButton(index,menuItems[index])),
    ) ;
  }
}

class _PinteresMenuButton extends StatelessWidget {
  const _PinteresMenuButton(this.index,this.item);

  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado= Provider.of<_MenuModel>(context)._itemSeleccionado;
    final Color primaryColor=Provider.of<_MenuModel>(context)._primaryColor;
    final Color secundaryColor=Provider.of<_MenuModel>(context)._secundaryColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context,listen: false).itemSeleccionado=index;
        item.onPressed;
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (itemSeleccionado==index)? 35:20,
        color: (itemSeleccionado==index)? primaryColor:secundaryColor,
      ),
    );
  }
}


class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;

  Color _backgroundColor=Colors.white;
  Color _primaryColor=Colors.black;
  Color _secundaryColor=Colors.blueGrey;

  int get itemSeleccionado=>_itemSeleccionado;
  set itemSeleccionado(int item){
    _itemSeleccionado=item;
    notifyListeners();
  }

  // Color get primaryColor=>_primaryColor;
  // set primaryColor(Color color){
  //   _primaryColor=color;
  // }

  // Color get secundaryColor=>_secundaryColor;
  // set secundaryColor(Color color){
  //   _secundaryColor=color;
  // }
  
  // Color get backgroundColor=>_backgroundColor;
  // set backgroundColor(Color color){
  //   _backgroundColor=color;
  // }
}