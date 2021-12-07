part of '_repositories.dart';


class DepartementRepository {
  DepartementRepository({Key? key});
  final _departementProvider = DepartementProvider();

  Stream<QuerySnapshot> getAllDepartements() =>
      _departementProvider.getAllDepartements().snapshots();


  Future<List<Departement?>> getDepartementsList() async {
        return _departementProvider.getAllDepartements().get().then((snapshot){
          final List<Departement?> departements = [];
          for (var doc in snapshot.docs) {
            departements.add(doc.data() as Departement);
          }
          return departements;
        });
  } 

  Future<DocumentSnapshot> getDepartement(String id) async =>
      await _departementProvider.getDepartement(id);


}
