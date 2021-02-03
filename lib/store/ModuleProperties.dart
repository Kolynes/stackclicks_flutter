import 'package:stackclicks_flutter/utils/Enum.dart';

class ModuleProperties extends Enum<String> {
  ModuleProperties(String property): super(property);

  static final accounts = ModuleProperties("accounts");
}