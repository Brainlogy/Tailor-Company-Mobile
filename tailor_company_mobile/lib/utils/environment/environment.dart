import 'package:tailor_company_mobile/utils/environment/base_config.dart';

class Environment {

  factory Environment() {
    return _singleton;
  }

  //Private constructor used for initializing the singleton instanmce
  Environment._internal();

  //Static singleton instance of the environment class
  static final Environment _singleton = Environment._internal();

  //Static constants representing each environment names
  static const String DEV = "DEV";
  static const String LOCAl = "LOCAL";
  static const String STAGING = "STAGING";
  static const String PROD = "PROD";

  //Variable to store the selected configurations
  late BaseConfig config;

  // initializes the configurations based on the selected environment
  initConfig(String environment) {
    config = _getConfig(environment);
  }
  

  //Private method to select the appropriate configuration based on the provided environment
  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.LOCAl:
        return LocalConfig();
      case Environment.DEV:
        return DevConfig();
      case Environment.STAGING:
        return StagingConfig();
      case Environment.PROD:
        return ProdConfig();

      default:
        return LocalConfig();
    }
  }

}
