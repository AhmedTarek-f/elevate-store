import 'package:elevate_store/core/common_widgets/loading_indicator.dart';
import 'package:elevate_store/core/constants/app_text.dart';
import 'package:elevate_store/core/utlis/loaders/loaders.dart';
import 'package:elevate_store/features/home/presentation/views/widgets/empty_products.dart';
import 'package:elevate_store/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_cubit.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTabBarView extends StatelessWidget {
  const ProductsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is FetchProductsSuccessState ||
          current is FetchProductsFailureState,
      listenWhen: (previous, current) => current is FetchProductsFailureState,
      listener: (context, state) {
        if (state is FetchProductsFailureState) {
          Loaders.showErrorMessage(
            message:
                "${AppText.dataLoadingFailureMessage} ${state.errorMessage}",
            context: context,
          );
        }
      },
      builder: (context, state) => state is FetchProductsLoadingState
          ? const LoadingIndicator()
          : controller.allProductsList.isEmpty
          ? const EmptyProducts()
          : TabBarView(
              physics: const BouncingScrollPhysics(),
              children: controller.listOfCategoryProductsList
                  .map(
                    (productsList) =>
                        ProductsGridView(productsList: productsList),
                  )
                  .toList(),
            ),
    );
  }
}
