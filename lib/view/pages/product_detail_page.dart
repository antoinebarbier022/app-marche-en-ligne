part of '_pages.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Product Detail"),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.playlist_add),
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          const ModalAddToShoppingList(),
                    ))
          ],
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Product X", style: TextStyle(fontSize: 18)),
            const Text("Price €",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("per lb"),
            const SizedBox(
              height: 40,
            ),
            DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TabBar(
                        labelColor: Theme.of(context).primaryColor,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text: 'Details'),
                          Tab(text: 'Nutrition'),
                          Tab(text: 'Related'),
                        ],
                      ),
                      Container(
                          height: 300, //height of TabBarView
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: const Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel ligula non dolor volutpat dignissim. Ut vel tempor velit, quis vestibulum ante. Fusce eleifend tempus imperdiet. Mauris consequat interdum iaculis. Maecenas at hendrerit est, id pulvinar mauris. Nullam vel malesuada arcu. Aliquam sit amet nunc ac risus blandit elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam molestie massa lacus, ac lacinia odio ultricies id. Suspendisse vel augue nec libero condimentum commodo et a purus. Etiam massa odio, eleifend in imperdiet nec, posuere eget arcu. Nulla sollicitudin massa et nulla eleifend ullamcorper.'),
                            ),
                            Container(
                              child: const Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: const Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]))
                    ])),
          ],
        ))),
        bottomSheet: Container(
            width: double.infinity,
            height: 50,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      child: const Icon(Icons.remove),
                      onPressed: () => null,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("1",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                      child: const Icon(Icons.add),
                      onPressed: () => null,
                    ),
                  ],
                ),
                ElevatedButton(
                  child: const Text("Add to cart"),
                  onPressed: () => null,
                )
              ],
            )));
  }
}

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

// shopping list à afficher dans la fenetre de dialog
Widget setupAlertDialoadContainer() {
  var shoppinglist = ["Weekend Shopping list", "Favorites List"];
  return Container(
    width: 300.0,
    decoration: BoxDecoration(
      color: Colors.lightGreen.shade50,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListView.separated(
      shrinkWrap: true,
      itemCount: shoppinglist.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(shoppinglist[index]),
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
}
