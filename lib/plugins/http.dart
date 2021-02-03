import 'package:requests/requests.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

final hostname =  "http://127.0.0.1:8000";

final http = Http(
  Settings({
    "X-CSRFToken": () async => (await Requests.getStoredCookies(hostname))["csrftoken"]
  }, hostname)
);