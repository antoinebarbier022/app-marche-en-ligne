part of '../_pages.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product? product;

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
      if (_quantity <= 1) {
        _quantity = 1;
      } else {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(
          title: "Product Detail",
        ),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white, //Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.all(5),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ImageNetworkProduct(
                      url: widget.product!.urlImage,
                    )),
              ),

              // Section content
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100], //Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, -4), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 20.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                              "€${widget.product!.price.toStringAsPrecision(3)}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark)),
                        ),

                        // Ajout du produit dans une liste
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 13, top: 13, bottom: 13),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.playlist_add,
                            ),
                          ),
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                ModalAddToShoppingList(
                              product: widget.product,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Nom du produit
                    Text(widget.product!.name,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w900)),
                    Text(widget.product!.departement,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 10,
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
                                  height: 200, //height of TabBarView
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 0.5))),
                                  child: TabBarView(children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                            text: widget.product!.description.isNotEmpty ? widget.product!.description : "Aucune description.",
                                            style: TextStyle(
                                                color: Colors.grey.shade800,
                                                height: 1.3),
                                          ),
                                        )),
                                    const Center(
                                      child: Text('Not yet implemented.',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Center(
                                      child: Text('Not yet implemented.',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ]))
                            ])),
                  ],
                ),
              ),
            ],
          ),
        )),
        bottomSheet: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            if ((state is ShopLoadSuccess)) {
              return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white, //Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, -4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.remove, color: Theme.of(context).primaryColorDark)),
                            onTap: () {
                              _decrementQuantity();
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text("${_quantity.toInt()}",
                                style:  TextStyle(
                                  color: Colors.grey.shade800,
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          InkWell(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.add, color: Colors.white)),
                            onTap: () {
                              _incrementQuantity();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: const Text("Add to cart"),
                          onPressed: () {
                            BlocProvider.of<ShopBloc>(context).add(
                                ItemAdded(Item(widget.product, _quantity)));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Vous avez ajouté [ ${_quantity.toInt()} x ${widget.product!.name} ] dans votre panier.')));
                          },
                        ),
                      )
                    ],
                  ));
            } else {
              return Container();
            }
          },
        ));
  }
}
