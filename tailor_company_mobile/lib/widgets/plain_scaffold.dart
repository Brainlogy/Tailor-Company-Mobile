import 'package:flutter/material.dart';

class PlainScaffold extends StatelessWidget {
  final Widget body;
  final Widget? actionButton;
  const PlainScaffold({required this.body, this.actionButton, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      // primary: true,
      body: body,
      floatingActionButton: actionButton,
    );
  }
}
