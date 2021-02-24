import 'package:requests/requests.dart';

typedef Future<String> HeaderFunction();

class Settings {
  final Map<String, dynamic> headers;
  final String base;

  Settings(this.headers, this.base);
}

class Http {
  final Settings global;

  Http(this.global);

  Future<JsonResponse> post(String url, dynamic body, {String contentType: "", int timeout: 15000}) async {
    var requestHeaders = Map<String, String>();
    for(var entry in global.headers.entries)
      requestHeaders[entry.key] = entry.value.runtimeType == HeaderFunction
        ?await entry.value()
        :entry.value;
    var bodyEncoding = contentType == "application/json"
      ?RequestBodyEncoding.JSON
      :RequestBodyEncoding.FormURLEncoded;
    try {
      var response = await Requests.post(
        global.base + url, 
        bodyEncoding: bodyEncoding,
        headers: requestHeaders, 
        body: body, 
        timeoutSeconds: timeout
      );
      await Requests.setStoredCookies(response.url.host, Requests.extractResponseCookies(response.headers));
      var jsonResponse = response.json();
      return JsonResponse()
      ..status = response.statusCode
      ..data = jsonResponse["data"]
      ..errors = jsonResponse["error"]
      ..numberOfPages = jsonResponse["number_of_pages"]
      ..nextPage = jsonResponse["next_page"]
      ..prevPage = jsonResponse["previous_page"]
      ..hasNextPage = (jsonResponse["next_page"] ?? 0) < (jsonResponse["number_of_pages"] ?? 0);
    } catch(error) {
      return JsonResponse()
      ..status = 500
      ..errors = {"summary": "Connection to server refused. Please retry", "fields": []};
    }
  }

  Future<JsonResponse> get(String url, {Map<String, dynamic> queryParameters: const {}, int timeout: 15000}) async {
    var requestHeaders = Map<String, String>();
    for(var entry in global.headers.entries)
      requestHeaders[entry.key] = entry.value.runtimeType == HeaderFunction
        ?await entry.value()
        :entry.value;
    try {
      var response = await Requests.get(
        global.base + url, 
        queryParameters: queryParameters, 
        headers: requestHeaders, 
        timeoutSeconds: timeout
      );
      await Requests.setStoredCookies(response.url.host, Requests.extractResponseCookies(response.headers));
      var jsonResponse = response.json();
      return JsonResponse()
      ..status = response.statusCode
      ..data = jsonResponse["data"]
      ..errors = jsonResponse["error"]
      ..numberOfPages = jsonResponse["number_of_pages"]
      ..nextPage = jsonResponse["next_page"]
      ..prevPage = jsonResponse["previous_page"]
      ..hasNextPage = (jsonResponse["next_page"] ?? 0) < (jsonResponse["number_of_pages"] ?? 0);
    } catch(error) {
      return JsonResponse()
      ..status = 500
      ..errors = {"summary": "Connection to server refused. Please retry", "fields": []};
    }
  }

}

class JsonResponse {
  int status;
  dynamic data;
  Map<String, dynamic> errors;
  int numberOfPages, nextPage, prevPage;
  bool hasNextPage;
}