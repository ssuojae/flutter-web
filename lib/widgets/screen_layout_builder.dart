import 'package:flutter/material.dart';
import '../model/screen_model.dart';

final class ScreenLayoutBuilder extends StatelessWidget {
  const ScreenLayoutBuilder({required this.myBuilder, super.key});

  final _MyBuilder myBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenModel = _ScreenSizeConfig.getScreenModel(constraints);

        return myBuilder(
          screenModel,
          screenModel.web,
          screenModel.tablet,
          screenModel.mobile,
        );
      },
    );
  }
}

typedef _MyBuilder = Widget Function(
  ScreenModel screenModel,
  bool web,
  bool tablet,
  bool mobile,
);

final class _ScreenSizeConfig {
  static const double tabletWidth = 1024;
  static const double mobileWidth = 768;

  static ScreenModel getScreenModel(BoxConstraints constraints) {
    final maxWidth = constraints.maxWidth;

    return maxWidth <= mobileWidth
        ? ScreenModel(false, false, true)
        : maxWidth <= tabletWidth
            ? ScreenModel(false, true, false)
            : ScreenModel(true, false, false);
  }
}
