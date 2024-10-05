import 'package:flutter/material.dart';

import '../../widgets/menu/menu.dart';

final class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu(currentIndex: 1),
        ],
      ),
    );
  }
}
