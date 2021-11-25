part of '../_pages.dart';

class ShoppingListDetailsPage extends StatelessWidget {
  const ShoppingListDetailsPage({Key? key, required this.shoppingList})
      : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: shoppingList.name,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.mode_edit_outline_outlined),
                        label: const Text("Edit"),
                        onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                ModalEditShoppingList(
                                  shoppingList: shoppingList,
                                )),
                      ),
                    ),
                  ),
                  // Bouton supprimer la liste
                  RemoveButton(shoppingList: shoppingList),
                ],
              ),
              BlocBuilder<ShoppingListBloc, ShoppingListState>(
                builder: (context, state) {
                  if (state is ShoppingListLoadSuccess) {
                    int indexCurrentShoppingList =
                        state.list.indexOf(shoppingList);
                    if (indexCurrentShoppingList >= 0  && state
                        .list[indexCurrentShoppingList].products.isNotEmpty) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state
                            .list[indexCurrentShoppingList].products.length,
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductItem(
                              product: state.list[indexCurrentShoppingList]
                                  .products[index]);
                        },
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/illustrations/Nothing.png',
                              width: 200,
                              fit: BoxFit.scaleDown,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "This Shopping List is Empty.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return const Text("Loading ...");
                  }
                },
              ),
            ],
          ),
        ));
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
    required this.shoppingList,
  }) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.delete_outline),
        label: const Text("Remove"),
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => ModalConfirmDeleteShoppingList(
                  shoppingList: shoppingList,
                )),
      ),
    );
  }
}
