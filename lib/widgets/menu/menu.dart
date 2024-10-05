import 'package:flutter/material.dart';
import 'package:portfolio/util/asset_path.dart';
import 'package:portfolio/util/menu_util.dart';
import 'package:portfolio/util/my_color.dart';
import 'package:portfolio/util/text_util.dart';
import 'package:portfolio/widgets/custom_text_button.dart';

final class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
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
              textStyle: TextUtil.get16(context, MyColor.gray90),
              size: Size(100, 40),
              onPressed: () {},
            );
          }),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
