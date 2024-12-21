abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}

class PaymentProcessingState extends PaymentState {}

class PaymentSuccessState extends PaymentState {
  bool get isValid => true;
}

class PaymentErrorState extends PaymentState {
  final String errorMessage;

  PaymentErrorState(this.errorMessage);
}
