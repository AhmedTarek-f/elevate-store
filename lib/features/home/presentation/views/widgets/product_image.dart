import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_store/core/constants/app_colors.dart';
import 'package:elevate_store/core/constants/app_icons.dart';
import 'package:elevate_store/core/constants/app_images.dart';
import 'package:elevate_store/core/utlis/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, this.image, this.width, this.height});
  final String? image;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image!,
          fit: BoxFit.contain,
          width: width ?? ScreenUtil().screenWidth,
          height: height ?? 60.h,
          progressIndicatorBuilder: (context, url, progress) => ShimmerEffect(
            width: width ?? ScreenUtil().screenWidth,
            height: height ?? 60.h,
          ),
          errorWidget: (context, url, error) => Image.asset(
            AppImages.imageNotAvailable,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 3.w,
          child: Container(
            width: 26.r,
            height: 26.r,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.favorite,
                width: 20.r,
                height: 20.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
