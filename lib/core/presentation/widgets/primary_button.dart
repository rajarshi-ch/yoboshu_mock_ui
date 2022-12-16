import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.title , required this.onPressed, Key? key}) : super(key: key);
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide.none
            )
        )
      ),
      
      onPressed: (){ onPressed(); },
      child: Text(title),
    );

  }
}
