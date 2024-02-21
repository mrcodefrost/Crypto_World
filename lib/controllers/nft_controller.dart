
import 'package:crypto_tracker/models/nft_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class NftController extends GetxController {
  RxList<Nft> nftList = <Nft>[].obs; // List 1

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNfts();
  }

  fetchNfts() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/nfts/list?per_page=100&page=1'));

      List<Nft> nfts = nftFromJson(response.body); // List 2
      nftList.value = nfts; // .value cause the list is Rx and not normal
    } finally {
      isLoading(false);
    }
  }
}
