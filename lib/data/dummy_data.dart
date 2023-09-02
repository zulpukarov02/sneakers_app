import 'package:flutter/material.dart';

import '../models/models.dart';

final List<ShoeModel> avialableShoes = [
  ShoeModel(
    name: "NIKE",
    model: "AIR-MAX",
    price: 130.00,
    imgAddres: "assets/images/nike1.png",
    modelColor: const Color(0xffDE0106),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDA MIX",
    price: 190.00,
    imgAddres: "assets/images/nike2.png",
    modelColor: const Color(0Xff3F7943),
  ),
  ShoeModel(
    name: "NIKE",
    model: "ZOOM",
    price: 160.00,
    imgAddres: "assets/images/nike3.png",
    modelColor: const Color(0xffE66863),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-FORSE",
    price: 110.00,
    imgAddres: "assets/images/nike4.png",
    modelColor: const Color(0xffD7D8DC),
  ),
  ShoeModel(
    name: "NIKE",
    model: "AIR-JORDAN LOW",
    price: 150.00,
    imgAddres: "assets/images/nike5.png",
    modelColor: const Color(0xff37376B),
  ),
  ShoeModel(
    name: "NIKE",
    model: "ZOOM",
    price: 120.00,
    imgAddres: "assets/images/nike6.png",
    modelColor: Color(0xffE4E3E8),
  ),
  ShoeModel(
    name: "NIKE",
    model: "FOCUS LOP",
    price: 190.00,
    imgAddres: "assets/images/nike7.png",
    modelColor: const Color(0xffD68043),
  ),
  ShoeModel(
    name: "NIKE",
    model: "LURANTER",
    price: 230.00,
    imgAddres: "assets/images/nike8.png",
    modelColor: const Color(0xffE2E3E5),
  ),
];

List<ShoeModel> itemsOnBag = [];

final List<UserStatus> userStatus = [
  UserStatus(
    emoji: '😴',
    txt: "Away",
    selectColor: const Color(0xff121212),
    unSelectColor: const Color(0xffbfbfbf),
  ),
  UserStatus(
    emoji: '💻',
    txt: "At Work",
    selectColor: const Color(0xff05a35c),
    unSelectColor: const Color(0xffCEEBD9),
  ),
  UserStatus(
    emoji: '🎮',
    txt: "Gaming",
    selectColor: const Color(0xffFFD237),
    unSelectColor: const Color(0xffFDDFBB),
  ),
  UserStatus(
    emoji: '😮',
    txt: "Busy",
    selectColor: const Color(0xffba3a3a),
    unSelectColor: const Color(0xffdb9797),
  ),
];

final List categories = [
  "Nike",
  'Adidas',
  'Jordan',
  'Puma',
  'Gucci',
  'Tom Ford',
  'Koio',
];
final List featured = [
  'New',
  'Featured',
  'Upcoming',
];
final List<double> sizes = [6, 7.5, 8, 9.5];
