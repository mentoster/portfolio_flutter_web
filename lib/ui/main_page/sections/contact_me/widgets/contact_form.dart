import 'package:flutter/material.dart';

import '../../../../theme/app_constants.dart';
import 'big_input_widget.dart';
import 'contact_button.dart';
import 'input_widget.dart';
import 'social_network_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 982,
        height: 700,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 8,
              offset: Offset(0, -4),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 24,
              offset: Offset(0, -16),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 32,
              offset: Offset(0, -24),
            ),
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.all(64),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SocialNetworkButton(
                icon: Icon(Icons.ac_unit),
                link: "vk.com",
                tag: "@mentoster_official",
                backgroundColor: Colors.blue,
              ),
              SocialNetworkButton(
                icon: Icon(Icons.ac_unit),
                link: "telegram.com",
                tag: "@mentoster",
                backgroundColor: Colors.blue,
              ),
              SocialNetworkButton(
                icon: Icon(Icons.ac_unit),
                link: "whatsapp.com",
                tag: "@mentoster",
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(
            height: 64,
          ),
          Row(
            children: [
              SmallInputWidget(title: "Имя", hint: "Введите ваше имя"),
              SizedBox(
                width: 24,
              ),
              SmallInputWidget(title: "Почта", hint: "Введите вашу почту"),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          BigInputWidget(
            title: "Описание",
            hint: "Опишите ваш проект",
          ),
          SizedBox(
            height: 24,
          ),
          ContactButton()
        ]),
      ),
    );
  }
}
