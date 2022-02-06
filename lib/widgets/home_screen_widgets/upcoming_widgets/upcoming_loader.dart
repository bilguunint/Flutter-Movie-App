import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildLoadingCampaignsWidget(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black87,
    highlightColor: Colors.white54,
    enabled: true,
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
          ),
          Positioned(
              bottom: 20.0,
              left: 10.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.0,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black12,
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 7,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 6,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}
