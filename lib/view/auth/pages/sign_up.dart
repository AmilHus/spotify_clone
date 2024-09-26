import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/basic_app_button.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/configs/theme/app_text_styles.dart';
import 'package:spotify_clone/data/models/auth/signup_user_req_model.dart';
import 'package:spotify_clone/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify_clone/view/auth/pages/sign_in.dart';
import 'package:spotify_clone/common/widgets/basic_appbar.dart';

import '../../../core/configs/assets/app_vector.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbarWidget(
        title: SvgPicture.asset(
          AppVector.logo,
          height: 33,
          width: 103,
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 47,
            ),
            Center(
              child: Text('Register',
                  style: AppTextStyles.mainTextBold.copyWith(
                      fontSize: 30,
                      color: context.isDarkMode
                          ? AppColors.lightText
                          : AppColors.darkText)),
            ),
            const SizedBox(height: 26),
            _buildInputFields(context, 'Full Name', _fullNameController),
            const SizedBox(height: 16),
            _buildInputFields(context, 'Enter Email', _emailController),
            const SizedBox(height: 16),
            _buildInputFields(context, 'Password', _passwordController),
            const SizedBox(height: 33),
            BasicAppButton(
                onPressed: () async {
                  final result = await sl<SignupUseCase>().call(
                      params: SignUpUserRequestModel(
                          email: _emailController.text,
                          fullname: _fullNameController.text,
                          password: _passwordController.text));

                  result.fold((l) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.errorColor,
                        content: Text(l.toString(),
                            style: AppTextStyles.buttonTextBold.copyWith(
                              color: AppColors.lightText,
                            ))));
                  },
                      (r) => {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: AppColors.primary,
                                content: Text(r.toString(),
                                    style:
                                        AppTextStyles.buttonTextBold.copyWith(
                                      color: AppColors.lightText,
                                    )))),
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage()),
                                (route) => false)
                          });
                },
                title: 'Create Account'),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Do You Have An Account?',
                  style: AppTextStyles.subText
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(width: 3),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignInPage()));
                  },
                  child: Text('Sign In',
                      style: AppTextStyles.subText.copyWith(
                          color: AppColors.blueText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)))
            ])
          ])),
    );
  }

  Widget _buildInputFields(BuildContext context, String hintText,
      TextEditingController textController) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(hintText: hintText)
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
