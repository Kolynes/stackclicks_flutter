import "package:property_change_notifier/property_change_notifier.dart";
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';
import "../plugins/http.dart";

mixin AccountsModule on PropertyChangeNotifier<ModuleProperties> {
  String firstName;
  String lastName;
  String email;
  String referralCode;
  bool signedIn;

  setAccountsInfo(Map<String, dynamic> payload) {
    this.firstName = payload["firstName"] ?? this.firstName;
    this.lastName = payload["lastName"] ?? this.lastName;
    this.email = payload["email"] ?? this.email;
    notifyListeners(ModuleProperties.accounts);
  }

  clearAccountsInfo() {
    firstName = null;
    lastName = null;
    email = null;
    referralCode = null;
    signedIn = false;
    notifyListeners(ModuleProperties.accounts);
  }

  Future<bool> ping() async {
    var response = await http.get("/accounts/ping/");
    if(response.status == 200)
      setAccountsInfo(response.data);
    return response.status == 200;
  }

  Future<JsonResponse> signIn(String email, String password) async {
    var response = await http.post("/accounts/sign_in/", {
      "email": email,
      "password": password
    });
    if(response.status == 200) 
      ping();
    return response;
  }

  Future<JsonResponse> signUp(String email, String firstName, String lastName, String password, {String referralCode: ""}) async {
    var response = await http.post("/accounts/sign_up/?r=$referralCode", {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password
    });
    if(response.status == 200)
      ping();
    return response;
  }

  Future<JsonResponse> signOut() async {
    var response = await http.get("/accounts/sign_out/");
    clearAccountsInfo();
    return response;
  }

  Future<bool> authenticate(String password) async {
    var response = await http.post("/accounts/authenticate/", {
      "password": password
    });
    return response.status == 200;
  }

  Future<JsonResponse> changePassword(String newPassword, String oldPassword) async {
    return await http.post("/accounts/change_password/", {
      "new_password": newPassword,
      "old_passsword": oldPassword
    });
  }

  Future<JsonResponse> resetPassword(String username, String code, String newPassword) async {
    return await http.post("/accounts/reset_password/", {
      "username": username,
      "code": code,
      "new_password": newPassword
    });
  }

  Future<JsonResponse> verifyCode(String username, String code) async {
    return await http.post("/accounts/reset_password/", {
      "username": username,
      "code": code,
    });
  }

  Future<JsonResponse> sendVerificationCode({String username: "", String mode: "resend"}) async {
    return await http.post("/accounts/reset_password/", {
      "username": username,
      "mode": mode,
    });
  }

  Future<JsonResponse> sendVerificationLink({String username: "", String mode: "resend"}) async {
    return await http.post("/accounts/reset_password/", {
      "username": username,
      "mode": mode,
    });
  }
}