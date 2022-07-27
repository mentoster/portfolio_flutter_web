import 'package:flutter/material.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';
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
        padding: const EdgeInsets.all(64),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SocialNetworkButton(
                name: "telegram",
                iconPath: "assets/icons/social_networks/telegram.svg",
                link: "telegram.com",
                tag: "@mentoster",
                backgroundColor: Colors.blue,
              ),
              SocialNetworkButton(
                name: "whatsapp",
                iconPath: "assets/icons/social_networks/whatsapp.svg",
                link: "whatsapp.com",
                tag: "@mentoster",
                backgroundColor: Colors.green,
              ),
              SocialNetworkButton(
                name: "vkontakte",
                iconPath: "assets/icons/social_networks/vk.svg",
                link: "vk.com",
                tag: "@mentoster_official",
                backgroundColor: Colors.blue,
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const SelectableText(
            "Отправить форму на почту:",
            style: usualText,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: const [
              SmallInputWidget(title: "Ваше имя", hint: "Введите ваше имя"),
              SizedBox(
                width: 24,
              ),
              SmallInputWidget(title: "Ваша почта", hint: "Введите вашу почту"),
            ],
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const BigInputWidget(
            title: "Описание",
            hint: "Опишите ваш проект",
          ),
          const SizedBox(
            height: 24,
          ),
          const ContactButton()
        ]),
      ),
    );
  }
}
