import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/models/models.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/details/components/app_bar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(
      {Key? key, required this.model, required this.isComeFromMoreSection})
      : super(key: key);
  final ShoeModel model;
  final bool isComeFromMoreSection;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const CustomDetailsAppBarView(),
        body: SizedBox(
          width: size.width,
          height: size.height * 1.1,
          child: Column(
            children: [
              TopProductImageAndBg(
                  size: size,
                  model: model,
                  isComeFromMoreSection: isComeFromMoreSection),
              _morePicOfProduct(size),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    thickness: 3,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productNameAndPrice(),
                    _prudoctInfo(size.width, size.height),
                    _moreDaetailsText(size.width, size.height)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _moreDaetailsText(width, height) {
    return const FadeAnimation(
      delay: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          "MORE DETAILS",
          style: AppThemes.detailsMoreText,
        ),
      ),
    );
  }

  Widget _prudoctInfo(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: SizedBox(
        width: width,
        height: height / 9,
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.s",
          style: AppThemes.detailsProductDescriptions,
        ),
      ),
    );
  }

  Widget _productNameAndPrice() {
    return FadeAnimation(
      delay: 1,
      child: Row(
        children: [
          Text(
            model.model,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor),
          ),
          Expanded(child: Container()),
          Text(
            "\$${model.price.toStringAsFixed(2)}",
            style: AppThemes.detailsProductPrice,
          ),
        ],
      ),
    );
  }

  Widget _morePicOfProduct(Size size) {
    return FadeAnimation(
      delay: 0.5,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => index == 3
                ? Container(
                    padding: const EdgeInsets.all(2),
                    width: size.width / 5,
                    height: size.height / 14,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(model.imgAddres),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(1),
                          BlendMode.darken,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 30,
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: roundedImage(size.width, size.height),
                  ),
          ),
        ),
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(model.imgAddres),
      ),
    );
  }
}

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
