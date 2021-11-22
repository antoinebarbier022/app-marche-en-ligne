part of '../_widgets.dart';


class ModalConfirmDelete extends StatelessWidget {
 const ModalConfirmDelete({
    Key? key, required this.stringDataToDelete,
  }) : super(key: key);

  final stringDataToDelete;

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
           Text("Want to delete '$stringDataToDelete'?"),
        ],
      ),
      content: Text("Are you sure you want to remove '$stringDataToDelete'?"),
      actions: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // si on veut fermer la fenetre de dialogue avant d'ouvrir l'autre
              //Navigator.pop(context);
              
            },
            child: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
