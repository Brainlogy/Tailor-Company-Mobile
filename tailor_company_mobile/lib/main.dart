import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/firebase_options.dart';
import 'package:tailor_company_mobile/screens/base_screen.dart';
import 'package:tailor_company_mobile/utils/environment/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //setting current environment
  const String environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: Environment.DEV);

  //initializing environment
  Environment().initConfig(environment);

  runApp(const BaseScreen());
}
