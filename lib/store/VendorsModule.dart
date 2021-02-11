import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/VendorModel.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin VendorsModule on PropertyChangeNotifier<ModuleProperties> {
  List<VendorModel> vendors;
  int page = 1;

  setVendors(List<Map<String, dynamic>> data) {
    vendors = List.generate(data.length, (index) => VendorModel(
      name: data[index]["name"],
    ));
    notifyListeners(ModuleProperties.vendors);
  }

  addVendors(List<Map<String, dynamic>> data) {
    vendors.addAll(List.generate(data.length, (index) => VendorModel(
      name: data[index]["name"],
    )));
    notifyListeners(ModuleProperties.vendors);
  }

  clearvendors() {
    vendors = null;
    page = 1;
    notifyListeners(ModuleProperties.vendors);
  }

  Future<JsonResponse> getVendors() async {
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