import 'package:flutter/material.dart';

class PlainScaffold extends StatelessWidget {
  final Widget body;
  final Widget? actionButton;
  final Color? backgroundColor;
  const PlainScaffold({
    required this.body,
    this.actionButton,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      // primary: true,
      body: body,
      floatingActionButton: actionButton,
    );
  }
}
