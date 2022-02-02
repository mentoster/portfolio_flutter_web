import 'package:flutter/material.dart';

class RightImageColumn extends StatelessWidget {
  const RightImageColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 86,
        ),
        SizedBox(
            height: size.height - 86,
            child: Image.asset("assets/images/my_photo.png",
                fit: BoxFit.fitHeight))
      ],
    );
  }
}
