import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';

class CustomDetailsAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomDetailsAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: const Text(
        "Nike",
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppConstantsColor.darkTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
