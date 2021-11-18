part of '../_pages.dart';

class Departement {
  String title;
  String image;
  Color? color;

  Departement(this.title, this.color, this.image);
}

class StoreDepartementPage extends StatelessWidget {
  StoreDepartementPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<DepartementBloc>(context);
    themeBloc.add(GetAllDepartements());

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
                    title: state.departements[index].name,
                    color: state.departements[index].color,
                    image: state.departements[index].image);
              },
            );
          } else {
            return const Center(child: Text("Is Empty."));
          }
        }));
  }
}
