part of '../_widgets.dart';

class ModalAddToShoppingList extends StatelessWidget {
  const ModalAddToShoppingList({
    Key? key,
  }) : super(key: key);

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
      content: setupAlertDialoadContainer(),
      actions: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
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
        ),
      ],
    );
  }
}

// shopping list à afficher dans la fenetre de dialog
Widget setupAlertDialoadContainer() {
  return BlocBuilder<ShoppingListBloc, ShoppingListState>(
    builder: (context, state) {
      if (state is ShoppingListLoadSuccess) {
        return Container(
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: state.list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.list[index].name),
                trailing: const Radio(
                  value: 1,
                  groupValue: true,
                  onChanged: null,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey[300],
                thickness: 1,
              );
            },
          ),
        );
      }else{
        return const Text("Error");
      }
    },
  );
}
