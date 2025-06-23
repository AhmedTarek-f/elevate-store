import 'package:dartz/dartz.dart';
import 'package:elevate_store/core/utlis/exceptions/failure.dart';
import 'package:elevate_store/features/home/data/models/product_model/product_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ProductModel>>> fetchProducts();
}
