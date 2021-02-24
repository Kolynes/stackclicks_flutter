
class PaymentModel { 
  int id;
  int packagePrice;
  double createdOn;
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