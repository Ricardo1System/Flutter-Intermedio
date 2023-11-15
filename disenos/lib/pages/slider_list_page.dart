

import 'package:disenos/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Titulo()
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -50,
            right: -15,
            child: _BotonNewList()),
        ],
      )
   );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    final size= MediaQuery.of(context).size;

    return ButtonTheme(
        child: RawMaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
      onPressed: () {},
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffED6762),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        height: 100,
        width: size.width * 0.9,
        child: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
        ),
      ),
    ));
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola mundo'),
        //   elevation: 0,
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate:  _SliverCustomHeaderDelegate(
            maxheight: 200,
            minheight: 200,
            child: Container(
              color: Colors.white,
              child: const Titulo())
          )
          ),
        SliverList(delegate: SliverChildListDelegate(
          [
            const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
          ]
        ))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({required this.minheight, required this.maxheight, required this.child});


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minheight > maxheight)? minheight :maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    
    return maxheight != oldDelegate.maxExtent ||
    minheight != oldDelegate.minExtent ;
    // child != oldDelegate.snapConfiguration;
  }
}

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: const Text('New',
          style: TextStyle(color: Color(0xff532128), fontSize: 50),),
        ),
        Stack(
          children: [
            const SizedBox(width: 100,),
            Positioned(
              bottom: 10,
              child: Container(
                width: 120,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xffF7CDD5)
                ),
              ),
            ),
            Container(
              child: const Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 45, fontWeight: FontWeight.bold),),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
   _ListaTareas({
    super.key,
  });


    final items = [
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
    const _ListItem( 'Orange', Color(0xffF08F66) ),
    const _ListItem( 'Family', Color(0xffF2A38A) ),
    const _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    const _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {
 
 final String text;
 final Color color;

  const _ListItem( this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}