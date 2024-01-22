import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

class TabsController {
  TabsController({required int length}) {
    controller = MacosTabController(length: length);

    _methodChannel.setMethodCallHandler((call) async {
      final method = call.method;
      final arguments = call.arguments;

      switch (method) {
        case 'setActiveTabBarIndex':
          setActiveTabBarIndex(arguments['index'] as int);
      }
    });
  }

  late final MacosTabController controller;

  static const _methodChannel = MethodChannel('floating_tab_bar.method_channel');

  Future<void> toggleVisibility() async {
    await _methodChannel.invokeMethod('toggleTabBarVisibility');
  }

  void setActiveTabBarIndex(int index) {
    controller.index = index;
  }
}
