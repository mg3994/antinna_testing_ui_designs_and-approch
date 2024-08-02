// import 'flavors.dart';

// FlavorConfig config = FlavorConfig(
//   flavor: Flavor.stage,
//   values: FlavorValues(baseUrl: 'https://stag.example.com'),
// );

import 'flavors.dart';

class StageConfig implements FlavorConfig {
  @override
  final flavor = Flavor.stage;

  @override
  final baseUrl = Uri.parse('https://stage.example.com');
}
