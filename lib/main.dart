import 'package:floating_tab_bar/tabs.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig(
    enableFullSizeContentView: true,
  );
  await config.apply();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureMacosWindowUtils();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'Floating TabBar',
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const TabsView(),
    );
  }
}
