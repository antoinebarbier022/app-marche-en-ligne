part of '../_pages.dart';

/// Page qui affiche tous les produits contenue dans une catégorie appartenant à un département.

class DepartementCategoryPage extends StatelessWidget {
  DepartementCategoryPage({Key? key, required this.departement, required this.category})
      : super(key: key);

  final Departement departement;
  final Category category;

  @override
  Widget build(BuildContext context) {
    final productsBloc = BlocProvider.of<ProductBloc>(context);
    productsBloc.add(GetAllProducts());

    return Scaffold(
        appBar: AppBarCustom(
          title: departement.name,
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              var listProduct = state.products.where((i) =>
                                          (i.departement ==
                                          departement.name) && (i.category ==
                                          category.name) )
                                      .toList();
              return GridView.builder(
                itemCount: listProduct.length,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // On affiche 3 catégories par lignes
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: listProduct[index]);
                },
              );
            } else {
              return const Center(child: Text("Is Empty."));
            }
          },
        ));
  }
}
