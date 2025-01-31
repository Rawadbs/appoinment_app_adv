import 'package:appoinment_app_adv/core/theme/colors.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Rawad!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How are you Today?',
              style: TextStyles.font13ldarkgreyRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
            radius: 24,
            backgroundColor: ColorsManger.morelightergrey,
            child: SvgPicture.asset('assets/svg/notfication_button.svg'))
      ],
    );
  }
}
