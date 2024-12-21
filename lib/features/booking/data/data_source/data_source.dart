
import 'dart:convert';
import 'package:bsc/features/booking/domain/entities/booking_entity.dart';
import 'package:bsc/shared/utils/dio_client.dart';
import 'package:bsc/shared/utils/service_locator.dart';

abstract class PaymentDataSource {
  Future<void> processPayment(PaymentInfo paymentInfo);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final String baseUrl;

  PaymentDataSourceImpl({
    required this.baseUrl,
  });

  @override
  Future<void> processPayment(PaymentInfo paymentInfo) async {
    try {
      final response = await sl<DioClient>().post(
        'api/paiment',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'cardNumber': paymentInfo.cardNumber,
          'expiryDate': paymentInfo.expiryDate,
          'cvv': paymentInfo.cvc,
          'cardHolderName': paymentInfo.cardHolderName,
          'amount': paymentInfo.amount,
        }),
      );

      if (response.statusCode == 200) {
        print('Payment successfully processed for: ${paymentInfo.cardHolderName}');
      } else {
        throw Exception('Failed to process payment: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error processing payment: $e');
    }
  }
}
