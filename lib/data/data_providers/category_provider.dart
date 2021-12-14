part of '_data_providers.dart';


class CategoryProvider {

  // --- COLLECTION REFERENCE ---
  static CollectionReference getGroupCollection() {
    return firestore.collection('categories');
  }

  // --- GET ALL ---
  Query getAllCategories() {
    return CategoryProvider.getGroupCollection().withConverter<Category>(
      fromFirestore: (snapshot, _) => Category.fromJson(snapshot.data()!),
      toFirestore: (category, _) => category.toJson(),
    );
  }


  // --- GET ---
  Future<DocumentSnapshot<Object?>> getCategory(String id) {
    return CategoryProvider.getGroupCollection().doc(id).get();
  }

}
