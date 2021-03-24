import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerName;

  const Header({Key key, this.headerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Text(headerName,style: TextStyle(
          fontSize: 15,
          color:Colors.grey
        ),),
      )
    );
  }
}