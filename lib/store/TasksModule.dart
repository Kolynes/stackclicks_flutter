import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

mixin TasksModule on PropertyChangeNotifier<ModuleProperties> {
  String url;
  String title;
  String body;
  bool completed;
  int id;

  setTaskInfo(Map<String, dynamic> data) {
    url = data["url"] ?? url;
    title = data["title"] ?? title;
    body = data["body"] ?? body;
    completed = data["completed"] ?? completed;
    id = data["id"] ?? id;
    notifyListeners(ModuleProperties.tasks);
  }

  clearTaskInfo() {
    url = null;
    title = null;
    body = null;
    completed = null;
    id = null;
    notifyListeners(ModuleProperties.tasks);
  }

  Future<JsonResponse> getTask() async {
    var response = await http.get("/tasks/get/");
    if(response.status == 200)
      setTaskInfo(response.data);
    return response;
  }

  Future<JsonResponse> completeTask() async {
    if(id != null) {
      var response = await http.post("/tasks/complete/", {
        "id": id
      });
      if(response.status == 200)
        setTaskInfo({
          "completed": true
        });
      return response;
    }
    return JsonResponse()
    ..status = 404
    ..errors = {
      "summary": "No tasks found"
    };
  }
}