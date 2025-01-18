import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/view/auth/pages/signin_and_signup.dart';
import 'package:spotify_clone/view/choose_mode/bloc/choose_theme_mode_cubit.dart';

import '../../../common/widgets/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vector.dart';
import '../../../core/configs/theme/app_text_styles.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModePageBackGround))),
        child: Column(
          children: [
            SvgPicture.asset(AppVector.logo),
            const Spacer(),
            const Text(
              'Choose mode',
              style: AppTextStyles.mainTextBold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 21,
            ),
            _buildChooseModeButtons(context),
            const SizedBox(
              height: 50,
            ),
            BasicAppButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SigninAndSignupPage()));
              },
              height: 92,
              title: 'Continue',
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChooseModeButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChooseModeButton(
            AppVector.darkModeIcon, 'DarkMode', context, ThemeMode.dark),
        const SizedBox(width: 70),
        _buildChooseModeButton(
            AppVector.lightModeIcon, 'LightMode', context, ThemeMode.light),
      ],
    );
  }

  Widget _buildChooseModeButton(
      String modeIcon, String modeText, BuildContext context, ThemeMode mode) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<ChooseThemeModeCubit>().updateThemeMode(mode);
          },
          child: ClipOval(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 73,
                  width: 73,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey.withValues(alpha: 0.2),
                  ),
                  child: SvgPicture.asset(modeIcon, fit: BoxFit.none),
                )),
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        Text(
          modeText,
          style: AppTextStyles.mainTextMedium,
        )
      ],
    );
  }
}
