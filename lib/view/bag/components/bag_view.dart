import 'package:flutter/material.dart';
import 'package:sneakers_app/view/bag/components/empty_state.dart';

class BagView extends StatefulWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  _BagViewState createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: EmptyState(),
      ),
    );
  }
}
