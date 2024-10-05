import 'package:flutter/material.dart';

import '../../widgets/menu/menu.dart';
import '../../widgets/screen_layout_builder.dart';

class RecruitScreen extends StatefulWidget {
  const RecruitScreen({super.key});

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutBuilder(myBuilder: (
        screenModel,
        web,
        tablet,
        mobile,
        ) {
      return Scaffold(
        body: Column(
          children: [
            Menu(
              currentIndex: 2,
              screenModel: screenModel,
            ),
          ],
        ),
      );
    });
  }
}
