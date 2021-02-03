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
    var requestHeaders = Map<String, dynamic>();
    global.headers.forEach((key, value) async =>  
      requestHeaders[key] = value.runtimeType == HeaderFunction
        ?await value()
        :value
    );
    var bodyEncoding = contentType == "application/json"
      ?RequestBodyEncoding.JSON
      :RequestBodyEncoding.FormURLEncoded;
    var response =await Requests.post(
      global.base + url, 
      bodyEncoding: bodyEncoding,
      headers: requestHeaders, 
      body: body, 
      timeoutSeconds: timeout
    );
    var jsonResponse = response.json();
    return JsonResponse()
    ..status = response.statusCode
    ..data = jsonResponse["data"]
    ..errors = jsonResponse["error"]
    ..numberOfPages = jsonResponse["number_of_pages"]
    ..nextPage = jsonResponse["next_page"]
    ..prevPage = jsonResponse["previous_page"]
    ..hasNextPage = (jsonResponse["next_page"] ?? 0) < (jsonResponse["number_of_pages"] ?? 0);
  }

  Future<JsonResponse> get(String url, {Map<String, dynamic> queryParameters: const {}, int timeout: 15000}) async {
    var requestHeaders = Map<String, dynamic>();
    global.headers.forEach((key, value) async =>  
      requestHeaders[key] = value.runtimeType == HeaderFunction
        ?await value()
        :value
    );
    var response = await Requests.get(
      global.base + url, 
      queryParameters: queryParameters, 
      headers: requestHeaders, 
      timeoutSeconds: timeout
    );
    var jsonResponse = response.json();
    return JsonResponse()
    ..status = response.statusCode
    ..data = jsonResponse["data"]
    ..errors = jsonResponse["error"]
    ..numberOfPages = jsonResponse["number_of_pages"]
    ..nextPage = jsonResponse["next_page"]
    ..prevPage = jsonResponse["previous_page"]
    ..hasNextPage = (jsonResponse["next_page"] ?? 0) < (jsonResponse["number_of_pages"] ?? 0);
  }

}

class JsonResponse {
  int status;
  dynamic data;
  Map<String, dynamic> errors;
  int numberOfPages, nextPage, prevPage;
  bool hasNextPage;
}