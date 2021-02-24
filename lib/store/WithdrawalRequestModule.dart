import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/WithdrawalRequestModel.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin WithdrawalRequestModule on PropertyChangeNotifier<ModuleProperties> {
  List<WithdrawalRequestModel> withdrawalRequests;

  setWithdrawalRequests(List<dynamic> data) {
    withdrawalRequests = List.generate(data.length, (index) => WithdrawalRequestModel(
      id: data[index]["id"],
      type: data[index]["type"],
      amount: data[index]["amount"],
      createdOn: (data[index]["createdOn"] as double).toInt(),
      status: data[index]["status"]
    ));
    notifyListeners(ModuleProperties.withdrawalRequests);
  }

  addWithdrawalRequests(List<dynamic> data) {
    withdrawalRequests.addAll(List.generate(data.length, (index) => WithdrawalRequestModel(
      id: data[index]["id"],
      type: data[index]["type"],
      amount: data[index]["amount"],
      createdOn: data[index]["createdOn"],
      status: data[index]["status"]
    )));
    notifyListeners(ModuleProperties.withdrawalRequests);
  }

  clearWithdrawalRequests() {
    withdrawalRequests = null;
    notifyListeners(ModuleProperties.withdrawalRequests);
  }

  Future<JsonResponse> getWithdrawalRequests({int page: 1}) async {
    var response = await http.get("/withdrawal_requests/get/", queryParameters: {
      "page": page
    });
    if(response.status == 200) {
      if(page == 1)
        setWithdrawalRequests(response.data);
      else addWithdrawalRequests(response.data);
    }
    return response;
  }

  Future<JsonResponse> requestWithdrawal(String amount, String type) async {
    var response = await http.post("/withdrawal_requests/request_withdrawal/", {
      "amount": amount,
      "type": type[0]
    });
    if(response.status == 201)
      getWithdrawalRequests();
    return response;
  }
}