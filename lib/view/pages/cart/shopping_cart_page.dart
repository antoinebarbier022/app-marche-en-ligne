part of '../_pages.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

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

        // On recupérer le panier de l'utilisateur
        body: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            // Indicateur de chargement
            if (state is ShopLoadInProgress) {
              return const Center(child: CircularProgressIndicator());

              // Si le panier est chargé alors
            } else if (state is ShopLoadSuccess) {
              // Si le panier n'est pas vide on affiche la liste des items
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
                  // ligne de séparation des items
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                );
              } else {
                // Le panier est vide
                return Center(
                    child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 120), // equivalant à la taille du footer + 50
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/illustrations/EmptyCart.png',
                        width: 200,
                        fit: BoxFit.scaleDown,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Shopping Cart is Empty.", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ));
              }
            } else {
              // une erreur est survenue
              return const Center(child: Text("Error."));
            }
          },
        ),
        // Bas de page (fixe) qui informe l'utilisateur du prix total du panier + accès au checkout
        bottomSheet: Container(
            width: double.infinity,
            height: 70,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Texte qui affiche le prix total du panier
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  state is ShopLoadSuccess
                                      ? "${state.cart.getTotalPrice().toStringAsFixed(2)}€"
                                      : "0€",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Total price",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade600),
                              )
                            ]),
                        // Bouton pour accéder au checkout
                        
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            child: const Text("Checkout"),
                            onPressed: (state is ShopLoadSuccess)
                                      ? 
                                      (state.cart.items.isEmpty ? null : () {})
                                      : null,
                          ),
                        ),
                      ]);
                },
              ),
            )));
  }
}
