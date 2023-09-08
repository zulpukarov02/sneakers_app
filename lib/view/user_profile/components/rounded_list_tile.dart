import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';

class RoundedListTile extends StatelessWidget {
  const RoundedListTile(
      {Key? key,
      this.leaDingBackColor,
      required this.icon,
      required this.title,
      required this.trailing})
      : super(key: key);
  final Color? leaDingBackColor;
  final IconData icon;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: leaDingBackColor,
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: AppConstantsColor.lightTextColor,
                ),
              ),
            ),
            title: Text(
              title,
              style: AppThemes.profileRepeatedListTileTitle,
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
