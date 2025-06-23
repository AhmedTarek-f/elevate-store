import 'package:dartz/dartz.dart';
import 'package:elevate_store/core/utlis/exceptions/failure.dart';
import 'package:elevate_store/features/home/data/data_sources/remote_data_source/home_remote_data.dart';
import 'package:elevate_store/features/home/data/models/product_model/product_model.dart';
import 'package:elevate_store/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  @factoryMethod
  const HomeRepositoryImpl({required this.remoteData});
  final HomeRemoteData remoteData;
  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    return await remoteData.fetchProducts();
  }
}
