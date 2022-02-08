import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildLoadingCampaignsWidget(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.black87,
    highlightColor: Colors.white54,
    enabled: true,
    child: AspectRatio(
      aspectRatio: 2 / 2.8,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
      ),
    ),
  );
}
