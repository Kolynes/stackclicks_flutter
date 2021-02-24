import "../utils/models.dart";

class UserModel extends Model {
  int id = -1;
  String firstName = "";
  String lastName = "";
  String email = "";
  String referralCode = "";
  int referralCount = 0;
  String bankName = "";
  String accountNumber = "";
  String accountName = "";
  double balance = 0;
  double referralBalance = 0;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.referralCode,
    this.referralCount,
    this.bankName,
    this.accountName,
    this.accountNumber,
    this.balance,
    this.referralBalance
  });

  get primaryKey => id;
  get primaryKeyName => "id";
  get fullname => "$firstName $lastName";

  toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "id": id,
    "referralCode": referralCode,
    "referralCount": referralCount,
    "bankName": bankName,
    "accountName": accountName,
    "accountNumber": accountNumber,
    "balance": balance,
    "referralBalance": referralBalance
  };

  static final manager = UserModelManager();
}

class UserModelManager extends ModelManager {
  UserModelManager(): super("User");

  fromMap(Map<String, dynamic> map) => UserModel(
    firstName: map["firstName"],
    lastName: map["lastName"],
    email: map["email"],
    id: map["id"],
    referralCode: map["referralCode"],
    referralCount: map["referralCount"],
    bankName: map["bankName"],
    accountName: map["accountName"],
    accountNumber: map["accountNumber"],
    balance: map["balance"],
    referralBalance: map["referralBalance"],
  );
}