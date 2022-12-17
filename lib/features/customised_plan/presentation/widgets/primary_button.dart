import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_sizes.dart';
import 'package:yoboshu_mock_ui/core/constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key, required this.title, required this.onTap}) : super(key: key);
  final String title;
  final Function onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: kColorAccentDark,
                borderRadius: BorderRadius.circular( kDefaultBorderRadius)
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                  color: kColorAccentLight,
                  borderRadius: BorderRadius.circular( kDefaultBorderRadius)
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(title.toUpperCase(), style: kStyleTextMain.copyWith( color: Colors.black, fontWeight: FontWeight.w600),)
              ),
            ),
          ],
        ));
  }
}
