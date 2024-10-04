import 'package:flutter/material.dart';
import 'package:portfolio/util/asset_path.dart';
import 'package:portfolio/util/menu_util.dart';

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
            return Text(MenuUtil.menuList[index]);
          }),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
