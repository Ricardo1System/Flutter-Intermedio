import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  const SlideShow(
      {super.key,
      required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario=12.0,
      this.bulletSecundario=12.0});

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            Provider.of<_SlideShowModel>(context)._colorPrimario =
                colorPrimario;
            Provider.of<_SlideShowModel>(context)._colorSecundario =
                colorSecundario;
            Provider.of<_SlideShowModel>(context)._bulletPrimario =
                bulletPrimario;
            Provider.of<_SlideShowModel>(context)._bulletSecundario =
                bulletSecundario;
            return _CrearEstructuraSlideShow(
                puntosArriba: puntosArriba, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    super.key,
    required this.puntosArriba,
    required this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(items: slides.length),
        Expanded(child: _Slides(slides)),
        if (!puntosArriba) _Dots(items: slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({super.key, required this.items});
  final int items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(items, (i) => _Dot(index: i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex=Provider.of<_SlideShowModel>(context).currentPage;
    final ssModel = Provider.of<_SlideShowModel>(context);
    // final bulletSize = (ssModel._currentPage==index)? :ssModel.bulletSecundario;
    double bulletSize=0;
    Color color;

    if (ssModel._currentPage >= index - 0.5 &&
                  ssModel._currentPage < index + 0.5) {
      bulletSize=ssModel._bulletPrimario;
      color=ssModel._colorPrimario;
    } else {
      bulletSize=ssModel._bulletSecundario;
      color=ssModel._colorSecundario;
      
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: bulletSize,
      height: bulletSize,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          
          ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides(this.slides);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    super.key,
    required this.slide,
  });

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet) {
    this._bulletPrimario = bullet;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet) {
    this._bulletSecundario = bullet;
  }
}
