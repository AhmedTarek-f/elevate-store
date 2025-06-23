import 'package:dartz/dartz.dart';
import 'package:elevate_store/core/utlis/exceptions/dio_exceptions.dart';
import 'package:elevate_store/core/utlis/exceptions/failure.dart';
import 'package:elevate_store/core/utlis/services/api_services.dart';
import 'package:elevate_store/features/home/data/data_sources/remote_data_source/home_remote_data.dart';
import 'package:elevate_store/features/home/data/models/product_model/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteData)
class HomeRemoteDataImpl implements HomeRemoteData {
  @factoryMethod
  const HomeRemoteDataImpl({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      final result = await apiService.getRequest(endpoint: "/products");
      return result.fold((failure) => left(failure), (success) {
        final listOfProducts = (success.data as List)
            .map(
              (product) =>
                  ProductModel.fromJson(product as Map<String, dynamic>),
            )
            .toList();
        return right(listOfProducts);
      });
    } catch (e) {
      return left(DioExceptions(errorMessage: e.toString()));
    }
  }
}
