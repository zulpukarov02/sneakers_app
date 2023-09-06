import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FadeAnimation(
            delay: 0.5,
            child: Text(
              "No shoes added",
              style: AppThemes.bagEmptyListTitle,
            ),
          ),
          FadeAnimation(
            delay: 0.5,
            child: Text(
              "Once you have added, come back:",
              style: AppThemes.bagEmptyListSubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
