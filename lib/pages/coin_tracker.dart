import 'package:crypto_tracker/components/glass_card_widget.dart';
import 'package:crypto_tracker/controllers/coin_controller.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CoinTracker extends StatelessWidget {
  final CoinController coinController = Get.put(CoinController());
  CoinTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => deskCoinTracker(coinController),
      mobile: (BuildContext context) => mobCoinTracker(coinController),
    );
  }
}

/////==============DESKTOP/WEB================/////

Widget deskCoinTracker(CoinController coinController) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlassCardWidget(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  width: screenWidth! / 1.2,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Text('Name'),
                      ),
                      Text('Current Price'),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => coinController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: screenWidth! / 1.2,
                        child: GlassCardWidget(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 100,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                            height: 60,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              // image of logos
                                              child: Image.network(
                                                  coinController
                                                      .coinList[index].image),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(coinController
                                                  .coinList[index].name),
                                              Text(coinController
                                                  .coinList[index].symbol
                                                  .toUpperCase()),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              '\$ ${coinController.coinList[index].currentPrice}'),
                                          Text(
                                              '${coinController.coinList[index].priceChangePercentage24H.toStringAsFixed(3)}%'),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
              )
            ],
          )),
    ),
  );
}

/////==============MOBILE================/////

Widget mobCoinTracker(CoinController coinController) {
  return Container();
}
