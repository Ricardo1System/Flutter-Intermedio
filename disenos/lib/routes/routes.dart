 

import 'package:disenos/labs/slideshow_page.dart';
import 'package:disenos/pages/emergency_page.dart';
import 'package:disenos/pages/graficas_circulares_page.dart';
import 'package:disenos/pages/headers_page.dart';
import 'package:disenos/pages/pinterest_page.dart';
import 'package:disenos/pages/slider_list_page.dart';
import 'package:disenos/pages/slideshow_page.dart';
import 'package:disenos/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';





final pageRoutes=<_Routes>[
  _Routes(icon: FontAwesomeIcons.slideshare, titulo: 'Slideshare', page: SladeShowPage()),
  _Routes(icon: FontAwesomeIcons.ambulance, titulo: 'Emergencia', page: EmergencyPage()),
  _Routes(icon: FontAwesomeIcons.heading, titulo: 'Encabezados', page: HeadersPage()),
  _Routes(icon: FontAwesomeIcons.peopleCarry, titulo: 'Cuadro Animado', page: CuadradoAnimadoPage()),
  _Routes(icon: FontAwesomeIcons.circleNotch, titulo: 'Barra', page: GraficasCirculares()),
  _Routes(icon: FontAwesomeIcons.pinterest, titulo: 'Pinterest', page: PinterestPage()),
  _Routes(icon: FontAwesomeIcons.mobile, titulo: 'Slivers', page: SliverListPage()),
];


class _Routes {


   
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes({required this.icon, required this.titulo, required this.page});


 }