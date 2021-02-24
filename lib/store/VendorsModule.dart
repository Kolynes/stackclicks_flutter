import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/VendorModel.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin VendorsModule on PropertyChangeNotifier<ModuleProperties> {
  List<VendorModel> vendors;

  setVendors(List<dynamic> data) {
    vendors = List.generate(data.length, (index) => VendorModel(
      name: data[index]["name"],
      whatsappLink: data[index]["whatsappLink"]
    ));
    notifyListeners(ModuleProperties.vendors);
  }

  addVendors(List<dynamic> data) {
    vendors.addAll(List.generate(data.length, (index) => VendorModel(
      name: data[index]["name"],
      whatsappLink: data[index]["whatsappLink"]
    )));
    notifyListeners(ModuleProperties.vendors);
  }

  clearvendors() {
    vendors = null;
    notifyListeners(ModuleProperties.vendors);
  }

  Future<JsonResponse> getVendors({int page: 1}) async {
    var response = await http.get("/vendors/get/", queryParameters: {
      "page": page
    });
    if(response.status == 200) {
      if(page == 1)
        setVendors(response.data);
      else addVendors(response.data);
    }
    return response;
  }
}