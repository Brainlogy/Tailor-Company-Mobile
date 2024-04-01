import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/routes.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          return MaterialApp(
            title: "Tailor Company",
            builder: (context, child) {
              if (child != null) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child,
                );
              }
              return Scaffold();
            },
            initialRoute: "home",
            routes: { ...routes },
            debugShowCheckedModeBanner: false,
            navigatorObservers: [],
          );
        });
      },
    );
  }
}
