class ProductItemModel {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductItemModel();
  factory ProductItemModel.fromData(Map<String, dynamic> productItem) {
    return ProductItemModel()
      ..id = productItem['id'] as int?
      ..title = productItem['title'] as String?
      ..description = productItem['description'] as String?
      ..price = productItem['price'] as int?
      ..discountPercentage = productItem['discountPercentage'] as double?
      ..rating = productItem['rating'] as double?
      ..stock = productItem['stock'] as int?
      ..brand = productItem['brand'] as String?
      ..category = productItem['category'] as String?
      ..thumbnail = productItem['thumbnail'] as String?
      ..images = (productItem['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList();
  }
}
