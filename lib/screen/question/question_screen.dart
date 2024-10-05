import 'package:flutter/material.dart';

import '../../widgets/menu/menu.dart';
import '../../widgets/page_drawer.dart';
import '../../widgets/screen_layout_builder.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(myBuilder: (
        screenModel,
        web,
        tablet,
        mobile,
        ) {
      return Scaffold(
        endDrawer: PageDrawer(currentIndex: 3, tablet: tablet),
        body: Column(
          children: [
            Menu(
              currentIndex: 3,
              screenModel: screenModel,
            ),
          ],
        ),
      );
    });
  }
}
