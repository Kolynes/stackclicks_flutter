
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/PaymentModel.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin PaymentsModule on PropertyChangeNotifier<ModuleProperties> {
  List<PaymentModel> payments;

  setPayments(List<Map<String, dynamic>> data, bool hasNextPage) {
    payments = List.generate(data.length, (index) => PaymentModel(
      id: data[index]["id"],
      packagePrice: data[index]["packagePrice"],
      package: data[index]["package"],
      createdOn: data[index]["createdOn"],
      isActive: data[index]["isActive"]
    ));
    notifyListeners(ModuleProperties.payments);
  }

  addPayments(List<Map<String, dynamic>> data, bool hasNextPage) {
    payments.addAll(List.generate(data.length, (index) => PaymentModel(
      id: data[index]["id"],
      packagePrice: data[index]["packagePrice"],
      package: data[index]["package"],
      createdOn: data[index]["createdOn"],
      isActive: data[index]["isActive"],
    )));
    notifyListeners(ModuleProperties.payments);
  }

  clearPayments() {
    payments = null;
    notifyListeners(ModuleProperties.payments);
  }

  Future<JsonResponse> getPayments(int page) async {
    var response = await http.get("/payments/get/", queryParameters: {
      "page": page
    });
    if(response.status == 200) {
      if(page == 1)
        setPayments(response.data, response.hasNextPage);
      else addPayments(response.data, response.hasNextPage);
    }
    return response;
  }

  Future<JsonResponse> pay(String reference, String package) async {
    var response = await http.post("/payments/pay/", {
      "reference": reference,
      "package": package
    });
  }
}