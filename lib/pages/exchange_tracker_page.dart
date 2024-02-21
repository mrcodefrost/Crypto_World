import 'package:crypto_tracker/components/glass_card_widget.dart';
import 'package:crypto_tracker/controllers/exchange_controller.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExchangeTrackerPage extends StatelessWidget {
  final ExchangeController exchangeController =
      Get.put(ExchangeController()); // state injected in UI by getx
  ExchangeTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) =>
          DeskExchangeTrackerPage(exchangeController: exchangeController),
      mobile: (BuildContext context) => MobExchangeTrackerPage(),
    );
  }
}

class DeskExchangeTrackerPage extends StatelessWidget {
  final ExchangeController exchangeController;
  const DeskExchangeTrackerPage({super.key, required this.exchangeController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassCardWidget(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    width: screenWidth! / 1.2,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 60),
                          child: Text('Exchange'),
                        ),
                        Text('24H Volume'),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  // takes in reactive values which changes based on state ( method by GetX )
                  () => exchangeController.isLoading.value
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
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
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
                                                padding:
                                                    const EdgeInsets.all(10),
                                                // image of logos
                                                child: Image.network(
                                                    exchangeController
                                                        .exchangesList[index]
                                                        .image),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  exchangeController
                                                      .exchangesList[index]
                                                      .name,
                                                ),
                                                Text(exchangeController
                                                    .exchangesList[index].id
                                                    .toUpperCase()),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        // Column(
                                        //   children: [
                                        //     Text(
                                        //         '${exchangeController.exchangesList[index].trustScore}'),
                                        //   ],
                                        // ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                '\$ ${exchangeController.exchangesList[index].tradeVolume24HBtc}'),
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
}

class MobExchangeTrackerPage extends StatelessWidget {
  const MobExchangeTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
