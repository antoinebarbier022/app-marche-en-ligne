part of '_repositories.dart';

class ProductRepository {
  ProductRepository({Key? key});
  final _productProvider = ProductProvider();

  Stream<QuerySnapshot> getAllProducts() =>
      _productProvider.getAllProducts().snapshots();


  Stream<QuerySnapshot> getAllProductsByDepartement(String departement) => 
      _productProvider.getAllProductsByDepartement(departement).snapshots();

  
  Stream<QuerySnapshot> getAllProductsByCategory(String category) => 
      _productProvider.getAllProductsByCategory(category).snapshots();


  Future<List<Product?>> getProductsList() async {
        return _productProvider.getAllProducts().get().then((snapshot){
          final List<Product?> products = [];
          for (var doc in snapshot.docs) {
            products.add(doc.data() as Product);
          }
          return products;
        });
  } 

// pas besoins 
    Future<List<Product?>> getProductsDepartementList(String departement) async {
        return _productProvider.getAllProductsByDepartement(departement).get().then((snapshot){
          final List<Product?> products = [];
          for (var doc in snapshot.docs) {
            products.add(doc.data() as Product);
          }
          return products;
        });
  } 

// pas besoins 
      Future<List<Product?>> getProductsCategoryList(String category) async {
        return _productProvider.getAllProductsByCategory(category).get().then((snapshot){
          final List<Product?> products = [];
          for (var doc in snapshot.docs) {
            products.add(doc.data() as Product);
          }
          return products;
        });
  } 


  Future<DocumentSnapshot> getProduct(String id) async =>
      await _productProvider.getProduct(id);


  Future<void> addProduct(Product product) async =>
      await _productProvider.addProduct(product);

  Future<void> deleteProduct(String id) async =>
      await _productProvider.deleteProduct(id);

      
}
