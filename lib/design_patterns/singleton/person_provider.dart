import 'person.dart';

class PersonProvider {
  late Person _person;

  static final _instance = PersonProvider._();
  static final Person person = PersonProvider()._person;

  PersonProvider._();

  factory PersonProvider([Person? person]) {
    if (person != null) _instance._person = person;
    return _instance;
  }
}
