import 'package:flutter/material.dart';

class DiplomaTagWidget extends StatelessWidget {
  const DiplomaTagWidget(
      {Key? key, required this.name, required this.icon, required this.color})
      : super(key: key);
  final String name;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 8,
          ),
          SelectableText(name)
        ],
      ),
    );
  }
}
