part of '../_pages.dart';

class Shopping {
  String title;
  int nbItem;

  Shopping(this.title, this.nbItem);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  final list_shopping = [
    Shopping("Evening Shopping list", 4),
    Shopping("Weekend Shopping list", 6),
    Shopping("Favorite product", 9),
  ];

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc.add(GetAllProducts());

    final departementsBloc = BlocProvider.of<DepartementBloc>(context);
    departementsBloc.add(GetAllDepartements());

    return Scaffold(
        appBar: const AppBarCustom(
          title: 'Good Market',
        ),
        drawer: const SideBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CupertinoSearchTextField(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: const Text("Store Departements"),
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => StoreDepartementPage(
                                title: "Store Departements",
                              )),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              CollectionList(
                id: '',
                title: "Shopping List",
                listShoppingList: list_shopping,
                link: ShoppingListsPage(
                  title: 'Shopping lists',
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              BlocBuilder<DepartementBloc, DepartementState>(
                builder: (context, departementsState) {
                  if (departementsState is DepartementsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (departementsState is DepartementsLoaded) {

                    return BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, productsState) {
                      if (productsState is ProductsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (productsState is ProductsLoaded) {
                        return SizedBox(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: departementsState.departements.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CollectionList(
                                  id: '',
                                  title: departementsState.departements[index].name,
                                  listProduct: productsState.products
                                      .where((i) =>
                                          i.departement ==
                                          departementsState.departements[index].name)
                                      .toList(),
                                  link: DepartementCategoryPage(
                                    departement: departementsState.departements[index],
                                  ));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                height: 20,
                                thickness: 1,
                              );
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
              )
            ],
          ),
        ));
  }
}
