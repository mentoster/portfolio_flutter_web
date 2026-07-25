import 'package:flutter/material.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';
import 'big_input_widget.dart';
import 'contact_button.dart';
import 'input_widget.dart';
import 'social_network_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  static const _telegram = SocialNetworkButton(
    name: 'telegram',
    iconPath: 'assets/icons/social_networks/telegram.svg',
    link: 'https://t.me/Mentoster',
    tag: '@mentoster',
    backgroundColor: Colors.blue,
  );
  static const _whatsapp = SocialNetworkButton(
    name: 'whatsapp',
    iconPath: 'assets/icons/social_networks/whatsapp.svg',
    link: 'https://wa.me/79162053580',
    tag: '@mentoster',
    backgroundColor: Colors.green,
  );
  static const _vk = SocialNetworkButton(
    name: 'vkontakte',
    iconPath: 'assets/icons/social_networks/vk.svg',
    link: 'https://vk.com/mentoster_official',
    tag: '@mentoster_official',
    backgroundColor: Colors.blue,
  );

  Widget _socials(bool compact) {
    if (compact) {
      return const Column(
        key: Key('contact-socials-compact'),
        children: [
          _telegram,
          SizedBox(height: 12),
          _whatsapp,
          SizedBox(height: 12),
          _vk,
        ],
      );
    }
    return const Row(
      key: Key('contact-socials-desktop'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 277, child: _telegram),
        SizedBox(width: 277, child: _whatsapp),
        SizedBox(width: 277, child: _vk),
      ],
    );
  }

  Widget _smallInputs(bool compact) {
    const name = SmallInputWidget(
      title: 'Ваше имя',
      hint: 'Введите ваше имя',
      isEmail: false,
    );
    const email = SmallInputWidget(
      title: 'Ваша почта',
      hint: 'Введите вашу почту',
      isEmail: true,
    );

    if (compact) {
      return const Column(
        key: Key('contact-inputs-compact'),
        children: [name, SizedBox(height: 16), email],
      );
    }
    return const Row(
      key: Key('contact-inputs-desktop'),
      children: [
        SizedBox(width: 231, child: name),
        SizedBox(width: 24),
        SizedBox(width: 231, child: email),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(width);
    final padding = ResponsiveLayout.isMobile(width)
        ? 24.0
        : ResponsiveLayout.isTablet(width)
            ? 40.0
            : 64.0;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 982),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(color: Color(0x0a000000), blurRadius: 1),
              BoxShadow(color: Color(0x0a000000), blurRadius: 8, offset: Offset(0, -4)),
              BoxShadow(color: Color(0x0a000000), blurRadius: 24, offset: Offset(0, -16)),
              BoxShadow(color: Color(0x0a000000), blurRadius: 32, offset: Offset(0, -24)),
            ],
            color: Colors.white,
          ),
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _socials(compact),
              const SizedBox(height: defaultPadding),
              SelectableText('Отправить форму на почту:', style: responsiveBody(width)),
              const SizedBox(height: defaultPadding),
              _smallInputs(compact),
              const SizedBox(height: defaultPadding),
              const BigInputWidget(
                title: 'Описание',
                hint: 'Опишите ваш проект',
              ),
              const SizedBox(height: 24),
              const ContactButton(),
            ],
          ),
        ),
      ),
    );
  }
}
