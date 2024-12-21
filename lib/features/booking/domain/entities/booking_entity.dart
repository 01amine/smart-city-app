class PaymentInfo {
  final String cardHolderName;
  final String cardNumber;
  final String expirationDate;
  final String cvc;

  PaymentInfo({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvc,
  });

  get expiryDate => null;

  get amount => null;
}
