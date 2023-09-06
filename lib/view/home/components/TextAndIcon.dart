import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("More", style: AppThemes.homeMoreText),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          )
        ],
      ),
    );
  }
}
