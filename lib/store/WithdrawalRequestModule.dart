import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/WithdrawalRequestModel.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';

mixin WithdrawalRequestModule on PropertyChangeNotifier<ModuleProperties> {
  List<WithdrawalRequestModel> withdrawalRequests;

  setWithdrawalRequests(List<Map<String, dynamic>> data) {
    withdrawalRequests = List.generate(data.length, (index) => WithdrawalRequestModel(
      id: data[index]["id"],
      type: data[index]["type"],
      amount: data[index]["amount"],
      createdOn: data[index]["createdOn"],
      status: data[index]["status"]
    ));
  }

  addWithdrawalRequests(List<Map<String, dynamic>> data) {
    withdrawalRequests.addAll(List.generate(data.length, (index) => WithdrawalRequestModel(
      id: data[index]["id"],
      type: data[index]["type"],
      amount: data[index]["amount"],
      createdOn: data[index]["createdOn"],
      status: data[index]["status"]
    )));
  }
}