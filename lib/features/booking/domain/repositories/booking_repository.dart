import 'package:bsc/features/booking/data/data_source/data_source.dart';
import 'package:bsc/features/booking/domain/entities/booking_entity.dart';

abstract class PaymentRepository {
  Future<void> processPayment(PaymentInfo paymentInfo);
}

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<void> processPayment(PaymentInfo paymentInfo) async {
    await dataSource.processPayment(paymentInfo);
  }
}
