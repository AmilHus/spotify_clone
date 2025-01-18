import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class BasicAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackHidden;
  final Widget? title;
  final Widget? action;
  const BasicAppbarWidget(
      {super.key, this.title, this.isBackHidden = false, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(''),
      actions: [action ?? Container()], // Убираем тень
      leading: isBackHidden
          ? null
          : IconButton(
              icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkGrey.withValues(alpha: 0.13)),
                  child: Icon(Icons.arrow_back_ios_new,
                      size: 15,
                      color: context.isDarkMode
                          ? AppColors.lightText
                          : AppColors.darkText)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
