import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 32,
              offset: Offset(0, 24),
            ),
          ],
          color: Colors.white),
      height: 357,
      width: 579,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
            child: Container(
              height: 357,
              width: 289.5,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Flutter & UI/UX Design",
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                "Социальная сеть\n",
                style: heading2,
              ),
              Row(
                children: const [
                  Text(
                    "Подробнее",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: Colors.black,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
