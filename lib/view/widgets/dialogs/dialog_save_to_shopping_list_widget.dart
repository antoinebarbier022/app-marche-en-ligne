part of '../_widgets.dart';

class ModalAddToShoppingList extends StatefulWidget {
  const ModalAddToShoppingList({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ModalAddToShoppingList> createState() => _ModalAddToShoppingListState();
}

class _ModalAddToShoppingListState extends State<ModalAddToShoppingList> {
  String? _shoppingListSelected = "";

  @override
  Widget build(BuildContext context) {
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
          const Text('Add to shopping list'),
        ],
      ),
      content: BlocBuilder<ShoppingListBloc, ShoppingListState>(
        builder: (context, state) {
          if (state is ShoppingListLoadSuccess) {
            return Container(
              width: 300.0,
              decoration: BoxDecoration(
                //color: Colors.lightGreen.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RadioListTile<String>(
                      title: Text(state.list[index].name),
                      value: state.list[index].name,
                      groupValue: _shoppingListSelected,
                      onChanged: (String? value) {
                        setState(() {
                          _shoppingListSelected = state.list[index].name;
                        });
                      },
                      selected: state.list[index].name == _shoppingListSelected,
                      selectedTileColor: Colors.grey.withOpacity(0.1),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 2,
                    );
                  }),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: _shoppingListSelected!.isEmpty ? null : () {
            BlocProvider.of<ShoppingListBloc>(context)
              .add(ShoppingListProductAdded(_shoppingListSelected!, widget.product));
            // si on veut fermer la fenetre de dialogue avant d'ouvrir l'autre
            Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Vous avez ajouté [ 1 x ${widget.product.name} ] dans la liste [ $_shoppingListSelected ].')));
                          
          },
          child: const Text('Done'),
        ),
        ElevatedButton(
          onPressed: () {
            // si on veut fermer la fenetre de dialogue avant d'ouvrir l'autre
            //Navigator.pop(context);
            showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  const ModalAddNewShoppingList(),
            );
          },
          child: const Text('New shopping list'),
        ),
      ],
    );
  }
}
