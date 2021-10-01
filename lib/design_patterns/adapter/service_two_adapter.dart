import 'contracts/service_one.dart';
import 'contracts/service_two.dart';
import 'customer.dart';

class ServiceTwoAdapter implements ServiceOne {
  final ServiceTwo two;

  ServiceTwoAdapter(this.two);

  @override
  Customer makeCustomer() {
    return two.findCustomer();
  }
}
