import 'package:elevate_store/core/constants/app_colors.dart';
import 'package:elevate_store/core/constants/app_icons.dart';
import 'package:elevate_store/features/home/data/models/product_model/product_model.dart';
import 'package:elevate_store/features/home/presentation/views/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productData});
  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: REdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.semiGray.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: AppColors.semiGray.withValues(alpha: 0.7),
              blurStyle: BlurStyle.outer,
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: REdgeInsets.only(top: 16, bottom: 12),
              child: ProductImage(
                image: productData.image,
                height: 100.h,
                width: ScreenUtil().screenWidth,
              ),
            ),
            const RSizedBox(height: 8),
            Text(
              productData.title ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const RSizedBox(height: 8),
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "EGP ${productData.price}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const RSizedBox(width: 16),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${((productData.price ?? 0) + 50).toStringAsFixed(2)} EGP",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.lightBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const RSizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Review (${productData.rating?.rate ?? 0})",
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const RSizedBox(width: 4),
                      SvgPicture.asset(
                        AppIcons.star,
                        width: 18.r,
                        height: 18.r,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 30.r,
                    height: 30.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkBlue,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.plus,
                        width: 30.r,
                        height: 30.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
