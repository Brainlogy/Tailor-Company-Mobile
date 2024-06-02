import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/widgets/custom_nav_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? actionButton;
  const CustomScaffold({
    required this.body,
    this.actionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButton: actionButton,
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
