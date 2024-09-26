import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vector.dart';
import 'package:spotify_clone/core/configs/theme/app_text_styles.dart';
import 'package:spotify_clone/view/choose_mode/pages/choose_mode_page.dart';

import '../../../common/widgets/basic_app_button.dart';

class GetStartedPAge extends StatelessWidget {
  const GetStartedPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.getStartedPageBackGround))),
        child: Column(
          children: [
            SvgPicture.asset(AppVector.logo),
            const Spacer(),
            const Text(
              'Enjoy listening to music',
              style: AppTextStyles.mainTextBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 21,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
              style: AppTextStyles.subText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 21,
            ),
            BasicAppButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ChooseModePage()));
              },
              height: 92,
              title: 'Get Started',
            )
          ],
        ),
      ),
    );
  }
}
