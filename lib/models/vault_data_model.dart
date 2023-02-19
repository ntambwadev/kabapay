import 'package:kabapay/models/payment_instrument_model.dart';

class VaultDataModel {
  final String buyTxFees;
  final List<PaymentInstrumentModel> paymentInstruments;
  VaultDataModel({required this.buyTxFees, required this.paymentInstruments,});

  factory VaultDataModel.fromMap(Map? data) {
    data = data ?? { };
    List<dynamic> mapData = data['payment_instruments'] ?? [];
    List<PaymentInstrumentModel> paymentInstruments = mapData.map((e) => PaymentInstrumentModel.fromMap(e)).toList();
    print('PAYEMNT INSTRUMENTS COUNT: ${paymentInstruments.length}');
    return VaultDataModel(
      buyTxFees: data['buyTxFees'] ?? '',
      paymentInstruments: paymentInstruments,
    );
  }
}