import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/models.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/details/details_view.dart';
import 'package:sneakers_app/view/home/components/BottomSideCotegori.dart';
import 'package:sneakers_app/view/home/components/TextAndIcon.dart';
import 'package:sneakers_app/view/home/components/home_appBar.dart';

import '../../../animations/fade_animations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexofCategori = 0;
  int selectedIndexofFeatured = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(height: size.height * 0.01),
            _mainShoveListView(size),
            const TextAndIcon(),
            BottomSideCotegori(size: size),
          ],
        ),
      ),
    );
  }

  Widget _mainShoveListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          width: size.width / 16,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexofFeatured = index;
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                          fontSize: selectedIndexofFeatured == index ? 21 : 18,
                          color: selectedIndexofFeatured == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedIndexofFeatured == index
                              ? FontWeight.w600
                              : FontWeight.w400),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: size.height * 0.4,
          width: size.width * 0.89,
          // color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: avialableShoes.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              ShoeModel model = avialableShoes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsView(
                              model: model, isComeFromMoreSection: false)));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.height * 0.005,
                    vertical: size.height * 0.01,
                  ),
                  width: size.width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                            color: model.modelColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(model.name,
                                  style: AppThemes.homeProductName),
                              SizedBox(width: size.width * 0.3),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.5,
                          child: Text(model.model,
                              style: AppThemes.homeProductModel),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                          delay: 2,
                          child: Text("\$${model.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductPrice),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 50,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddres,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-30 / 360),
                              child: SizedBox(
                                width: 250,
                                height: 230,
                                child:
                                    Image(image: AssetImage(model.imgAddres)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 170,
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.arrowCircleRight,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexofCategori = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontSize: selectedIndexofCategori == index ? 21 : 18,
                        color: selectedIndexofCategori == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexofCategori == index
                            ? FontWeight.w600
                            : FontWeight.w400),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
