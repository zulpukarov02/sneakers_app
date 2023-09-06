import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/models/shoe_model.dart';

class TopProductImageAndBg extends StatelessWidget {
  const TopProductImageAndBg({
    super.key,
    required this.size,
    required this.model,
    required this.isComeFromMoreSection,
  });

  final Size size;
  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: size.width,
                height: size.height / 2.2,
                decoration: BoxDecoration(
                  color: model.modelColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 100,
            child: Hero(
              tag: isComeFromMoreSection ? model.model : model.imgAddres,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(image: AssetImage(model.imgAddres)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
