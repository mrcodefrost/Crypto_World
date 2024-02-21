// To parse this JSON data, do
//
//     final exchange = exchangeFromJson(jsonString);

import 'dart:convert';

List<Exchange> exchangeFromJson(String str) =>
    List<Exchange>.from(json.decode(str).map((x) => Exchange.fromJson(x)));

String exchangeToJson(List<Exchange> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exchange {
  String id;
  String name;
  int? yearEstablished;
  String? country;
  String? description;
  String url;
  String image;
  bool? hasTradingIncentive;
  int trustScore;
  int trustScoreRank;
  double tradeVolume24HBtc;
  double tradeVolume24HBtcNormalized;

  Exchange({
    required this.id,
    required this.name,
    required this.yearEstablished,
    required this.country,
    required this.description,
    required this.url,
    required this.image,
    required this.hasTradingIncentive,
    required this.trustScore,
    required this.trustScoreRank,
    required this.tradeVolume24HBtc,
    required this.tradeVolume24HBtcNormalized,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        id: json["id"],
        name: json["name"],
        yearEstablished: json["year_established"],
        country: json["country"],
        description: json["description"],
        url: json["url"],
        image: json["image"],
        hasTradingIncentive: json["has_trading_incentive"],
        trustScore: json["trust_score"],
        trustScoreRank: json["trust_score_rank"],
        tradeVolume24HBtc: json["trade_volume_24h_btc"]?.toDouble(),
        tradeVolume24HBtcNormalized:
            json["trade_volume_24h_btc_normalized"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year_established": yearEstablished,
        "country": country,
        "description": description,
        "url": url,
        "image": image,
        "has_trading_incentive": hasTradingIncentive,
        "trust_score": trustScore,
        "trust_score_rank": trustScoreRank,
        "trade_volume_24h_btc": tradeVolume24HBtc,
        "trade_volume_24h_btc_normalized": tradeVolume24HBtcNormalized,
      };
}
