import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({
    super.key,
    required this.size,
    required this.color,
  });
  final Color color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: MaterialButton(
          minWidth: size.width / 1.2,
          height: size.height / 15,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {},
          child: Text("ADD TO BAG"),
        ),
      ),
    );
  }
}
