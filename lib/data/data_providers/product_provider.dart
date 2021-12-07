

part of '_data_providers.dart';


final FirebaseFirestore firestore = FirebaseFirestore.instance;


class ProductProvider {

  // --- COLLECTION REFERENCE ---
  static CollectionReference getGroupCollection() {
    return firestore.collection('products');
  }

  // --- GET ALL ---
  Query getAllProducts() {
    return ProductProvider.getGroupCollection().withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    );
  }

// pas besoins 
  // --- GET ALL BY DEPARTEMENT ---
  Query getAllProductsByDepartement(String departement) {
    return ProductProvider.getGroupCollection()
        .where("departement", isEqualTo: departement).withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    );
  }

// pas besoins 
    // --- GET ALL BY CATEGORY ---
  Query getAllProductsByCategory(String category) {
    return ProductProvider.getGroupCollection()
        .where("category", isEqualTo: category).withConverter<Product>(
      fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
      toFirestore: (product, _) => product.toJson(),
    );
  }

  // --- GET ---
  Future<DocumentSnapshot<Object?>> getProduct(String id) {
    return ProductProvider.getGroupCollection().doc(id).get();
  }

  // --- ADD ---
  Future<void> addProduct(Product newProduct) async {
    return ProductProvider.getGroupCollection()
        .doc()
        .set(newProduct.toJson());
  }

  // --- DELETE ---
  Future<void> deleteProduct(String id) async {
    return ProductProvider.getGroupCollection().doc(id).delete();
  }

  // --- DELETE QUESTION FOR THEME ---
  Future<void> deleteProductsTheme(String id) async {
    return ProductProvider.getGroupCollection().doc(id).delete();
  }
}
