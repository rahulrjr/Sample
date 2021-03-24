import 'dart:convert';

import 'package:animoto/bloc/templateBloc/template_bloc.dart';
import 'package:animoto/bloc/userBloc/user_bloc.dart';
import 'package:animoto/mocks/model/user.dart';
import 'package:animoto/screens/settingsView.dart';
import 'package:animoto/screens/showTemplates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = User();

  int _selectedIndex = 0;

  List<Widget> items = <Widget>[
    Center(child: Text("videos")),
    ShowTemplates(),
    SettingsView(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      BlocProvider.of<TemplateBloc>(context).add(GetTemplateInitialEvent());
    } else if (index == 2) {
      BlocProvider.of<UserBloc>(context).add(UserInitialEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: items.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black54,
        elevation: 4,
        showSelectedLabels: true,
        onTap: onItemTap,
        currentIndex: _selectedIndex,
        items: [
          _buildItem(Icons.video_collection, 'Videos'),
          _buildItem(Icons.library_add_rounded, 'Templates'),
          _buildItem(Icons.settings, 'Settings')
        ],
      ),
    ));
  }

  BottomNavigationBarItem _buildItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      label: label,
    );
  }
}
