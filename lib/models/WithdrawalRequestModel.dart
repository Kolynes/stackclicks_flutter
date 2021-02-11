class WithdrawalRequestModel {
  int id;
  String type;
  int createdOn;
  double amount;
  String status;

  WithdrawalRequestModel({
    this.id,
    this.type,
    this.createdOn,
    this.amount,
    this.status
  });
}