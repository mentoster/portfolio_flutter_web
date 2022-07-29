import 'package:flutter/material.dart';

import '../global_widgets/appbar.dart';
import 'background/main_page_background.dart';
import 'background/main_page_filter.dart';
import 'sections/about_me/me_and_projects.dart';
import 'sections/contact_me/contact_me.dart';
import 'sections/diploms/diplomas.dart';
import 'sections/hackatons.dart/hackathons.dart';
import 'sections/top_section/top_section.dart';
import 'sections/work_experience/work_experience.dart';
import 'sections/work_instruments/work_instruments.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final sections = const [
    TopSection(),
    MeAndProjects(),
    WorkExperience(),
    WorkInstruments(),
    Hackathons(),
    Diplomas(),
    ContactMe(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // _animateToIndex();

    return Scaffold(
      appBar: AppBarWidget(needBack: false, controller: _controller),
      extendBodyBehindAppBar: true,
      body: ListView.builder(
          controller: _controller,
          padding: const EdgeInsets.all(8),
          itemCount: sections.length,
          itemBuilder: (BuildContext context, int index) {
            return sections[index];
          }),
    );
  }
}
