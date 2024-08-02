import 'package:antinna/packages/flavor_macro/lib/flavor_macro_base.dart';

void main(List<String> args) {
  MainClass().get();
}

@FlavorMaco()
class MainClass {
  get() {
    config;
    print(appFlavor);

    return appFlavor;
  }
}
