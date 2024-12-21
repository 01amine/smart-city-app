import 'package:bsc/features/booking/domain/repositories/booking_repository.dart';
import 'package:bsc/features/booking/domain/usecases/payment_usecase.dart';
import 'package:bsc/features/booking/presentation/bloc/payment_bloc.dart';
import 'package:bsc/features/booking/presentation/bloc/payment_event.dart';
import 'package:bsc/features/booking/presentation/bloc/payment_state.dart';
import 'package:bsc/features/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});

  final _nomCon = TextEditingController();
  final _numeroCon = TextEditingController();
  final _expDate = TextEditingController();
  final _cvc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: const Color(0xffE76F51),
        title: Text(
          'Payment',
          style: GoogleFonts.inter(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (_) => PaymentBloc(
            ProcessPaymentUseCase(PaymentRepositoryImpl(
              
            )),),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/baridi.png'),
                const SizedBox(height: 16),
                Text('Personal Information',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(
                  controller: _nomCon,
                  decoration: InputDecoration(hintText: 'Name on the Card'),
                  onChanged: (value) {
                    context.read<PaymentBloc>().add(
                          BookingDetailsChanged(
                            cardholderName: value,
                            cardNumber: _numeroCon.text,
                            expirationDate: _expDate.text,
                            cvc: _cvc.text,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _numeroCon,
                  decoration: InputDecoration(hintText: 'Card Number'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<PaymentBloc>().add(
                          BookingDetailsChanged(
                            cardholderName: _nomCon.text,
                            cardNumber: value,
                            expirationDate: _expDate.text,
                            cvc: _cvc.text,
                          ),
                        );
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _expDate,
                        decoration: InputDecoration(hintText: '**/**'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<PaymentBloc>().add(
                                BookingDetailsChanged(
                                  cardholderName: _nomCon.text,
                                  cardNumber: _numeroCon.text,
                                  expirationDate: value,
                                  cvc: _cvc.text,
                                ),
                              );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _cvc,
                        decoration: InputDecoration(hintText: 'CVC'),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<PaymentBloc>().add(
                                BookingDetailsChanged(
                                  cardholderName: _nomCon.text,
                                  cardNumber: _numeroCon.text,
                                  expirationDate: _expDate.text,
                                  cvc: value,
                                ),
                              );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, state) {
                    if (state is PaymentSuccessState) {
                      return MaterialButton(
                        elevation: 1,
                        color: state.isValid
                            ? const Color(0xff495CF5)
                            : Colors.grey,
                        onPressed: state.isValid
                            ? () {
                                context
                                    .read<PaymentBloc>()
                                    .add(SubmitBooking());
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              }
                            : null,
                        child: Text(
                          'Proceed to Payment',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      );
                    } else {
                      return MaterialButton(
                        elevation: 1,
                        color: Colors.grey,
                        onPressed: null,
                        child: Text(
                          'Proceed to Payment',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
