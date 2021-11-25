part of '_models.dart';

class Product {
  String name;
  String urlImage;
  String departement;
  String category;
  double price;

  Product({this.name = "name", this.urlImage = "http://via.placeholder.com/500x500", this.price = 0, this.departement = "", this.category = ""});
}