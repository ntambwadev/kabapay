import 'package:cloud_firestore/cloud_firestore.dart';

class TokenMetadataModel {
  final String id;
  final String name;
  final String chain;
  final double currentPrice;
  final String symbol;
  final String image;
  final double priceChangePercent24h;

  TokenMetadataModel({required this.id, required this.name, required this.chain,
    required this.currentPrice, required this.symbol,
    required this.image, required this.priceChangePercent24h});

  factory TokenMetadataModel.fromMap(Map? data) {
    data = data ?? { };
    return TokenMetadataModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      chain: data['chain'] ?? 'BSC',
      currentPrice: data['currentPrice'].toDouble(),
      symbol: data['symbol'] ?? '',
      image: data['image'] ?? '',
      priceChangePercent24h: data['priceChangePercent24h'].toDouble(),
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
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'chain': chain,
    'currentPrice': currentPrice,
    'symbol': symbol,
    'image': image,
    'priceChangePercent24h': priceChangePercent24h,
  };
}