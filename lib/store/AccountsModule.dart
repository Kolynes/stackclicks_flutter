import "package:property_change_notifier/property_change_notifier.dart";
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';
import "../plugins/http.dart";

mixin AccountsModule on PropertyChangeNotifier<ModuleProperties> {
  String firstName;
  String lastName;
  String email;
  String referralCode;
  int referralCount;
  int id;
  String bankName;
  String accountNumber;
  String accountName;
  bool signedIn;

  setAccountsInfo(Map<String, dynamic> payload) {
    firstName = payload["firstName"] ?? firstName;
    lastName = payload["lastName"] ?? lastName;
    email = payload["email"] ?? email;
    referralCode = payload["referralCode"] ?? referralCode;
    referralCount = payload["referralCount"] ?? referralCount;
    id = payload["id"] ?? id;
    bankName = payload["bankName"] ?? bankName;
    accountName = payload["accountName"] ?? accountName;
    accountNumber = payload["accountNumber"] ?? accountNumber;
    notifyListeners(ModuleProperties.accounts);
  }

  clearAccountsInfo() {
    firstName = null;
    lastName = null;
    email = null;
    referralCode = null;
    referralCount = null;
    id = null;
    bankName = null;
    accountName = null;
    accountNumber = null;
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

  Future<JsonResponse> changeBankDetails(String accountNumber, String accountName, String bankName) async {
    var response = await http.post("/accounts/change_bank_details/", {
      "bank_name": bankName,
      "account_name": accountName,
      "account_number": accountNumber
    });
    if(response.status == 200)
      setAccountsInfo({
        "bankName": bankName,
        "accountName": accountName,
        "accountNumber": accountNumber
      });
    return response;
  }


}