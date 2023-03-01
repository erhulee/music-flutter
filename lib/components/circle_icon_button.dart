import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  double size = 60;
  CircleIconButton(this.icon, this.onPressed, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(100))),
      child: IconButton(
          icon: Icon(
            size: 20,
            this.icon,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: onPressed),
    );
  }
}
