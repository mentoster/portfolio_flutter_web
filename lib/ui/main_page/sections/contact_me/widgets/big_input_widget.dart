import 'package:flutter/material.dart';

class BigInputWidget extends StatelessWidget {
  final String title;
  final String hint;
  const BigInputWidget({
    Key? key,
    required this.title,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextFormField(
      maxLines: 7,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xAAB1DBFF), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Color(0xAAB1DBFF), width: 2.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.67)),
          hintText: "Введите ваше имя",
          labelText: title,
          fillColor: Colors.transparent),
    ));
  }
}
