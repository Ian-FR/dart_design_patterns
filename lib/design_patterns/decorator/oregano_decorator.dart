import 'package:clean_architecture_example/design_patterns/decorator/pizza.dart';

class OreganoDecorator implements Pizza {
  final Pizza pizza;

  OreganoDecorator(this.pizza);

  @override
  String get description => pizza.description + '\n Oregano';

  @override
  double price() => pizza.price() + 0.2;
}
