import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/basic_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vector.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/configs/theme/app_text_styles.dart';
import 'package:spotify_clone/view/auth/pages/sign_in.dart';
import 'package:spotify_clone/view/auth/pages/sign_up.dart';
import 'package:spotify_clone/common/widgets/basic_appbar.dart';


class SigninAndSignupPage extends StatelessWidget {
  const SigninAndSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbarWidget(),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.authentificationPageBackGround))),
        child:Stack(
          children: [
            Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVector.logo),
                  const SizedBox(height: 55,),
                  Text('Enjoy Listening To Music', style: AppTextStyles.mainTextBold.copyWith(color: context.isDarkMode ? AppColors.lightText : AppColors.darkText )),
                  const SizedBox(height: 21,),
                  Text('Spotify is a proprietary Swedish audio streaming and media services provider',textAlign: TextAlign.center , style: AppTextStyles.subText.copyWith(color: context.isDarkMode ? AppColors.lightText : AppColors.darkGrey ),),
                  const SizedBox(height: 53,),
                  _buildSignInAndSignUpButtons(context)
                ],),
            ),
          ),]
        )));
  }

  Widget _buildSignInAndSignUpButtons(BuildContext context){
    return Row(
      children: [
        Expanded(flex:1,child: BasicAppButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));}, title: 'Register')),
        const SizedBox(width: 20,),
        Expanded(flex:1,child:TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SignInPage()));}, child: SizedBox(width:147, height: 73,child: Center(child: Text('Sign In', style: AppTextStyles.buttonTextBold.copyWith(color: context.isDarkMode ? AppColors.lightText : AppColors.darkText ),)))))
      ],
    );
  }
}