part of '../_widgets.dart';

class ModalAddNewShoppingList extends StatefulWidget {
  const ModalAddNewShoppingList({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalAddNewShoppingList> createState() =>
      _ModalAddNewShoppingListState();
}

class _ModalAddNewShoppingListState extends State<ModalAddNewShoppingList> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: AlertDialog(
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
        content: TextFormField(
          controller: _controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Shopping List',
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<ShoppingListBloc>(context).add(
                      ShoppingListAdded(ShoppingList(_controller.text, [])));
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
