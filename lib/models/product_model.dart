class GetAllProducts {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  GetAllProducts({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory GetAllProducts.fromjson(Map<String, dynamic> jsonData) {
    return GetAllProducts(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] as num).toDouble(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromjson(jsonData['rating'] ?? {}),
    );
  }
}

class RatingModel {
  final int count;
  final double rate;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromjson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] ?? 0).toDouble(),
      count: jsonData['count'] ?? 0,
    );
  }
}
