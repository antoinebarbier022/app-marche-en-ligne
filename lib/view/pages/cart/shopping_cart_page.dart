part of '../_pages.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Product("pomme", 2.4, Colors.green[100]),
    Product("banane", 5, Colors.yellow[200]),
    Product("cerise", 2.4, Colors.red[200]),
    Product("mangue", 2.4, Colors.yellow[200]),
    Product("orange", 2.4, Colors.orange[200])
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