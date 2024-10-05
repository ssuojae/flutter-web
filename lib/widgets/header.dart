import 'package:flutter/material.dart';

import '../model/screen_model.dart';
import '../util/text_util.dart';

final class Header extends StatelessWidget {
  const Header({
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    this.titleColor = Colors.white,
    this.subTitleColor = Colors.white,
    required this.screenModel,
    super.key,
  });

  final String title;
  final String subTitle;
  final String backgroundImage;
  final Color titleColor;
  final Color subTitleColor;
  final ScreenModel screenModel;

  @override
  Widget build(BuildContext context) {
    final height = _getHeight();
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: OverflowBox(
        maxHeight: height,
        maxWidth: width,
        child: Container(
          width: width,
          height: height,
          decoration: _buildBackgroundDecoration(),
          child: Column(
            children: [
              SizedBox(height: _getTopPadding()),
              if (title.isNotEmpty) _buildTitle(context),
              if (subTitle.isNotEmpty) _buildSubTitle(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration? _buildBackgroundDecoration() {
    if (backgroundImage.isEmpty) return null;
    return BoxDecoration(
      image: DecorationImage(
        image: Image.asset(backgroundImage).image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: TextUtil.get20(context, titleColor).copyWith(
        fontWeight: _getTitleFontWeight(),
        fontSize: _getTitleFontSize(),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        subTitle,
        style: TextUtil.get20(context, subTitleColor).copyWith(
          fontWeight: _getSubTitleFontWeight(),
          fontSize: _getSubTitleFontSize(),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  double _getHeight() {
    switch (screenModel) {
      case ScreenModel(web: true, tablet: false, mobile: false):
        return 408;
      case ScreenModel(web: false, tablet: true, mobile: false):
        return 248;
      default:
        return 206;
    }
  }

  double _getTopPadding() {
    switch (screenModel) {
      case ScreenModel(web: true, tablet: false, mobile: false):
        return 170;
      case ScreenModel(web: false, tablet: true, mobile: false):
        return 100;
      default:
        return 75;
    }
  }

  FontWeight _getTitleFontWeight() {
    switch (screenModel) {
      case ScreenModel(web: true, tablet: false, mobile: false):
        return FontWeight.bold;
      case ScreenModel(web: false, tablet: true, mobile: false):
        return FontWeight.w600;
      default:
        return FontWeight.w500;
    }
  }

  double _getTitleFontSize() {
    switch (screenModel) {
      case ScreenModel(web: true, tablet: false, mobile: false):
        return 32;
      case ScreenModel(web: false, tablet: true, mobile: false):
        return 24;
      default:
        return 20;
    }
  }

  FontWeight _getSubTitleFontWeight() {
    switch (screenModel) {
      case ScreenModel(web: true, tablet: false, mobile: false):
        return FontWeight.w600;
      case ScreenModel(web: false, tablet: true, mobile: false):
        return FontWeight.w500;
      default:
        return FontWeight.w400;
    }
  }

  double _getSubTitleFontSize() {
    switch (screenModel) {
      case ScreenModel(web: true, tablet: false, mobile: false):
        return 18;
      case ScreenModel(web: false, tablet: true, mobile: false):
        return 15;
      default:
        return 13;
    }
  }
}
