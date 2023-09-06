import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/shoe_model.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/details/details_view.dart';

class BottomSideCotegori extends StatelessWidget {
  const BottomSideCotegori({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.28,
      child: ListView.builder(
          itemCount: avialableShoes.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            ShoeModel model = avialableShoes[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsView(model: model, isComeFromMoreSection: true),
                ),
              ),
              child: Container(
                width: size.width * 0.5,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 4,
                      child: FadeAnimation(
                        delay: 1,
                        child: Container(
                          width: size.width / 13,
                          height: size.height / 10,
                          color: Colors.red,
                          child: const RotatedBox(
                            quarterTurns: -1,
                            child: Center(
                              child: FadeAnimation(
                                delay: 1.5,
                                child: Text(
                                  "NEW",
                                  style: AppThemes.homeGridNewText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 5,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppConstantsColor.darkTextColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 10,
                      child: FadeAnimation(
                        delay: 1.5,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(-13 / 360),
                          child: Hero(
                            tag: model.model,
                            child: Image(
                              image: AssetImage(
                                model.imgAddres,
                              ),
                              width: size.width * 0.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: FadeAnimation(
                        delay: 2,
                        child: FittedBox(
                          child: Text(
                            "${model.name} ${model.model}",
                            style: AppThemes.homeGridNameAndModel,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: FadeAnimation(
                        delay: 2.2,
                        child: Text(
                          "\$${model.price.toStringAsFixed(2)}",
                          style: AppThemes.homeGridPrice,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
