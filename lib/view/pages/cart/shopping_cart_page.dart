part of '../_pages.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5,  "Popular", "test"),
    Product("Cerise", 2.4,  "Popular", "test"),
    Product("Mangue", 2.4,  "Popular", "test"),
    Product("Carotte", 2.4,  "Vegetables", "test"),
    Product("Tomate", 2.4,  "Vegetables", "test"),
    Product("Orange", 2.4,  "Popular", "test")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Shopping Cart"),
          automaticallyImplyLeading: true,
        ),
        body: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 70),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CartItem(
              title: list[index].name,
              price: list[index].price,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 0,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            );
          },
        ),
        bottomSheet: Container(
            width: double.infinity,
            height: 70,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Column(
                  children: const [Text("Total price"), Text("32€")],
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    child: const Text("Checkout"),
                    onPressed: () => null,
                  ),
                ),
              ]),
            )));
  }
}
