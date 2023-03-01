import 'package:flutter/material.dart';

class SpinRecord extends StatelessWidget {
  const SpinRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: Image.network(
            "https://pic8.iqiyipic.com/image/20181228/5b/31/p_16_m_601_m4.jpg",
            width: 300,
            height: 300,
            fit: BoxFit.cover));
  }
}
