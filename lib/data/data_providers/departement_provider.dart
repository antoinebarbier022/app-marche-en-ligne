part of '_data_providers.dart';


class DepartementProvider {

  // --- COLLECTION REFERENCE ---
  static CollectionReference getGroupCollection() {
    return firestore.collection('departements');
  }

  // --- GET ALL ---
  Query getAllDepartements() {
    return DepartementProvider.getGroupCollection().withConverter<Departement>(
      fromFirestore: (snapshot, _) => Departement.fromJson(snapshot.data()!),
      toFirestore: (departement, _) => departement.toJson(),
    );
  }


  // --- GET ---
  Future<DocumentSnapshot<Object?>> getDepartement(String id) {
    return DepartementProvider.getGroupCollection().doc(id).get();
  }

}
