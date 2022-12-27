import 'package:cloud_firestore/cloud_firestore.dart';

class TokenMetadataModel {
  final String id;
  final String name;
  final String chain;
  final String currentPrice;
  final String symbol;
  final String image;
  final String priceChangePercent24h;
  final String amountUSD;

  TokenMetadataModel({required this.id, required this.name, required this.chain,
    required this.currentPrice, required this.symbol,
    required this.image, required this.priceChangePercent24h, required this.amountUSD});

  factory TokenMetadataModel.fromMap(Map? data) {
    data = data ?? { };
    return TokenMetadataModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      chain: data['chain'] ?? 'BSC',
      currentPrice: data['currentPrice'] ?? '',
      symbol: data['symbol'] ?? '',
      image: data['image'] ?? '',
      priceChangePercent24h: data['priceChangePercent24h'] ?? '',
      amountUSD: data['amountUSD'] ?? '',
    );
  }

  factory TokenMetadataModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return TokenMetadataModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      chain: data['chain'] ?? 'BSC',
      currentPrice: data['currentPrice'] ?? '',
      symbol: data['symbol'] ?? '',
      image: data['image'] ?? '',
      priceChangePercent24h: data['priceChangePercent24h'] ?? '',
      amountUSD: data['amountUSD'] ?? '',
    );
  }
}