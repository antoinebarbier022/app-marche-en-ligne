part of '_models.dart';

class Departement {
  String name;
  String image;
  Color? color;
  List<Category> categories;

  Departement(this.name, this.image, this.color, this.categories);
}