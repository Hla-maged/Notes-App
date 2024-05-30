import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  CustomIcon({required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: IconButton(icon: Icon(icon), onPressed: onPressed),
        ));
  }
}
