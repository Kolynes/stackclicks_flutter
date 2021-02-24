import "package:property_change_notifier/property_change_notifier.dart";
import 'package:stackclicks_flutter/models/UserModel.dart';
import 'package:stackclicks_flutter/store/ModuleProperties.dart';
import 'package:stackclicks_flutter/utils/Http.dart';
import "../plugins/http.dart";

mixin AccountsModule on PropertyChangeNotifier<ModuleProperties> {
  UserModel user;

  setAccountsInfo(Map<String, dynamic> payload) {
    user = UserModel(
      firstName: payload["firstName"],
      lastName: payload["lastName"],
      email: payload["email"],
      referralCode: payload["referralCode"],
      referralCount: payload["referralCount"],
      id: payload["id"],
      bankName: payload["bankName"],
      accountName: payload["accountName"],
      accountNumber: payload["accountNumber"],
      balance: payload["balance"],
      referralBalance: payload["referralBalance"],
    );
    UserModel.manager.save(user);
    notifyListeners(ModuleProperties.accounts);
  }

  clearAccountsInfo() {
    if(user != null)
      UserModel.manager.delete(user);
    user = null;
    notifyListeners(ModuleProperties.accounts);
  }

  Future<void> accountsModuleInit() async {
    var users = await UserModel.manager.all();
    if(users.length > 0)
      user = users[0];
  }

  Future<JsonResponse> ping() async {
    var response = await http.get("/accounts/ping/");
    if(response.status == 200)
      setAccountsInfo(response.data);
    else if(response.status != 500){
      clearAccountsInfo();
      signOut();
    } 
    return response;
  }

  Future<JsonResponse> signIn(String email, String password) async {
    var response = await http.post("/accounts/sign_in/?r=true", {
      "email": email,
      "password": password,
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
      "old_password": oldPassword
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
    return await http.post("/accounts/verify_code/", {
      "username": username,
      "code": code,
    });
  }

  Future<JsonResponse> sendVerificationCode({String username: "", String mode: "resend"}) async {
    return await http.post("/accounts/send_verification_code/", {
      "username": username,
      "mode": mode,
    });
  }

  Future<JsonResponse> sendVerificationLink({String username: "", String mode: "resend"}) async {
    return await http.post("/accounts/send_verification_link/", {
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