import 'package:bsc/features/booking/domain/usecases/payment_usecase.dart';
import 'package:bsc/features/booking/presentation/bloc/payment_event.dart';
import 'package:bsc/features/booking/presentation/bloc/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final ProcessPaymentUseCase processPaymentUseCase;

  PaymentBloc(this.processPaymentUseCase) : super(PaymentInitialState());

  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    if (event is ProcessPaymentEvent) {
      yield PaymentProcessingState();
      try {
        await processPaymentUseCase.execute(event.paymentInfo);
        yield PaymentSuccessState();
      } catch (e) {
        yield PaymentErrorState(e.toString());
      }
    }
  }
}
