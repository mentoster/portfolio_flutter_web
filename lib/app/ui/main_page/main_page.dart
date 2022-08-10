import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/certificates/certificates.dart';

import '../global_widgets/appbar.dart';
import 'sections/about_me/me_and_projects.dart';
import 'sections/contact_me/contact_me.dart';
import 'sections/diplomas/diplomas.dart';
import 'sections/top_section/top_section.dart';
import 'sections/work_experience/work_experience.dart';
import 'sections/work_instruments/work_instruments.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final ScrollController _controller = ScrollController();

  final sections = [
    const TopSection(),
    const MeAndProjects(),
    const WorkExperience(),
    const WorkInstruments(),
    const DiplomasWidget(),
    CertificatesWidget(),
    const ContactMe(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(needBack: false, controller: _controller),
      extendBodyBehindAppBar: true,
      body: ListView.builder(
          controller: _controller,
          padding: const EdgeInsets.all(0),
          itemCount: sections.length,
          itemBuilder: (BuildContext context, int index) {
            return sections[index];
          }),
    );
  }
}
