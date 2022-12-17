import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_sizes.dart';
import 'package:yoboshu_mock_ui/core/constants/app_text_styles.dart';

class CheckedTextListItem extends StatelessWidget {
  const CheckedTextListItem({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: kMainPadding, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: kDarkAccent,
                shape: BoxShape.circle
            ),
            child: Icon( Icons.check , color: kColorAccentLight, size: 20,),
          ),
          SizedBox(
            width: 20,
          ),
          Text( title, style: kStyleBodyMain.copyWith( fontSize: 18),)
        ],

      ),
    );
  }
}
