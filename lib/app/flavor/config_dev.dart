// import 'flavors.dart';

// FlavorConfig config = FlavorConfig(
//   flavor: Flavor.dev,
//   values: FlavorValues(baseUrl: 'https://dev.example.com'),
// );

import 'flavors.dart';

// final config = DevConfig();

class DevConfig implements FlavorConfig {
  @override
  final flavor = Flavor.dev;

  @override
  final baseUrl = Uri.parse('https://dev.example.com');
}
