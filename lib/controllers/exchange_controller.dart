import 'package:crypto_tracker/models/exchange_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ExchangeController extends GetxController {
  RxList<Exchange> exchangesList = <Exchange>[].obs; // List 1

  RxBool isLoading = true.obs; // to handle progress indicator

  // function by getx
  @override
  void onInit() {
    super.onInit();
    fetchExchanges();
  }

  fetchExchanges() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://api.coingecko.com/api/v3/exchanges'));

      List<Exchange> exchanges = exchangeFromJson(response.body); // List 2
      exchangesList.value =
          exchanges; // .value cause the list is Rx and not normal
    } finally {
      isLoading(false); // setting to false so the data is shown on UI
    }
  }
}
