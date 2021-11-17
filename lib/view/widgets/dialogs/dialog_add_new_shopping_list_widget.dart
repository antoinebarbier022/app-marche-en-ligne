part of '../_widgets.dart';


class ModalAddNewShoppingList extends StatelessWidget {
  const ModalAddNewShoppingList({
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
          const Text('New shopping list'),
        ],
      ),
      content: const TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Shopping List',
        ),
      ),
      actions: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
