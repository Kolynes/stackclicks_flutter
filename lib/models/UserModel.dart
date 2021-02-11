import "../utils/models.dart";

class UserModel extends Model {
  int id = -1;
  String firstName = "";
  String lastName = "";
  String email = "";

  get primaryKey => id;
  get primaryKeyName => "id";

  toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "id": id
  };

  static final manager = UserModelManager();
}

class UserModelManager extends ModelManager {
  UserModelManager(): super("User");

  fromMap(Map<String, dynamic> map) => UserModel()
  ..firstName = map["firstName"]
  ..lastName = map["lastName"]
  ..email = map["email"]
  ..id = map["id"];
}