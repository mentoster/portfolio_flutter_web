import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/certificates/certificates.dart';

import '../global_widgets/appbar.dart';
import 'sections/about_me/me_and_projects.dart';
import 'sections/contact_me/contact_me.dart';
import 'sections/diplomas/diplomas.dart';
import 'sections/top_section/top_section.dart';
import 'sections/work_experience/work_experience.dart';
import 'sections/work_instruments/work_instruments.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _controller = ScrollController();
  final GlobalKey _heroKey = GlobalKey();

  late final List<Widget> _sections = [
    TopSection(key: _heroKey, controller: _controller),
    const MeAndProjects(),
    const WorkExperience(),
    const WorkInstruments(),
    const DiplomasWidget(),
    CertificatesWidget(),
    const ContactMe(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        needBack: false,
        controller: _controller,
        homeHeroKey: _heroKey,
      ),
      extendBodyBehindAppBar: true,
      body: ListView.builder(
        controller: _controller,
        padding: EdgeInsets.zero,
        itemCount: _sections.length,
        itemBuilder: (BuildContext context, int index) => _sections[index],
      ),
    );
  }
}
