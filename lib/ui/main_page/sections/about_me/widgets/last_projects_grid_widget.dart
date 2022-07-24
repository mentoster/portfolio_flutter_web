import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/global_widgets/project_card.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';

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
        height: 764,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          padding: const EdgeInsets.only(
              left: defaultPadding * 2, right: defaultPadding * 2),
          childAspectRatio: 1.621848,
          children: List.generate(4, (index) {
            return const ProjectCard();
          }),
        ),
      ),
    );
  }
}
