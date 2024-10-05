import 'package:flutter/material.dart';
import 'package:portfolio/util/asset_path.dart';
import 'package:portfolio/util/menu_util.dart';
import 'package:portfolio/util/my_color.dart';
import 'package:portfolio/util/text_util.dart';
import 'package:portfolio/widgets/custom_text_button.dart';
import 'package:portfolio/widgets/menu/menu_tablet_and_mobile.dart';

import '../../model/screen_model.dart';

final class Menu extends StatelessWidget {
  final int currentIndex;
  final ScreenModel screenModel;

  const Menu({super.key, required this.currentIndex, required this.screenModel});

  @override
  Widget build(BuildContext context) {
    final boldTextStyle = TextUtil.get16(context, MyColor.gray90).copyWith(fontWeight: FontWeight.bold);
    final normalTextStyle = TextUtil.get16(context, MyColor.gray90);
    if (screenModel.tablet || screenModel.mobile) {
      return MenuTabletAndMobile(currentIndex: currentIndex, tablet: screenModel.tablet);
    }
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              MenuUtil.changeIndex(context, 0);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Image.asset(
              AssetPath.menuLogoBlack,
              width: 180,
              height: 60,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Spacer(),
          ...List.generate(MenuUtil.menuList.length, (index) {
            return CustomTextButton(
              label: MenuUtil.menuList[index],
              textStyle: currentIndex == index ? boldTextStyle : normalTextStyle,
              size: const Size(100, 40),
              onPressed: () {
                print('CustomTextButton pressed: index $index');
                MenuUtil.changeIndex(context, index);
              },
            );
          }),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
