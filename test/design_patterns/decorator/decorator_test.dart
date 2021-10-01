import 'package:flutter_test/flutter_test.dart';

import 'package:dart_design_patterns/design_patterns/decorator/decorator.dart';

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
