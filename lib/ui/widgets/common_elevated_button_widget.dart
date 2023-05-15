import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,  required this.title, required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          onPressed: onTap,
          child:  Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: .6),
          )),
    );
  }
}