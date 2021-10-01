import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Customer {
  final String fullName;
  final int age;

  Customer(this.fullName, this.age);
}

abstract class ServiceOne {
  Customer makeCustomer();
}

abstract class ServiceTwo {
  Customer findCustomer();
}

class ServiceTwoAdapter implements ServiceOne {
  final ServiceTwo two;

  ServiceTwoAdapter(this.two);

  @override
  Customer makeCustomer() {
    return two.findCustomer();
  }
}

class MockServiceTwo extends Mock implements ServiceTwo {}

main() {
  late ServiceTwoAdapter sut;
  late MockServiceTwo mockService;

  final mockCustomer = Customer('fullName', 25);

  setUp(() {
    mockService = MockServiceTwo();
    when(() => mockService.findCustomer()).thenReturn(mockCustomer);
    sut = ServiceTwoAdapter(mockService);
  });
  test('should call findCustomer', () {
    sut.makeCustomer();
    verify(() => mockService.findCustomer()).called(1);
  });
  test('should return correct customer', () {
    final result = sut.makeCustomer();
    expect(result, mockCustomer);
  });
}
