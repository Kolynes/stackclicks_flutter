import 'package:requests/requests.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

final protocol = "https";
// final protocol = "http";
final hostname =  "stackclicks.com.ng";
// final hostname =  "192.168.43.234";
final port = "";
// final port = ":8000"

final http = Http(
  Settings({
    "X-CSRFToken": () async => (await Requests.getStoredCookies(hostname))["csrftoken"]
  }, "$protocol://$hostname$port")
);