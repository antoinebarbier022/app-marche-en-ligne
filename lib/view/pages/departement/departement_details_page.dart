part of '../_pages.dart';

class DepartementDetailsPage extends StatelessWidget {
  const DepartementDetailsPage({Key? key, required this.departement})
      : super(key: key);

  final Departement? departement;

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc.add(GetAllProducts());

    final categoriesBloc = BlocProvider.of<CategoryBloc>(context);
    categoriesBloc.add(GetAllCategories());

    return Scaffold(
        appBar: AppBarCustom(
          title: departement!.name,
          // search
          search: true,
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Search Bar
          /*
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(),
          ),*/
          const SizedBox(height: 10),
          // liste horizontale qui fait défiler la liste des noms de catégories du département
          CategoriesListBadge(
            departement: departement,
          ),
          // Affichage de toutes les catégories du département avec leurs produits
          const SizedBox(height: 10),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, stateCategory) {
              if (stateCategory is CategoriesLoaded) {
                var categoriesFromThisDepartement = stateCategory.categories
                    .where((i) => i?.departement == departement!.name)
                    .toList();

                return BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, productsState) {
                  if (productsState is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (productsState is ProductsLoaded) {
                    if (categoriesFromThisDepartement.isNotEmpty) {
                      return SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoriesFromThisDepartement.length,
                            itemBuilder: (BuildContext context, int index) {
                              var listProduitCategory = productsState.products
                                  .where((i) =>
                                      (i!.category ==
                                          categoriesFromThisDepartement[index]!
                                              .name) &&
                                      (i.departement == departement!.name))
                                  .toList();
                              // Si la liste de produit de la catégorie n'est pas vide, on l'affiche
                              if (listProduitCategory.isNotEmpty) {
                                return CollectionList(
                                    id: '',
                                    title: categoriesFromThisDepartement[index]!
                                        .name,
                                    listProduct: listProduitCategory,
                                    link: DepartementCategoryPage(
                                      departement: departement,
                                      category:
                                          categoriesFromThisDepartement[index]!
                                              .name,
                                    ));
                              } else {
                                return Container();
                              }
                            }),
                      );
                    } else {
                      return const Center(child: Text("Is Empty."));
                    }
                  } else {
                    return const Center(child: Text("Is Empty."));
                  }
                });
              } else if (stateCategory is CategoriesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text("Is Empty."));
              }
            },
          )
        ])));
  }
}

class CategoriesListBadge extends StatelessWidget {
  const CategoriesListBadge({
    Key? key,
    required this.departement,
  }) : super(key: key);

  final Departement? departement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            var categoriesFromThisDepartement = state.categories
                    .where((i) => i?.departement == departement!.name)
                    .toList();

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categoriesFromThisDepartement.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(left:10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(categoriesFromThisDepartement[index]!.name,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark)),
                        ))),
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => DepartementCategoryPage(
                                  departement: departement,
                                  category: categoriesFromThisDepartement[index]!.name,
                                )),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Is Empty."));
          }
        },
      ),
    );
  }
}
