import 'package:disenos/theme/theme.dart';
import 'package:disenos/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const PinterestGrid(),
            _PinteresMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    double width = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context)._mostrar ;
    if(width>500){
      width=width-300;
    }
    return Positioned(
      bottom: 30,
      child: SizedBox(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PinterestMenu(
                backgroundColor: Colors.amber,
                primaryColor: Colors.red,
                secundaryColor: Colors.blue,
                mostrar: mostrar,
                items: [
              PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
              PinterestButton(onPressed: () {}, icon: Icons.search),
              PinterestButton(onPressed: () {}, icon: Icons.notifications),
              PinterestButton( onPressed: () {}, icon: Icons.supervised_user_circle),
                ],
              ),
            ],
          )
          ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterio = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterio && controller.offset > 50) {
        Provider.of<_MenuModel>(context,listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterio = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    if (MediaQuery.of(context).size.width>500) {
      count=3;
    }else{
      count=2;
    }
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  const _PinterestItem({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool mostrar) {
    _mostrar = mostrar;
    notifyListeners();
  }
}
