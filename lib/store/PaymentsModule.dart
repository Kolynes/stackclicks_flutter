
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/PaymentModel.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin PaymentsModule on PropertyChangeNotifier<ModuleProperties> {
  List<PaymentModel> payments;
  PaymentModel activePayment;

  setPayments(List<dynamic> data) {
    payments = List.generate(data.length, (index) => PaymentModel(
      id: data[index]["id"],
      packagePrice: data[index]["packagePrice"],
      package: data[index]["package"],
      createdOn: data[index]["createdOn"],
      isActive: data[index]["isActive"]
    ));
    notifyListeners(ModuleProperties.payments);
  }

  addPayments(List<dynamic> data) {
    payments.addAll(List.generate(data.length, (index) => PaymentModel(
      id: data[index]["id"],
      packagePrice: data[index]["packagePrice"],
      package: data[index]["package"],
      createdOn: data[index]["createdOn"],
      isActive: data[index]["isActive"],
    )));
    notifyListeners(ModuleProperties.payments);
  }

  setActivePayment(Map<String, dynamic> data) {
    activePayment = PaymentModel(
      id: data["id"],
      packagePrice: data["packagePrice"],
      package: data["package"],
      createdOn: data["createdOn"],
      isActive: data["isActive"],
    );
    notifyListeners(ModuleProperties.payments);
  }

  clearPayments() {
    payments = null;
    activePayment = null;
    notifyListeners(ModuleProperties.payments);
  }

  Future<JsonResponse> getPayments({int page: 1}) async {
    var response = await http.get("/payments/get/", queryParameters: {
      "page": page
    });
    if(response.status == 200) {
      if(page == 1)
        setPayments(response.data);
      else addPayments(response.data);
    }
    return response;
  }

  Future<JsonResponse> pay(String coupon) async {
    var response = await http.post("/payments/pay/", {
      "coupon": coupon,
    });
    if(response.status == 201) {
      getPayments();
      getActivePayment();
    }
    return response;
  }

  Future<JsonResponse> getActivePayment() async {
    var response = await http.get("/payments/get_active/");
    if(response.status == 200)
      setActivePayment(response.data);
    return response;
  }
  
}