part of '_models.dart';

class Departement {
  String name;
  String image;
  Color? color;
  List<String>? categories;

  Departement({required this.name, required this.image, this.color,  this.categories});

  Map<String, dynamic> toJson() => _departementToJson(this);

  Departement.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"] as String,
          image: json["image"] as String,
          //categories : json["image"] as List<String>
        );

  @override
  String toString() => "Product : $name ";

  Map<String, dynamic> _departementToJson(Departement instance) => <String, dynamic>{
        'name': instance.name,
        'image': instance.image,
        //'departement' : instance.categories,
 
      };
}