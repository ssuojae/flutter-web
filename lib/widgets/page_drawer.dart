import 'package:flutter/material.dart';

import '../util/menu_util.dart';
import '../util/my_color.dart';
import '../util/text_util.dart';
import 'custom_text_button.dart';

final class PageDrawer extends StatelessWidget {
  const PageDrawer({
    required this.currentIndex,
    required this.tablet,
    super.key,
  });

  final int currentIndex;
  final bool tablet;
  double _getDrawerWidth() => tablet ? 280 : 230;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: _getDrawerWidth(),
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCloseButton(context),
          _buildMenuList(context),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => Scaffold.of(context).closeEndDrawer(),
        customBorder: const CircleBorder(),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        MenuUtil.menuList.length,
            (index) => _buildMenuItem(context, index),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, int index) {
    var textStyle = currentIndex == index
        ? TextUtil.get16(context, Colors.black).copyWith(fontWeight: FontWeight.bold)
        : TextUtil.get16(context, MyColor.gray40);

    return CustomTextButton(
      label: MenuUtil.menuList[index],
      textStyle: textStyle,
      size: const Size(double.infinity, 50),
      onPressed: () {
        Scaffold.of(context).closeEndDrawer();
        Future.delayed(const Duration(milliseconds: 200), () {
          MenuUtil.changeIndex(context, index);
        });
      },
    );
  }
}
