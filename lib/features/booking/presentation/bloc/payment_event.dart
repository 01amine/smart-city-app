import 'package:bsc/features/booking/domain/entities/booking_entity.dart';

abstract class PaymentEvent {}

class BookingDetailsChanged extends PaymentEvent {
  final String cardholderName;
  final String cardNumber;
  final String expirationDate;
  final String cvc;

  BookingDetailsChanged({
    required this.cardholderName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvc,
  });
}

class SubmitBooking extends PaymentEvent {}

class ProcessPaymentEvent extends PaymentEvent {
  PaymentInfo get paymentInfo => PaymentInfo(
      cardHolderName: '', cardNumber: '', expirationDate: '', cvc: '');
}
