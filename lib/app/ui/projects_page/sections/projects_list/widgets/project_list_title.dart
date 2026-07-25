import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/enums/technology.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_projects.dart';

import '../../../../global_widgets/search_widget.dart';
import '../../../../theme/app_fonts.dart';

class ProjectListTitle extends StatefulWidget {
  const ProjectListTitle({
    Key? key,
    required this.onSearch,
    required this.onTagSearch,
  }) : super(key: key);

  final Function onSearch;
  final Function onTagSearch;

  @override
  State<ProjectListTitle> createState() => _ProjectListTitleState();
}

class _ProjectListTitleState extends State<ProjectListTitle> {
  Technology? tech;

  void searchTag(Technology? newTech) {
    setState(() => tech = newTech);
    widget.onTagSearch(newTech);
  }

  Widget _filterButton(String label, Technology? technology, double width) {
    return TextButton(
      onPressed: () => searchTag(technology),
      child: Text(
        label,
        style: responsiveHeading2Bold(width).copyWith(
          decoration: tech == technology
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 32),
        SelectableText('Проекты', style: responsiveHeading1(width)),
        const SizedBox(height: 24),
        SelectableText('Ищите нужный вам проект', style: responsiveBody(width)),
        const SizedBox(height: 24),
        SearchWidget(
          texts: [for (var pr in projects) pr.title],
          onChanged: widget.onSearch,
        ),
        const SizedBox(height: 32),
        SelectableText(
          'Или выберите определенный тип проектов',
          style: responsiveBody(width),
        ),
        const SizedBox(height: 20),
        Wrap(
          key: const Key('projects-filter-wrap'),
          spacing: 8,
          runSpacing: 4,
          children: [
            _filterButton('All', null, width),
            _filterButton('Gamedev', Technology.gamedev, width),
            _filterButton('Unity', Technology.unity, width),
            _filterButton('Flutter', Technology.flutter, width),
            _filterButton('UI/UX Design', Technology.design, width),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
