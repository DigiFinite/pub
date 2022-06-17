import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DroUtils {
  static SizedBox buildShimmer({
    required double width,
    required double height,
    required BorderRadius borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFF5F5F7),
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            shape: shape,
            color: const Color(0xFFF5F5F7),
            borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
          ),
        ),
      ),
    );
  }
}