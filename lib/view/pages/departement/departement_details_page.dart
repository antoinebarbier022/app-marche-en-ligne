part of '../_pages.dart';

class DepartementDetailsPage extends StatelessWidget {
  DepartementDetailsPage({Key? key, required this.departement }): super(key: key);

  final Departement departement;

  var list_category = [
    "France",
    "Espagne",
    "Chicken",
    "Pork",
    "Beef",
  ];

  var list_departement = [
    "Popular",
    "Vegetables",
    "Fruits",
    "Meat",
  ];

  var list = [
    Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5, "Popular", "test"),
    Product("Cerise", 2.4, "Popular", "test"),
    Product("Mangue", 2.4, "Popular", "test"),
    Product("Carotte", 2.4, "Vegetables", "test"),
    Product("Tomate", 2.4, "Vegetables", "test"),
    Product("Orange", 2.4, "Popular", "test")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: departement.name,
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list_category.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(list_category[index]),
                      ))),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DepartementCategoryPage(
                                departement: departement,
                              )),
                    );
                  },
                );
              },
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
                    physics: const NeverScrollableScrollPhysics(),
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
                            departement: departement,
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
        ])));
  }
}
