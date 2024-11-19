import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/PasswordController.dart';

class MyTextField extends StatelessWidget {
  final bool hasLabel;
  final String? label;
  final String? textHint;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Text? text;
  final bool isPassword;
  final TextStyle? textColor;
  final TextEditingController controller;

  MyTextField(
      {super.key,
      required this.hasLabel,
      this.label,
      this.textHint,
      this.fillColor,
      this.borderColor,
      this.textColor,
      required this.controller,
      this.text,
      this.prefixIcon,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    final inputDecoration = InputDecoration(
      prefixIcon: prefixIcon ?? null,
      hintText: textHint,
      hintStyle: TextStyle(color: Colors.white12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white12, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white12, width: 1),
      ),
      contentPadding: const EdgeInsets.all(14),
      isCollapsed: true,
      filled: true,
      fillColor: fillColor ?? Colors.white12,
    );

    final passwordInputDecoration = InputDecoration(
      prefixIcon: Icon(Icons.lock),
      suffixIcon: passwordController.isVisible.value
          ? IconButton(
              onPressed: () {
                passwordController.isVisible.value = false;
              },
              icon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white30,
              ))
          : IconButton(
              onPressed: () {
                passwordController.isVisible.value = true;
              },
              icon: Icon(Icons.remove_red_eye, color: Colors.white30)),
      hintText: textHint,
      hintStyle: TextStyle(color: Colors.white12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white12, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white12, width: 1),
      ),
      contentPadding: const EdgeInsets.all(14),
      isCollapsed: true,
      filled: true,
      fillColor: fillColor ?? Colors.white12,
    );

    final textField = TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      style: textColor ?? TextStyle(color: Colors.white54),
      decoration: isPassword ? passwordInputDecoration : inputDecoration,
    );

    return hasLabel
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label ?? "", style: TextStyle(color: Colors.white60)),
              const SizedBox(height: 6.18),
              isPassword
                  ? Obx(() {
                    return TextField(
                      obscureText: passwordController.isVisible.value,
                      controller: controller,
                      textAlignVertical: TextAlignVertical.center,
                      style: textColor ?? TextStyle(color: Colors.white54),
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: passwordController.isVisible.value
                            ? IconButton(
                            onPressed: () {
                              passwordController.isVisible.value = false;
                            },
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white30,
                            ))
                            : IconButton(
                            onPressed: () {
                              passwordController.isVisible.value = true;
                            },
                            icon: Icon(Icons.remove_red_eye,
                                color: Colors.white30)),
                        hintText: textHint,
                        hintStyle: TextStyle(color: Colors.white12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: borderColor ?? Colors.white12, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: borderColor ?? Colors.white12, width: 1),
                        ),
                        contentPadding: const EdgeInsets.all(14),
                        isCollapsed: true,
                        filled: true,
                        fillColor: fillColor ?? Colors.white12,
                      ),
                    );
              })
                  : textField,
            ],
          )
        : textField;
  }
}
