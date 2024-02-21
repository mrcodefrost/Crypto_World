import 'package:crypto_tracker/components/glass_card_widget.dart';
import 'package:crypto_tracker/controllers/nft_controller.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NftTrackerPage extends StatelessWidget {
  final NftController nftController = Get.put(NftController());

  NftTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => DeskNftTrackerPage(
        nftController: nftController,
      ),
      mobile: (BuildContext context) => MobNftTrackerPage(),
    );
  }
}

class DeskNftTrackerPage extends StatelessWidget {
  final NftController nftController;

  const DeskNftTrackerPage({super.key, required this.nftController});

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
                          child: Text('NFT'),
                        ),
                        Text('Contract Address'),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  // takes in reactive values which changes based on state ( method by GetX )
                  () => nftController.isLoading.value
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
                                                padding: EdgeInsets.all(10),
                                                // image of logos
                                                child: Image.asset(logo
                                                    // nftController
                                                    // .nftList[index].symbol
                                                    ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  nftController
                                                      .nftList[index].name,
                                                ),
                                                Text(nftController
                                                    .nftList[index].id
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
                                        //         '${nftController.nftsList[index].trustScore}'),
                                        //   ],
                                        // ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(nftController.nftList[index]
                                                .contractAddress),
                                            Text(nftController.nftList[index]
                                                .assetPlatformId),
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

class MobNftTrackerPage extends StatelessWidget {
  const MobNftTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
