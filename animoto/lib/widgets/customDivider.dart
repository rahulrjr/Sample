import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Divider(
          indent: 173,
          endIndent: 174,
          color:Colors.blueAccent,
          thickness: 1.5,
        ),
      )
    );
  }
}