import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color? color;
  const MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Text(buttonText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }
}
