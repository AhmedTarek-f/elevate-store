import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
  });

  final String text;
  final String animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: ScreenUtil().screenWidth * 0.8),
          SizedBox(height: 12.h),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
