import 'package:flutter/material.dart';
import 'package:portfolio/util/asset_path.dart';
import 'package:portfolio/widgets/header.dart';

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
            Header(
              title: '온라인 문의',
              subTitle: '프로젝트 및 서비스 문의를 남겨주세요',
              backgroundImage: AssetPath.questionHeaderImage,
              screenModel: screenModel,
            )
          ],
        ),
      );
    });
  }
}
