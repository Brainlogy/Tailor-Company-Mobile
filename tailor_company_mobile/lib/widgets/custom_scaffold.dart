import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/widgets/custom_nav_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? actionButton;
  final bool showAppbar;
  final String? title;
  const CustomScaffold({
    required this.body,
    this.actionButton,
    this.showAppbar = false,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: showAppbar
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: title != null
                  ? Text(
                      title as String,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primary),
                    )
                  : null,
            )
          : null,
      floatingActionButton: actionButton,
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
