import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableIcon extends StatelessWidget {
  ReusableIcon({required this.iconUsed, required this.gender});

  final IconData iconUsed;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconUsed,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
