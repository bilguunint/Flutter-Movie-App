import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildLoadingCampaignsWidget(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black87,
    highlightColor: Colors.white54,
    enabled: true,
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.0,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: Container(
                            decoration: const BoxDecoration(
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
                            height: 8,
                            width: 60,
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
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black12),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black12),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                height: 6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black12),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                height: 6,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black12),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                height: 6,
                                width: double.infinity,
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
