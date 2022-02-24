import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/global_widgets/project_card.dart';

class LastProjectsGridWidget extends StatelessWidget {
  const LastProjectsGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SizedBox(
        height: 700,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.621848,
          children: List.generate(4, (index) {
            return const ProjectCard();
          }),
        ),
      ),
    );
  }
}
