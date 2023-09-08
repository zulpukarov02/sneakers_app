import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/models.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/app_methods.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/bag/components/empty_state.dart';
import 'package:sneakers_app/view/details/components/AddToBagButton.dart';

class BagView extends StatefulWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  _BagViewState createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  int lengthOfItemsOnbag = itemsOnBag.length;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              BagAppBar(
                  width: width,
                  height: height,
                  lengthOfItemsOnbag: lengthOfItemsOnbag),
              itemsOnBag.isEmpty
                  ? const EmptyState()
                  : Column(
                      children: [
                        MainProductList(width: width, height: height),
                        ButtomInfos(width: width, height: height),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtomInfos extends StatelessWidget {
  const ButtomInfos({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.13,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TOTAL", style: AppThemes.bagTotalPrice),
                  Text(
                    "\$${AppMethods.allTheItemsOnBag()}",
                    style: AppThemes.bagSumOfItemOnBag,
                  )
                ],
              ),
            ),
          ),
          FadeAnimation(
            delay: 3,
            child: AddToBagButton(
              onPressed: () {},
              size: Size(width, height),
              color: AppConstantsColor.materialButtonColor,
              text: const Text(
                "Next",
                style: TextStyle(color: AppConstantsColor.lightTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MainProductList extends StatefulWidget {
  const MainProductList({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<MainProductList> createState() => _MainProductListState();
}

class _MainProductListState extends State<MainProductList> {
  int lengthOfItemsOnbag = itemsOnBag.length;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height * 0.67,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsOnBag.length,
        itemBuilder: (context, index) {
          ShoeModel curenttBagItem = itemsOnBag[index];
          return FadeAnimation(
            delay: 1.5 * (index / 4),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: widget.width,
              height: widget.height * 0.2,
              child: Row(
                children: [
                  SizedBox(
                    width: widget.width * 0.4,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: widget.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color:
                                  curenttBagItem.modelColor.withOpacity(0.6)),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 15,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-40 / 360),
                            child: SizedBox(
                              width: 140,
                              height: 140,
                              child: Image(
                                image: AssetImage(curenttBagItem.imgAddres),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        curenttBagItem.model,
                        style: AppThemes.bagProductModel,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$${curenttBagItem.price}",
                        style: AppThemes.bagProductPrice,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                itemsOnBag.remove(curenttBagItem);
                                lengthOfItemsOnbag = itemsOnBag.length;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 15,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "1",
                              style: AppThemes.bagProductNumOfShoe,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BagAppBar extends StatelessWidget {
  const BagAppBar({
    super.key,
    required this.width,
    required this.height,
    required this.lengthOfItemsOnbag,
  });

  final double width;
  final double height;
  final int lengthOfItemsOnbag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: height / 14,
        child: FadeAnimation(
          delay: 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Bag",
                style: AppThemes.bagTitle,
              ),
              Text(
                "Total ${lengthOfItemsOnbag} Items",
                style: AppThemes.bagTotalPrice,
              )
            ],
          ),
        ),
      ),
    );
  }
}
