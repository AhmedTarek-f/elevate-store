import 'package:elevate_store/features/home/data/models/product_model/rating.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  static ProductModel empty() => ProductModel(
    id: 0,
    category: "",
    image: "",
    title: "",
    description: "",
    price: 0,
    rating: Rating.empty(),
  );

  factory ProductModel.fromJson(Map<String, dynamic>? productData) {
    if (productData != null && productData.isNotEmpty) {
      return ProductModel(
        id: productData['id'] as int,
        title: productData['title'] as String,
        price: productData['price'] as num,
        description: productData['description'] as String,
        category: productData['category'] as String,
        image: productData['image'] as String?,
        rating: Rating.fromJson(productData['rating']),
      );
    } else {
      return empty();
    }
  }
}
