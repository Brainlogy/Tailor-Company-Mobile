import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/screens/base_screen.dart';
import 'package:tailor_company_mobile/utils/environment/environment.dart';

void main() {

  //setting current environment
  const String environment =
      String.fromEnvironment('ENVIRONMENT', defaultValue: Environment.DEV);

  //initializing environment
  Environment().initConfig(environment);

  runApp(const BaseScreen());
}
