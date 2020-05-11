import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round/bottom_app/base.dart';

void main() => runApp(MoodTheme());

class MoodTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) =>  ThemeData(
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'project',
            theme: theme,
            home: Base(),
          );
        }
    );
  }
}


