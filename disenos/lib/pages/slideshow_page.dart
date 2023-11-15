import 'package:disenos/theme/theme.dart';
import 'package:disenos/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SladeShowPage extends StatelessWidget {
  const SladeShowPage({super.key});

  @override
  Widget build(BuildContext context) {

    bool isLarge=false;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge=true;
    }else{
      isLarge= false;
    }

    final children=[
      
          Expanded(child: MySlideShow(),),
          Expanded(child: MySlideShow(),),
      
    ];


    return Scaffold(
      body: (isLarge)? 
      Column(
        children: children,
      ):
      Row(
        children: children,
      )
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme=Provider.of<ThemeChange>(context);
    return Center(
      child: SlideShow(
        puntosArriba: true,
        bulletPrimario: 20,
        bulletSecundario: 10,
        colorPrimario: Colors.red,
        colorSecundario: Colors.green,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          SvgPicture.asset('assets/svgs/slide-5.svg'),
        ],
      ),
    );
  }
}