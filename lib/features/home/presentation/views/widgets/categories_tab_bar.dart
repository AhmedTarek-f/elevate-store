import 'package:elevate_store/core/constants/app_colors.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_cubit.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is FetchProductsSuccessState,
          builder: (context, state) => TabBar(
            splashFactory: NoSplash.splashFactory,
            splashBorderRadius: BorderRadius.circular(100.r),
            physics: const BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.semiGray,
            indicatorPadding: REdgeInsets.symmetric(horizontal: 4, vertical: 4),
            isScrollable: true,
            indicatorWeight: 4,
            tabAlignment: TabAlignment.start,
            labelPadding: REdgeInsets.symmetric(horizontal: 16),
            unselectedLabelStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.blue),
            labelStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.darkBlue),
            tabs: controller.categoriesList
                .map((category) => Tab(text: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
