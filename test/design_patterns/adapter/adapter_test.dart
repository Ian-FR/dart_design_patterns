import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:clean_architecture_example/design_patterns/adapter/contracts/service_two.dart';
import 'package:clean_architecture_example/design_patterns/adapter/customer.dart';
import 'package:clean_architecture_example/design_patterns/adapter/service_two_adapter.dart';

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
