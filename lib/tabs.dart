import 'package:floating_tab_bar/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  final _tabItems = const [
    MacosTab(label: 'Home'),
    MacosTab(label: 'Favorites'),
    MacosTab(label: 'Notifications'),
    MacosTab(label: 'Settings'),
  ];

  late final TabsController _tabsController = TabsController(length: _tabItems.length);

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      child: MacosScaffold(
        toolBar: ToolBar(
          title: const Text('FloatingTabBar'),
          actions: [
            ToolBarIconButton(
              showLabel: false,
              label: "Toggle TabBar visibility",
              icon: const MacosIcon(CupertinoIcons.sidebar_left),
              onPressed: _tabsController.toggleVisibility,
            ),
            const ToolBarSpacer(),
          ],
        ),
        children: [
          ContentArea(
            builder: (context, _) {
              return MacosTabView(
                showTabs: false,
                controller: _tabsController.controller,
                padding: EdgeInsets.zero,
                tabs: _tabItems,
                children: _tabItems.map(
                  (tabItem) {
                    return Center(
                      child: Text('${tabItem.label} View'),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
