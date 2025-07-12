

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('테마'),
            trailing: DropdownButton<ThemeMode>(
              value: settings.themeMode,
              onChanged: (mode) {
                if (mode != null) settings.setThemeMode(mode);
              },
              items: const [
                DropdownMenuItem(value: ThemeMode.light, child: Text('라이트')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('다크')),
                DropdownMenuItem(value: ThemeMode.system, child: Text('시스템')),
              ],
            ),
          ),
          ListTile(
            title: const Text('앱 초기화'),
            trailing: Icon(Icons.refresh),
            onTap: () {
              // Provider.of<CartProvider>(context, listen: false).clearAll();
            },
          ),
        ],
      ),
    );
  }
}
