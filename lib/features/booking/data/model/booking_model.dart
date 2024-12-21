import 'package:bsc/features/booking/domain/entities/booking_entity.dart';

class PaymentInfoModel extends PaymentInfo {
  PaymentInfoModel({
    required String cardHolderName,
    required String cardNumber,
    required String expirationDate,
    required String cvc,
  }) : super(
          cardHolderName: cardHolderName,
          cardNumber: cardNumber,
          expirationDate: expirationDate,
          cvc: cvc,
        );

  // Convert model to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'expirationDate': expirationDate,
      'cvc': cvc,
    };
  }

  // Convert JSON object to model
  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) {
    return PaymentInfoModel(
      cardHolderName: json['cardHolderName'],
      cardNumber: json['cardNumber'],
      expirationDate: json['expirationDate'],
      cvc: json['cvc'],
    );
  }
}
