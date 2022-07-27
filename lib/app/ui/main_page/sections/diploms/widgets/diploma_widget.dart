import 'package:flutter/material.dart';

class DiplomaWidget extends StatelessWidget {
  const DiplomaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            "http://upload.portal.edu-region.ru/resize_cache/8622/c3bed4c46e3bebf9034448fed65e7b8e/iblock/5cc/5ccc8098ce63d2bfecded7e32dce4525/00a987972769c140e53bf8f7607f3cb6.jpeg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
