class Product {
  late String id;
  late String name;
  late String price;
  late String discountedPrice;
  late String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.image,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discounted_price'] = discountedPrice;
    data['image'] = image;
    return data;
  }
}
