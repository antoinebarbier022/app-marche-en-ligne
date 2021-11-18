part of '../_pages.dart';

class Shopping {
  String title;
  int nbItem;

  Shopping(this.title, this.nbItem);
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list_departement = [
    "Popular",
    "Vegetables",
  ];

  final list_shopping = [
    Shopping("Evening Shopping list", 4),
    Shopping("Weekend Shopping list", 6),
    Shopping("Favorite product", 9),
  ];

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ProductBloc>(context);
    themeBloc.add(GetAllProducts());

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
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductsLoaded) {
                    return SizedBox(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: list_departement.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CollectionList(
                              id: '',
                              title: list_departement[index],
                              listProduct: state.products
                                  .where((i) =>
                                      i.departement == list_departement[index])
                                  .toList(),
                              link: DepartementCategoryPage(
                                title: list_departement[index],
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
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
                },
              ),
            ],
          ),
        ));
  }
}
