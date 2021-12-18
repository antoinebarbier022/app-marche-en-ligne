part of '../_widgets.dart';


class ModalConfirmDeleteShoppingList extends StatelessWidget {
 const ModalConfirmDeleteShoppingList({
    Key? key, required this.shoppingList,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final shoppingList;

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
           const Text("Want to delete ?"),
        ],
      ),
      content: Text("Are you sure you want to remove '${shoppingList.name}'?"),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // si on veut fermer la fenetre de dialogue avant d'ouvrir l'autre
              //Navigator.pop(context);
              // Suppression de la liste
          BlocProvider.of<ShoppingListBloc>(context)
              .add(ShoppingListDeleted(shoppingList: shoppingList, idUser: (user == null ? "":user.email!)));
          // On ferme le popup
          Navigator.pop(context);
          // On revient à la page précédente
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Vous avez supprimé la liste "${shoppingList.name}".')));
              
            },
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
