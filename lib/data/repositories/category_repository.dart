part of '_repositories.dart';


class CategoryRepository {
  CategoryRepository({Key? key});
  final _categoryProvider = CategoryProvider();

  Stream<QuerySnapshot> getAllCategories() =>
      _categoryProvider.getAllCategories().snapshots();


  Future<List<Category?>> getCategoriesList() async {
        return _categoryProvider.getAllCategories().get().then((snapshot){
          final List<Category?> categories = [];
          for (var doc in snapshot.docs) {
            categories.add(doc.data() as Category);
          }
          return categories;
        });
  } 

  Future<DocumentSnapshot> getCategory(String id) async =>
      await _categoryProvider.getCategory(id);


}
