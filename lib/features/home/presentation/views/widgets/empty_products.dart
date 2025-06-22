import 'package:elevate_store/core/constants/app_colors.dart';
import 'package:elevate_store/core/constants/app_images.dart';
import 'package:elevate_store/core/constants/app_text.dart';
import 'package:elevate_store/core/utlis/loaders/animation_loader.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_cubit.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyProducts extends StatelessWidget {
  const EmptyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return Column(
      children: [
        const AnimationLoaderWidget(
          text: AppText.noProductsMessage,
          animation: AppImages.emptyAnimation,
        ),
        const RSizedBox(height: 32),
        RSizedBox(
          width: ScreenUtil().screenWidth * 0.8,
          height: 51,
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is FetchProductsFailureState ||
                current is FetchProductsLoadingState,
            builder: (context, state) => state is FetchProductsLoadingState
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.blue,
                    ),
                    onPressed: () {
                      controller.getAllProducts();
                    },
                    child: SizedBox(
                      width: 24.r,
                      height: 24.r,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.blue,
                    ),
                    onPressed: () {
                      controller.getAllProducts();
                    },
                    child: Text(
                      AppText.tryAgain,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
