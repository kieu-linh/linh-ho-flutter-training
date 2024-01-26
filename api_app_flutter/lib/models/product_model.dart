import 'package:api_app_flutter/models/product_item_model.dart';

class ProductModel {
  List<ProductItemModel>? products;

  ProductModel();
  factory ProductModel.fromData(Map<String, dynamic> listProducts) {
    return ProductModel()
      ..products = (listProducts['products'] as List<dynamic>)
          .map((e) => ProductItemModel.fromData(e))
          .toList();
  }
}
