part of '_models.dart';

class Product {
  String name;
  String urlImage;
  String departement;
  String category;
  String description;
  double price;

  Product(
      {this.name = "name",
      this.urlImage = "http://via.placeholder.com/500x500",
      this.price = 0,
      this.departement = "",
      this.category = "",
      this.description = ""});

  Map<String, dynamic> toJson() => _productToJson(this);

  Product.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"].toString(),
          urlImage: json["urlImage"].toString(),
          departement: json["departement"].toString(),
          category: json["category"].toString(),
          description: json["description"].toString()=="null" || json["description"].toString().isEmpty
              ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
              : json["description"].toString(),
          price: double.parse(
              json["price"] == null ? "0" : json["price"].toString()),
        );

  @override
  String toString() => "Product : $name ";

  Map<String, dynamic> _productToJson(Product instance) => <String, dynamic>{
        'name': instance.name,
        'urlImage': instance.urlImage,
        'departement': instance.departement,
        'category': instance.category,
        'description': instance.description,
        'price': instance.price,
      };
}
