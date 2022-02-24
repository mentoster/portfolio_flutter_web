import 'package:flutter/material.dart';

class SmallInputWidget extends StatelessWidget {
  final String title;
  final String hint;
  const SmallInputWidget({Key? key, required this.title, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 231,
        child: TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide:
                    const BorderSide(color: Color(0xAAB1DBFF), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide:
                    const BorderSide(color: Color(0xAAB1DBFF), width: 2.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.67)),
              hintText: "Введите ваше имя",
              labelText: title,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              fillColor: Colors.transparent),
        ));
  }
}
