part of '../_pages.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  // ignore: no_logic_in_create_state
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity <= 0) {
        _quantity = 0;
      } else {
        _quantity--;
      }
    });
  }

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
            Text(widget.product.name, style: const TextStyle(fontSize: 18)),
            Text("${widget.product.price}€",
                style: const TextStyle(fontWeight: FontWeight.bold)),
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
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: const TextSpan(
                                    text:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel ligula non dolor volutpat dignissim. Ut vel tempor velit, quis vestibulum ante. Fusce eleifend tempus imperdiet. Mauris consequat interdum iaculis. Maecenas at hendrerit est, id pulvinar mauris. Nullam vel malesuada arcu. Aliquam sit amet nunc ac risus blandit elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam molestie massa lacus, ac lacinia odio ultricies id. Suspendisse vel augue nec libero condimentum commodo et a purus. Etiam massa odio, eleifend in imperdiet nec, posuere eget arcu. Nulla sollicitudin massa et nulla eleifend ullamcorper.",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
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
        bottomSheet: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
if ((state is ShopLoadSuccess) ) {
            bool productIsInCart = state.cart.items.any((item) => item.product.name == widget.product.name);
            // si le produit n'est pas dans le panier
            if (!productIsInCart ) {
              return Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.grey[200],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.remove)),
                              onTap: () {
                                _decrementQuantity();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("${_quantity.toInt()}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Icon(Icons.add)),
                              onTap: () {
                                _incrementQuantity();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          child: const Text("Add to cart"),
                          onPressed: () {
                            BlocProvider.of<ShopBloc>(context).add(
                                ItemAdded(Item(widget.product, _quantity)));
                            
                          },
                        ),
                      )
                    ],
                  ));
            } else {
              
              return Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            
                            child: const Text("Already choosen ! See cart"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingCartPage(
                                          title: '',
                                        )),
                              );
                            },
                          ),
                        ),
                  ));
            }}else{
              return Container();
            }
          },
        ));
  }
}
