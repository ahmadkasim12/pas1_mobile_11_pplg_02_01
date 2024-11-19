import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyTextButton.dart';
import 'MyTextField.dart';

class MyAppBar extends StatelessWidget {
  final bool hasSearchBar;
  final String textTitle;
  const MyAppBar({super.key, required this.hasSearchBar, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    final minecraft = TextEditingController().obs;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: hasSearchBar ?
            MyTextField(hasLabel: false, controller: minecraft.value, isPassword: false,)
            : Text(textTitle, style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white, fontSize: 14 * 1.618),)
          ),
          SizedBox(width: 10,),
          hasSearchBar ?
          MyTextButton(
            text: "Search",
            onTap: () {

            },
            isLoading: false,) :
          SizedBox()
        ],
      ),
    );
  }
}
