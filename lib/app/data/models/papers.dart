import 'package:flutter/material.dart';

import '../../ui/main_page/sections/diplomas/widgets/diploma_tag_widget.dart';

class Paper {
  final String image;
  final String title;

  Paper({required this.image, required this.title});
}

enum DiplomaTags {
  win,
  top5,
  top3,
  country,
  world,
  unity,
  gamedev,
  design,
  flutter,
  figma
}

// in the future i will add icons, thats why now it is string,later will be widget
const tagsToWidget = {
  DiplomaTags.win: DiplomaTagWidget(
      name: 'Win',
      icon: Icons.emoji_events_rounded,
      color: Color.fromARGB(255, 209, 255, 213)),
  DiplomaTags.top5: DiplomaTagWidget(
      name: 'Top 5',
      icon: Icons.emoji_events_rounded,
      color: Color.fromARGB(255, 250, 255, 209)),
  DiplomaTags.top3: DiplomaTagWidget(
      name: 'Top 3',
      icon: Icons.emoji_events_rounded,
      color: Color.fromARGB(255, 234, 255, 209)),
  DiplomaTags.country: DiplomaTagWidget(
      name: 'Country',
      icon: Icons.flag_rounded,
      color: Color.fromARGB(255, 209, 255, 255)),
  DiplomaTags.world: DiplomaTagWidget(
      name: 'World',
      icon: Icons.public_rounded,
      color: Color.fromARGB(255, 209, 220, 255)),
  DiplomaTags.unity: DiplomaTagWidget(
      name: 'Unity',
      icon: Icons.view_in_ar_rounded,
      color: Color.fromARGB(255, 221, 221, 221)),
  DiplomaTags.gamedev: DiplomaTagWidget(
      name: 'GameDev',
      icon: Icons.sports_esports_rounded,
      color: Color.fromARGB(255, 252, 255, 209)),
  DiplomaTags.design: DiplomaTagWidget(
      name: 'Design',
      icon: Icons.design_services_rounded,
      color: Color.fromARGB(255, 255, 209, 209)),
  DiplomaTags.flutter: DiplomaTagWidget(
      name: 'Flutter',
      icon: Icons.flutter_dash_rounded,
      color: Color.fromARGB(255, 209, 212, 255)),
  DiplomaTags.figma: DiplomaTagWidget(
      name: 'Figma',
      icon: Icons.brush_rounded,
      color: Color.fromARGB(255, 255, 209, 234)),
};

class Diploma extends Paper {
  final String shortDescription;
  final List<DiplomaTags> tags;
  Diploma({
    required String title,
    required this.shortDescription,
    required this.tags,
    required String image,
  }) : super(image: image, title: title);
}

class Certificate extends Paper {
  final String description;
  final String link;

  Certificate({
    required String title,
    required this.description,
    required this.link,
    required String image,
  }) : super(image: image, title: title);
}
