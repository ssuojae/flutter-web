import 'package:flutter/material.dart';
import 'package:portfolio/widgets/menu/menu.dart';
import 'package:portfolio/widgets/screen_layout_builder.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
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
              currentIndex: 0,
              screenModel: screenModel,
            ),
          ],
        ),
      );
    });
  }
}
