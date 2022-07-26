import 'package:flutter/material.dart';

class RightImageColumn extends StatelessWidget {
  const RightImageColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          SizedBox(
              height: size.height - 64,
              child: Image.asset("assets/images/my_photo.png",
                  fit: BoxFit.fitHeight))
        ],
      ),
    );
  }
}
