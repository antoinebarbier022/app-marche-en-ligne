part of '../_pages.dart';

class ShoppingListsPage extends StatelessWidget {
  ShoppingListsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    [
      Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
    ],
    [
      Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(
          title: title,
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                width:double.infinity,
                padding: const EdgeInsets.all(10),
                child: TextButton.icon(
                  
                  icon: const Icon(Icons.add),
                  label: const Text("Add new Shopping list"),
                  onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          const ModalAddNewShoppingList(),
                    ),
                ),
              ),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CollectionList(
                        id: '',
                        isShopingList: true,
                        title: "Category",
                        listProduct: list[index],
                        link: ShoppingListDetailsPage(
                          title: 'Category',
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 20,
                      thickness: 1,
                    );
                  },
                ),
              ),
            ])));
  }
}
