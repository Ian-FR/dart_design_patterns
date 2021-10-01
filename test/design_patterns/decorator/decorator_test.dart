import 'package:clean_architecture_example/design_patterns/decorator/mozzarella_decorator.dart';
import 'package:clean_architecture_example/design_patterns/decorator/oregano_decorator.dart';
import 'package:clean_architecture_example/design_patterns/decorator/peperoni_decorator.dart';
import 'package:clean_architecture_example/design_patterns/decorator/pizza.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('should return base description', () {
    final sut = Pizza('any_description');
    expect(sut.description, 'any_description');
  });

  test('should return base price', () {
    final sut = Pizza('any');
    expect(sut.price(), 30);
  });

  test('should return all descriptions ', () {
    final sut = OreganoDecorator(MozzarellaDecorator(PeperoniDecorator(Pizza('base'))));
    final sut2 = MozzarellaDecorator(Pizza('base'));
    expect(sut.description, 'base\n Peperoni\n Mozzarella\n Oregano');
    expect(sut2.description, 'base\n Mozzarella');
  });

  test('should return correct total price ', () {
    final sut = OreganoDecorator(MozzarellaDecorator(PeperoniDecorator(Pizza('base'))));
    final sut2 = MozzarellaDecorator(Pizza('base'));
    expect(sut.price(), 31.2);
    expect(sut2.price(), 30.5);
  });
}
