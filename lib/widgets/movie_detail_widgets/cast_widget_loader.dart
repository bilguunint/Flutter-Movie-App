import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildCastslistLoaderWidget(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black87,
    highlightColor: Colors.white54,
    enabled: true,
    child: Container(
      height: 130.0,
      padding: const EdgeInsets.only(left: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 15.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0)),
                        child: SizedBox(
                          height: 120.0,
                          child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.8,
                                decoration: const BoxDecoration(
                                  color: Colors.black12,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    ),
  );
}
