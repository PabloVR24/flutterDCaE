import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios Botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y Controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y Dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'StateFull Widget Animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'UI Controls + Tiles',
      subTitle: 'Controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introduccion a aplicacion',
      subTitle: 'Tutorial de introduccion',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'Infinite Scroll',
      subTitle: 'Lista Infinita',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
