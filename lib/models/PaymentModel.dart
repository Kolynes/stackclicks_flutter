
class PaymentModel { 
  int id;
  int packagePrice;
  int createdOn;
  String package;
  bool isActive;

  PaymentModel({
    this.id, 
    this.packagePrice, 
    this.createdOn, 
    this.package, 
    this.isActive
  });
}