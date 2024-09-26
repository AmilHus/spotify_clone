import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/basic_appbar.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/core/configs/theme/app_text_styles.dart';
import 'package:spotify_clone/view/profile/bloc/profile_cubit.dart';
import 'package:spotify_clone/view/profile/bloc/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbarWidget(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoisLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if (state is ProfileInfoisLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(AppURLs.defaultImage))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    state.userEntity.email!,
                    style: AppTextStyles.mainTextMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.userEntity.fullName!,
                    style: AppTextStyles.mainTextBold,
                  )
                ],
              );
            }

            if (state is ProfileInfoisLoadFailure) {
              return const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                    child: Column(children: [
                  Icon(
                    Icons.error,
                    color: AppColors.errorColor,
                    size: 100,
                  ),
                  Text(
                    'Please Try Again',
                    style: AppTextStyles.mainTextMedium,
                  )
                ])),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
