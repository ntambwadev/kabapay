import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabapay/models/token_metadata_model.dart';

class TokenModel {
  final String id;
  final String symbol;
  final String amountToken;
  final String amountUSD;
  final TokenMetadataModel tokenMetadata;

  TokenModel({required this.id, required this.symbol,
    required this.amountToken, required this.amountUSD,
    required this.tokenMetadata,
  });

  factory TokenModel.fromMap(Map? data) {
    data = data ?? { };
    return TokenModel(
      id: data['id'] ?? '',
      symbol: data['symbol'] ?? '',
      amountToken: data['amountToken'] ?? '',
      amountUSD: data['amountUSD'] ?? '',
      tokenMetadata: TokenMetadataModel.fromMap(data['tokenMetadata']),
    );
  }

  factory TokenModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return TokenModel(
      id: data['id'] ?? '',
      symbol: data['symbol'] ?? '',
      amountToken: data['amountToken'] ?? '',
      amountUSD: data['amountUSD'] ?? '',
      tokenMetadata: TokenMetadataModel.fromMap(data['tokenMetadata']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'symbol': symbol,
    'amountToken': amountToken,
    'amountUSD': amountUSD,
    'tokenMetadata': tokenMetadata!.toJson(),
  };
}