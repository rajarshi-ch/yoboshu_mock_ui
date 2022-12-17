import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';
import 'package:yoboshu_mock_ui/core/constants/app_text_styles.dart';

class MultiselectCard extends StatefulWidget {
  const MultiselectCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MultiselectCard> createState() => _MultiselectCardState();
}

class _MultiselectCardState extends State<MultiselectCard> {
  bool isSelected = false;
  final milisecondsAnim = 300;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: AnimatedContainer(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              isSelected
                  ? const BorderSide(color: kColorAccentLight, width: 1.5)
                  : BorderSide.none,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: kDarkAccent,
          ),
          duration: Duration(milliseconds: milisecondsAnim),
          child: Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            height: 70.0,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  widget.title,
                  style: kStyleTextMain,
                ),
                const Expanded(child: SizedBox()),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: milisecondsAnim),
                  // transitionBuilder: (Widget child, Animation<double> animation) {
                  //   return ScaleTransition(scale: animation, child: child);
                  // },
                  child: isSelected
                      ? const Icon(
                          Icons.check_circle_outline_outlined,
                          color: kColorAccentLight,
                          size: 36,
                          key: ValueKey<String>("checked"),
                        )
                      : const Icon(
                          Icons.circle_outlined,
                          color: kGrayMid,
                          size: 36,
                    key: ValueKey<String>("unchecked"),
                        ),
                ),
              ],
            ),
          )),
    );
  }
}
