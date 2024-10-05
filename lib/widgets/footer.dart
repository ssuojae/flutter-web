import 'package:flutter/material.dart';

import '../util/menu_util.dart';
import '../util/my_color.dart';
import '../util/text_util.dart';
import 'custom_text_button.dart';

final class Footer extends StatelessWidget {
  const Footer({super.key});

  static const double _footerHeight = 250;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: _footerHeight,
      child: _buildFooterContent(context, width),
    );
  }

  Widget _buildFooterContent(
    BuildContext context,
    double width,
  ) {
    return OverflowBox(
      maxWidth: width,
      maxHeight: _footerHeight,
      child: Container(
        width: width,
        height: _footerHeight,
        color: MyColor.gray10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildMenuButtons(context),
        ),
      ),
    );
  }

  List<Widget> _buildMenuButtons(BuildContext context) {
    return List.generate(
      MenuUtil.menuList.length,
      (index) => CustomTextButton(
        label: MenuUtil.menuList[index],
        textStyle: TextUtil.get15(context, MyColor.gray80),
        size: const Size(110, 36),
        onPressed: () => MenuUtil.changeIndex(context, index),
      ),
    );
  }
}
