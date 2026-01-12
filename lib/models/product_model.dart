class ProductResponse {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: List<Product>.from(
        json['products'].map((x) => Product.fromJson(x)),
      ),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Product {
  final int id;
  final String title;
  final String category;
  final double price;
  final String thumbnail;
  final String description;

  Product(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.thumbnail,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      title: json['title']?.toString() ?? 'No title',
      description: json['description']?.toString() ?? 'No Description',
      category: json['category']?.toString() ?? 'Others',
      price: (json['price'] != null) ? (json['price'] as num).toDouble() : 0.0,
      thumbnail: json['thumbnail']?.toString() ??
          ((json['images'] != null && (json['images'] as List).isNotEmpty)
              ? json['images'][0].toString()
              : ''),
    );
  }
  Product copyWith({
    int? id,
    String? title,
    String? category,
    double? price,
    String? thumbnail,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }
}
