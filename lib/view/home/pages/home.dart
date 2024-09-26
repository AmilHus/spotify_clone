import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/basic_appbar.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vector.dart';
import 'package:spotify_clone/view/home/widgets/playlist.dart';
import 'package:spotify_clone/view/home/widgets/songs.dart';
import 'package:spotify_clone/view/profile/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: BasicAppbarWidget(
            action: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ProfilePage()));
                },
                icon: const Icon(Icons.person)),
            isBackHidden: true,
            title: SvgPicture.asset(
              AppVector.logo,
              height: 50,
              width: 103,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    AppImages.homePageBackround,
                    width: 334,
                    height: 184,
                  )),
                  const SizedBox(height: 20),
                  const SongsWidget(),
                  const SizedBox(height: 20),
                  const PlayList(),
                ],
              ),
            ),
          ),
        ));
  }
}
