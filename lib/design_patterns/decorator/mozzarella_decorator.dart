import 'package:clean_architecture_example/design_patterns/decorator/pizza.dart';

class MozzarellaDecorator implements Pizza {
  final Pizza pizza;

  MozzarellaDecorator(this.pizza);

  @override
  String get description => pizza.description + '\n Mozzarella';

  @override
  double price() => pizza.price() + 0.5;
}
