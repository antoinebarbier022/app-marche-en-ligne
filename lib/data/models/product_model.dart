part of '_models.dart';

class Product {
  String name;
  String urlImage;
  String departement;
  String category;
  double price;

  Product({this.name = "name", this.urlImage = "http://via.placeholder.com/500x500", this.price = 0, this.departement = "", this.category = ""});

    Map<String, dynamic> toJson() => _productToJson(this);

  Product.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"] as String,
          urlImage: json["urlImage"] as String,
          departement: json["departement"] as String,
          category: json["category"] as String,
          price: json["price"] as double,
        );

  @override
  String toString() => "Product : $name ";

  Map<String, dynamic> _productToJson(Product instance) => <String, dynamic>{
        'name': instance.name,
        'urlImage': instance.urlImage,
        'departement' : instance.departement,
        'category': instance.category,
        'price': instance.price,
 
      };
}