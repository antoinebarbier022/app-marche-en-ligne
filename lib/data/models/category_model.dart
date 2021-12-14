part of '_models.dart';

class Category {
  String name;
  String departement;

  Category({required this.name, required this.departement});

  Map<String, dynamic> toJson() => _departementToJson(this);

  Category.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"] as String,
          departement: json["departement"] as String,
        );

  @override
  String toString() => "Category : $name ";

  Map<String, dynamic> _departementToJson(Category instance) => <String, dynamic>{
        'name': instance.name,
        'departement': instance.departement,
        //'categories' : instance.categories,
 
      };
}