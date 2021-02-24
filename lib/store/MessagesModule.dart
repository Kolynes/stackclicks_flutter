import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/models/MessageModel.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin MessagesModule on PropertyChangeNotifier<ModuleProperties> {
  MessageModel message;

  setMessageInfo(Map<String, dynamic> data) {
    message = MessageModel(
      message: data["message"],
      createdOn: data["createdOn"]
    );
    notifyListeners(ModuleProperties.messages);
  }

  Future<JsonResponse> getMessage() async {
    var response = await http.get("/messages/get/");
    if(response.status == 200)
      setMessageInfo(response.data);
    return response;
  }
}