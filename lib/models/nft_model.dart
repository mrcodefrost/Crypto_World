// To parse this JSON data, do
//
//     final nft = nftFromJson(jsonString);

import 'dart:convert';

List<Nft> nftFromJson(String str) =>
    List<Nft>.from(json.decode(str).map((x) => Nft.fromJson(x)));

String nftToJson(List<Nft> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nft {
  String id;
  String contractAddress;
  String name;
  String assetPlatformId;
  String symbol;

  Nft({
    required this.id,
    required this.contractAddress,
    required this.name,
    required this.assetPlatformId,
    required this.symbol,
  });

  factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        id: json["id"],
        contractAddress: json["contract_address"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract_address": contractAddress,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "symbol": symbol,
      };
}
