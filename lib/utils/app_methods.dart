import 'package:flutter/material.dart';
import 'package:sneakers_app/components/custom_snackbars.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/models.dart';

class AppMethods {
  AppMethods._();
  static void addToCart(ShoeModel data, BuildContext context) {
    bool contains = itemsOnBag.contains(data);

    if (contains) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.failedSnackBar());
    } else {
      itemsOnBag.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.successSnackBar());
    }
  }

  static double allTheItemsOnBag() {
    double sumPrice = 0.0;
    for (ShoeModel item in itemsOnBag) {
      sumPrice = sumPrice + item.price;
    }
    return sumPrice;
  }
}
