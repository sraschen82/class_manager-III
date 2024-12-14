import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppButtons {
  static Widget gradientButton(
      {required String text, required VoidCallback action}) {
    return TextButton(
        onPressed: action,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          backgroundBuilder: (context, states, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: MyColors().gradientHomePage(),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColors().titleColor),
              ),
              child: Center(
                child: Text(
                  text,
                ),
              ),
            );
          },
        ),
        child: SizedBox.shrink());
  }
}
