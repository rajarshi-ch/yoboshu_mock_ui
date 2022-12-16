import "package:flutter/material.dart";
import 'package:yoboshu_mock_ui/core/constants/app_colors.dart';

class MultiselectCard extends StatefulWidget {
  const MultiselectCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MultiselectCard> createState() => _MultiselectCardState();
}

class _MultiselectCardState extends State<MultiselectCard> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected ;
        });
      },
      child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
          shape: RoundedRectangleBorder(
              side: isSelected ? const BorderSide(color: Colors.blue, width: 2.0) : BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: const EdgeInsets.only(
                left: 10, right: 10, top: 5, bottom: 5),
            height: 70.0,
            child: Row(
              children:  [
                const Expanded(child: SizedBox()),
                Text(widget.title),
                const Expanded(child: SizedBox()),
                isSelected ? const Icon(Icons.check_circle_outline_outlined , color: kColorAccentLight,) : const Icon(Icons.radio_button_unchecked),
              ],
            ),
          )),
    );
  }
}
