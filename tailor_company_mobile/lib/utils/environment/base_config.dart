//API Host Url's
const String _localHost = "local";
const String _devHost = "dev";
const String _stagingHost = "stag";
const String _prodHost = "prod";

//Media Url's
const String _localMediaHost = "";
const String _devMediaHost = "";
const String _stagingMediaHost = "";
const String _prodMediaHost = "";

abstract class BaseConfig {
  String get apiHost;
  String get mediaHost;
}

class LocalConfig extends BaseConfig  {
  String get apiHost => _localHost;
  String get mediaHost => _localMediaHost;
}

class DevConfig extends BaseConfig  {
  String get apiHost => _devHost;
  String get mediaHost => _devMediaHost;
}

class StagingConfig extends BaseConfig  {
  String get apiHost => _stagingHost;
  String get mediaHost => _stagingMediaHost;
}

class ProdConfig extends BaseConfig  {
  String get apiHost => _prodHost;
  String get mediaHost => _prodMediaHost;
}