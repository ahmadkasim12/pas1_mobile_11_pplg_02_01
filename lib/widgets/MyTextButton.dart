import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final double? height;
  const MyTextButton({super.key, required this.text, required this.onTap, required this.isLoading, this.height});

  TextButtonThemeData get white {
    return TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.white12),
              )
          ),
          backgroundColor: WidgetStateProperty.all(Colors.white12),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
        data: this.white,
        child: SizedBox(
          height: height ?? double.infinity,
          child: TextButton(
            onPressed: onTap,
            child: Center(
              child: isLoading ? SizedBox(width: 13, height: 13, child: CircularProgressIndicator(color: Colors.white60)) : Text(text, style: TextStyle(color: Colors.white),),
            ),
          ),
        )
    );
  }
}
