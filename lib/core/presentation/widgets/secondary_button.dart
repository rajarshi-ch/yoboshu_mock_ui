import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_sizes.dart';
import 'package:yoboshu_mock_ui/core/constants/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: (){}, child: Text("Already a user ->" , style: kStyleTextSubtitle,),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(kDarkAccent),
      shape: MaterialStateProperty.all<OutlinedBorder>( RoundedRectangleBorder( borderRadius: BorderRadius.circular( kDefaultBorderRadius))),
      side: MaterialStateProperty.all<BorderSide>(BorderSide( color: kGrayBright, width: 0.5))
    ),);
  }
}
