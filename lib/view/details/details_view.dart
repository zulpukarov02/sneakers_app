import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/models.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/app_methods.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/details/components/AddToBagButton.dart';
import 'package:sneakers_app/view/details/components/TopProductImageAndBg.dart';
import 'package:sneakers_app/view/details/components/app_bar.dart';

class DetailsView extends StatefulWidget {
  const DetailsView(
      {Key? key, required this.model, required this.isComeFromMoreSection})
      : super(key: key);
  final ShoeModel model;
  final bool isComeFromMoreSection;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  bool _isCountrysSelected = false;
  int? _isSizeSelected;
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TopProductImageAndBg(
                    size: size,
                    model: widget.model,
                    isComeFromMoreSection: widget.isComeFromMoreSection),
                _morePicOfProduct(size),
                const Padding(
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
                      _moreDaetailsText(size.width, size.height),
                      _sizeAndCountry(size),
                      _bottomSizeSelection(size),
                      AddToBagButton(
                        onPressed: () {
                          AppMethods.addToCart(widget.model, context);
                        },
                        size: size,
                        color: widget.model.modelColor,
                        text: const Text("ADD TO BAG"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomSizeSelection(Size size) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: size.width,
      height: size.height * 0.07,
      child: FadeAnimation(
        delay: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Try it",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(width: 8),
                    RotatedBox(
                        quarterTurns: -1,
                        child: FaIcon(FontAwesomeIcons.shoePrints)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSizeSelected = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isSizeSelected == index
                                ? Colors.black
                                : Colors.grey,
                            width: 1.5,
                          ),
                          color: _isSizeSelected == index
                              ? Colors.black
                              : AppConstantsColor.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        width: size.width * 0.15,
                        child: Center(
                          child: Text(
                            sizes[index].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _isSizeSelected == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _sizeAndCountry(Size size) {
    return FadeAnimation(
      delay: 2.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Size",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppConstantsColor.darkTextColor),
              ),
            ),
            SizedBox(
              width: size.width * 0.35,
              height: size.height * 0.05,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isCountrysSelected = false;
                      });
                    },
                    child: Text(
                      "Uk",
                      style: TextStyle(
                          fontWeight: _isCountrysSelected
                              ? FontWeight.w400
                              : FontWeight.bold,
                          color: _isCountrysSelected
                              ? Colors.grey
                              : AppConstantsColor.darkTextColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isCountrysSelected = true;
                      });
                    },
                    child: Text(
                      "USA",
                      style: TextStyle(
                          fontWeight: !_isCountrysSelected
                              ? FontWeight.w400
                              : FontWeight.bold,
                          color: !_isCountrysSelected
                              ? Colors.grey
                              : AppConstantsColor.darkTextColor),
                    ),
                  ),
                ],
              ),
            )
          ],
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
            widget.model.model,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor),
          ),
          Expanded(child: Container()),
          Text(
            "\$${widget.model.price.toStringAsFixed(2)}",
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
                        image: AssetImage(widget.model.imgAddres),
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

  Widget roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.imgAddres),
      ),
    );
  }
}
