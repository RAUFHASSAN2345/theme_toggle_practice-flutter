import 'package:flutter/material.dart';
import 'package:light_and_dark_theme/theme_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData _themeData;

  @override
  void initState() {
    _loadTheme();

    super.initState();
  }

  void _loadTheme() async {
    String? themeName = await ThemePreference.getTheme();

    setState(() {
      _themeData = themeName == 'dark' ? ThemeData.dark() : ThemeData.light();
    });
  }

  void _toggleTheme() {
    String themeName =
        _themeData.brightness == Brightness.dark ? 'light' : 'dark';
    ThemePreference.setTheme(themeName);

    setState(() {
      _themeData = _themeData.brightness == Brightness.dark
          ? ThemeData.light()
          : ThemeData.dark();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Theme Toggle practice'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleTheme,
            child: _themeData.brightness == Brightness.dark
                ? Text('light mode')
                : Text('dark mode'),
          ),
        ),
      ),
    );
  }
}
