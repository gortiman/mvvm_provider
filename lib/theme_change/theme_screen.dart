import 'package:flutter/material.dart';
import 'package:mvvm_provider/theme_change/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({super.key});

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeChangeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ThemeChange"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Light'),
              value: ThemeMode.light,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('dark'),
            value: ThemeMode.dark,
            groupValue: themeChange.themeMode,
            onChanged: themeChange.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('system'),
            value: ThemeMode.system,
            groupValue: themeChange.themeMode,
            onChanged: themeChange.setTheme,
          ),
          Icon(Icons.favorite, size: 100,)
        ],
      ),
    );
  }
}
