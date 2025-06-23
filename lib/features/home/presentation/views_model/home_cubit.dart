import 'package:elevate_store/core/constants/app_text.dart';
import 'package:elevate_store/features/home/data/models/product_model/product_model.dart';
import 'package:elevate_store/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_store/features/home/presentation/views_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial()) {
    onInit();
  }
  final HomeRepository homeRepo;

  List<ProductModel> allProductsList = [];
  List<List<ProductModel>> listOfCategoryProductsList = [];
  List<String?> categoriesList = [];

  void onInit() {
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    emit(FetchProductsLoadingState());
    var result = await homeRepo.fetchProducts();
    result.fold(
      (failure) =>
          emit(FetchProductsFailureState(errorMessage: failure.errorMessage)),
      (successData) {
        allProductsList = successData;
        getCategoriesList();
        getCategoryProductsList();
        emit(FetchProductsSuccessState());
      },
    );
  }

  void getCategoriesList() {
    categoriesList = allProductsList
        .map((product) => product.category)
        .toList();
    categoriesList = categoriesList.toSet().toList();
    categoriesList.insert(0, AppText.all);
  }

  void getCategoryProductsList() {
    listOfCategoryProductsList.add(allProductsList);
    for (int i = 1; i < categoriesList.length; i++) {
      final categoryProductsList = allProductsList
          .where((product) => product.category == categoriesList[i])
          .toList();
      listOfCategoryProductsList.add(categoryProductsList);
    }
  }
}
