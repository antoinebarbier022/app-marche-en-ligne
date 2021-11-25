part of '_models.dart';

class Product {
  String name;
  String urlImage;
  String departement;
  String category;
  double price;

  Product({this.name = "name", this.urlImage = "assets/fruits.png", this.price = 0, this.departement = "", this.category = ""});
}