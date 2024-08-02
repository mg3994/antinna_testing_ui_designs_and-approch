// import 'flavors.dart';

// FlavorConfig config = FlavorConfig(
//   flavor: Flavor.prod,
//   values: FlavorValues(baseUrl: 'https://prod.example.com'),
// );

import 'flavors.dart';

// final config = ProdConfig();

class ProdConfig implements FlavorConfig {
  @override
  final flavor = Flavor.prod;

  @override
  final baseUrl = Uri.parse('https://prod.example.com');
}
