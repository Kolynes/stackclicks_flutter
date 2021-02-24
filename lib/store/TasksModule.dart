import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:stackclicks_flutter/plugins/http.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';
import 'package:stackclicks_flutter/models/TaskModel.dart';

mixin TasksModule on PropertyChangeNotifier<ModuleProperties> {
  TaskModel task;

  setTaskInfo(Map<String, dynamic> data) {
    task = TaskModel(
      url: data["url"],
      title: data["title"],
      body: data["body"],
      completed: data["completed"],
      id: data["id"],
    );
    notifyListeners(ModuleProperties.tasks);
  }

  clearTaskInfo() {
    task = null;
    notifyListeners(ModuleProperties.tasks);
  }

  Future<JsonResponse> getTask() async {
    var response = await http.get("/tasks/get/");
    if(response.status == 200)
      setTaskInfo(response.data);
    return response;
  }

  Future<JsonResponse> completeTask() async {
    if(task != null) {
      var response = await http.post("/tasks/complete/", {
        "id": task.id
      });
      if(response.status == 200) {
        setTaskInfo({
          "url": task.url,
          "title": task.title,
          "body": task.body,
          "id": task.id,
          "completed": true
        });
      }
      return response;
    }
    return JsonResponse()
    ..status = 404
    ..errors = {
      "summary": "No tasks found"
    };
  }
}