import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_icon.dart';

class AppBarW extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String title;
  AppBarW({required this.title,required this.icon,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 24),),
    CustomIcon(
      icon: icon, 
      onPressed: onPressed)
    
    ]);
  }
}
