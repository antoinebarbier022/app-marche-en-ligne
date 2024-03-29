part of '../_pages.dart';

/// Page qui list tous les départements existant dans une grille

class StoreDepartementPage extends StatelessWidget {
  const StoreDepartementPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final departementBloc = BlocProvider.of<DepartementBloc>(context);
    departementBloc.add(GetAllDepartements());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          automaticallyImplyLeading: true,
        ),
        body: BlocBuilder<DepartementBloc, DepartementState>(
            builder: (context, state) {
          if (state is DepartementsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DepartementsLoaded) {
            return GridView.builder(
              itemCount: state.departements.length,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return DepartementItem(
                    departement: state.departements[index]);
              },
            );
          } else {
            return const Center(child: Text("Is Empty."));
          }
        }));
  }
}
