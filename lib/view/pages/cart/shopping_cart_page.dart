part of '../_pages.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  var list = [
    Product("Pomme", 2.4, "Popular", "test"),
    Product("Banane", 5, "Popular", "test"),
    Product("Cerise", 2.4, "Popular", "test"),
    Product("Mangue", 2.4, "Popular", "test"),
    Product("Carotte", 2.4, "Vegetables", "test"),
    Product("Tomate", 2.4, "Vegetables", "test"),
    Product("Orange", 2.4, "Popular", "test")
  ];

  @override
  Widget build(BuildContext context) {
    final shopBloc = BlocProvider.of<ShopBloc>(context);
    shopBloc.add(ShopLoaded());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Shopping Cart"),
          automaticallyImplyLeading: true,
        ),
        body: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            print(state);
            if (state is ShopLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShopLoadSuccess) {
              if (state.cart.items.isNotEmpty) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 70),
                  itemCount: state.cart.items.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      product: state.cart.items[index].product,
                      quantity: state.cart.items[index].quantity,
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
                );
              } else {
                return const Center(child: Text("Is Empty."));
              }
            } else {
              return const Center(child: Text("Error."));
            }
          },
        ),
        bottomSheet: Container(
            width: double.infinity,
            height: 70,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children:  [
                            const Text("Total price"), 
                            Text(state is ShopLoadSuccess ? "${state.cart.getTotalPrice()}€" : "0€")],
                        ),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            child: const Text("Checkout"),
                            onPressed: () => null,
                          ),
                        ),
                      ]);
                },
              ),
            )));
  }
}
