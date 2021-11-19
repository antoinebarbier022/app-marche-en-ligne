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

              CollectionList(
                id: '',
                title: "Shopping List",
                listShoppingList: list_shopping,
                link: ShoppingListsPage(
                  title: 'Shopping lists',
                ),
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
                          child: ListView.builder(
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
                              }else{
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
