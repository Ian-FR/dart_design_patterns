import 'package:flutter_test/flutter_test.dart';

import 'package:dart_design_patterns/design_patterns/singleton/singleton.dart';

main() {
  test('should always return the same instance', () {
    final one = PersonProvider();
    final two = PersonProvider();

    expect(identical(one, two), true);
  });

  test('should always return the same instance when factory is used', () {
    PersonProvider(Person(name: 'ian'));
    final one = PersonProvider.person;
    final two = PersonProvider.person;

    expect(one.name, 'ian');
    expect(identical(one, two), true);
  });
}
