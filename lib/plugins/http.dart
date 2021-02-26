import 'package:requests/requests.dart';
import 'package:stackclicks_flutter/utils/Http.dart';

final hostname =  "stackclicks.com.ng";
// final hostname =  "192.168.43.70";

final http = Http(
  Settings({
    "X-CSRFToken": () async => (await Requests.getStoredCookies(hostname))["csrftoken"]
  }, "https://$hostname")
);