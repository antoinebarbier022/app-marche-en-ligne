part of '../_widgets.dart';

class ModalEditShoppingList extends StatelessWidget {
  const ModalEditShoppingList({
    Key? key,
    required this.shoppingList,
  }) : super(key: key);

  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    return AlertDialog(
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.only(left: 20, right: 20),
      actionsPadding: const EdgeInsets.all(10),
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Text('Edit shopping list'),
        ],
      ),
      content: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          if (state is ShoppingListLoadSuccess) {
            int indexCurrentShoppingList = state.list.indexOf(shoppingList);
            return Container(
              width: 300.0,
              decoration: BoxDecoration(
                //color: Colors.lightGreen.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(

                  shrinkWrap: true,
                  itemCount: state.list[indexCurrentShoppingList]!.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var productElement = state.list[indexCurrentShoppingList]!.products[index];
                    return ListTile(
                      title: Text(productElement!.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // si il reste un élément et qu'on clique pour le supprimer on sort de la page
                          if(state.list[indexCurrentShoppingList]!.products.length == 1){
                            Navigator.of(context).pop();
                          }
                          BlocProvider.of<ShoppingListBloc>(context).add(
                              ShoppingListProductDeleted(
                                  shoppingListName: shoppingList.name,
                                  product: productElement,
                                  idUser: (user == null ? "":user.email!)));
                        },
                      ),
                    );
                    

                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 0,
                      thickness: 1,
                    );
                  }),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
      actions: const [],
    );
  }
}
