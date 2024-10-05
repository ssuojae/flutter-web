import 'package:flutter/material.dart';

import '../../widgets/menu/menu.dart';
import '../../widgets/page_drawer.dart';
import '../../widgets/screen_layout_builder.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(myBuilder: (
        screenModel,
        web,
        tablet,
        mobile,
        ) {
      return Scaffold(
        endDrawer: PageDrawer(currentIndex: 1, tablet: tablet),
        body: Column(
          children: [
            Menu(
              currentIndex: 1,
              screenModel: screenModel,
            ),
          ],
        ),
      );
    });
  }
}
