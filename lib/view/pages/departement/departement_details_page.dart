part of '../_pages.dart';

class DepartementDetailsPage extends StatelessWidget {
  DepartementDetailsPage({Key? key, required this.departement})
      : super(key: key);

  final Departement departement;

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc.add(GetAllProducts());

    final departementsBloc = BlocProvider.of<DepartementBloc>(context);
    departementsBloc.add(GetAllDepartements());

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
              itemCount: departement.categories.length,
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
                        child: Text(departement.categories[index].name),
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
              builder: (context, productsState) {
            if (productsState is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (productsState is ProductsLoaded) {
              return SizedBox(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: departement.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CollectionList(
                        id: '',
                        title: departement.categories[index].name,
                        listProduct: productsState.products
                            .where((i) =>
                                i.category ==
                                departement.categories[index].name)
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
          })
        ])));
  }
}
