import 'package:stackclicks_flutter/utils/Enum.dart';

class ModuleProperties extends Enum<String> {
  ModuleProperties(String property): super(property);

  static final accounts = ModuleProperties("accounts");
  static final payments = ModuleProperties("payments");
  static final tasks = ModuleProperties("tasks");
  static final vendors = ModuleProperties("vendors");
}