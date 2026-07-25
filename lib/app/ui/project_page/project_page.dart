import 'package:flutter/material.dart';

import '../../data/models/project.dart';
import '../global_widgets/appbar.dart';
import '../global_widgets/responsive_content.dart';
import '../theme/responsive.dart';
import 'widgets/project_description.dart';
import 'widgets/project_images.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _background() {
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(widget.project.page.backgroundImagePath, fit: BoxFit.cover),
          ColoredBox(color: Colors.black.withOpacity(0.60)),
        ],
      ),
    );
  }

  Widget _compactBody() {
    return SingleChildScrollView(
      key: const Key('project-detail-compact-scroll'),
      controller: _controller,
      padding: const EdgeInsets.only(top: 110, bottom: 48),
      child: ResponsiveContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectImages(project: widget.project),
            const SizedBox(height: 32),
            ProjectDescription(project: widget.project),
          ],
        ),
      ),
    );
  }

  Widget _desktopBody() {
    return SingleChildScrollView(
      controller: _controller,
      padding: const EdgeInsets.only(top: 110, bottom: 48),
      child: Center(
        child: SizedBox(
          key: const Key('project-detail-desktop-row'),
          width: 1200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectImages(project: widget.project),
              ProjectDescription(project: widget.project),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final compact = ResponsiveLayout.isCompact(MediaQuery.sizeOf(context).width);
    return Scaffold(
      appBar: AppBarWidget(controller: _controller, isDarkTheme: true),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _background(),
          compact ? _compactBody() : _desktopBody(),
        ],
      ),
    );
  }
}
