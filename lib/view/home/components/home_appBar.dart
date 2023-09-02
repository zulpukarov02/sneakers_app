import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppConstantsColor.backgroundColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(
          "Discover",
          style: AppThemes.homeAppBar,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.search,
            size: 25,
            color: AppConstantsColor.darkTextColor,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              size: 25,
              color: AppConstantsColor.darkTextColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
