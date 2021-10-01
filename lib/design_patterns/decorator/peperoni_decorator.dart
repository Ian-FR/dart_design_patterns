import 'package:dart_design_patterns/design_patterns/decorator/pizza.dart';

class PeperoniDecorator implements Pizza {
  final Pizza pizza;

  PeperoniDecorator(this.pizza);

  @override
  String get description => pizza.description + '\n Peperoni';

  @override
  double price() => pizza.price() + 0.5;
}
