// enum Flavor { dev, stage, prod }

// class FlavorValues {
//   final String baseUrl;
//   FlavorValues({required this.baseUrl});
// }

// class FlavorConfig {
//   final Flavor flavor;
//   final FlavorValues values;

//   static FlavorConfig? _instance;

//   factory FlavorConfig({
//     required Flavor flavor,
//     required FlavorValues values,
//   }) {
//     _instance ??= FlavorConfig._internal(flavor, values);
//     return _instance!;
//   }

//   FlavorConfig._internal(this.flavor, this.values);

//   static FlavorConfig get instance => _instance!;

//   static bool isDev() => _instance!.flavor == Flavor.dev;
//   static bool isStage() => _instance!.flavor == Flavor.stage;
//   static bool isProd() => _instance!.flavor == Flavor.prod;
// }

import 'config_dev.dart';
import 'config_prod.dart';
import 'config_stage.dart';

enum Flavor { dev, stage, prod }

abstract class FlavorConfig {
  Flavor get flavor;
  Uri get baseUrl;

  factory FlavorConfig(String? appFlavor) {
    switch (appFlavor) {
      case "dev":
        return DevConfig();
      case "stage":
        return StageConfig();
      case "prod":
      default:
        return ProdConfig();
    }
  }
}
