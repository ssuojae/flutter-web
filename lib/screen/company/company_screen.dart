import 'package:flutter/material.dart';
import 'package:portfolio/widgets/menu/menu.dart';

final class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu(),
        ],
      ),
    );
  }
}
