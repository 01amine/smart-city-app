import 'package:bsc/features/booking/domain/entities/booking_entity.dart';
import 'package:bsc/features/booking/domain/repositories/booking_repository.dart';

class ProcessPaymentUseCase {
  final PaymentRepository repository;

  ProcessPaymentUseCase(this.repository);

  Future<void> execute(PaymentInfo paymentInfo) async {
    await repository.processPayment(paymentInfo);
  }
}
