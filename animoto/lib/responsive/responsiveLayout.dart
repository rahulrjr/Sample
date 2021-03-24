import 'package:animoto/responsive/constants.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout(
      {Key key, @required this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        if (boxConstraints.maxWidth < kTabletBreakpoint) {
          return mobile;
        } else if (boxConstraints.maxWidth >= kTabletBreakpoint &&
            boxConstraints.maxWidth < kDesktopBreakpoint) {
          return tablet ?? mobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
