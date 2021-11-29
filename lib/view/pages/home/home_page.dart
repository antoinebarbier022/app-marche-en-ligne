part of '../_pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc.add(GetAllProducts());

    final departementsBloc = BlocProvider.of<DepartementBloc>(context);
    departementsBloc.add(GetAllDepartements());

    return Scaffold(
        appBar: const AppBarCustom(
          title: 'Carrefour Montpellier',
        ),
        // Menu latérale gauche
        drawer: const SideBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                // SearchBar
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CupertinoSearchTextField(),
                ),
              ),
                  // Bouton : Store Departements
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text("Store Departements"),
                      onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => StoreDepartementPage(
                                  title: "Store Departements",
                                )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Affichage des shopping list de l'utilisateur
              BlocBuilder<ShoppingListBloc, ShoppingListState>(
                builder: (context, state) {
                  if (state is ShoppingListLoadSuccess) {
                    return CollectionList(
                      id: '',
                      title: "Shopping List",
                      listShoppingList: state.list,
                      link: ShoppingListsPage(
                        title: 'Shopping List',
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),

              // Affichage des produits rangés par département (departement = catégorie général de produits)
              BlocBuilder<DepartementBloc, DepartementState>(
                builder: (context, departementsState) {
                  // Si on n'as pas encore récupérer les différents departement existant
                  // On affiche un indicateur de chargement
                  if (departementsState is DepartementsLoading) {
                    return const Center(child: CircularProgressIndicator());

                    // Une fois les departements récupérer, on va récupérer tous les produits
                  } else if (departementsState is DepartementsLoaded) {
                    return BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, productsState) {
                      // Si les produits ne sont pas encore chargé, on affiche l'indicateur de chargement
                      if (productsState is ProductsLoading) {
                        return const Center(child: CircularProgressIndicator());

                        // Une fois les produits récupéré, on les affiches dans leurs départements
                      } else if (productsState is ProductsLoaded) {
                        return SizedBox(
                          child: ListView.builder(
                            // On desactive le scroll de la liste car il y a déja celui de SingleChildScrollView
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: departementsState.departements.length,
                            itemBuilder: (BuildContext context, int index) {
                              var listProducts = productsState.products
                                  .where((i) =>
                                      i.departement ==
                                      departementsState
                                          .departements[index].name)
                                  .toList();
                              // Si il existe des produits dans le departement, on créer la CollectionList
                              if (listProducts.isNotEmpty) {
                                return CollectionList(
                                    id: '',
                                    title: departementsState
                                        .departements[index].name,
                                    listProduct: listProducts,
                                    link: DepartementDetailsPage(
                                      departement:
                                          departementsState.departements[index],
                                    ));
                              } else {
                                // Il n'existe pas de produits dans le département, on n'affiche rien
                                return Container();
                              }
                            },
                          ),
                        );
                      } else {
                        return const Center(child: Text("Is Empty."));
                      }
                    });
                  } else {
                    return const Center(child: Text("Is Empty."));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
