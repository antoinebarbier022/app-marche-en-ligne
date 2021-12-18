import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/data/repositories/_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;

  ProductBloc(this.repository) : super(ProductsInitial());
  ProductState get initialState => ProductsInitial();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetAllProducts) {
      // chargement des produits
      yield ProductsLoading();
      List<Product?> newState = await repository.getProductsList();
      /*[
        // vegetables
        Product(name: "Carotte", price: 2.4, departement: "Vegetables", category: "France", urlImage: "https://static.greenweez.com/images/products/119000/600/fruits-legumes-locaux-idf-bio-copie-produit-concombre-long-ile-de-france.jpg"),
        Product(name: "Tomate", price: 2.4, departement: "Vegetables", category: "France", urlImage: "https://img-3.journaldesfemmes.fr/jHMgoBkfJoViJ6FW4_bLUh_4Sfw=/1500x/smart/c56b0b2648d747c28d82300380c1a207/ccmcms-jdf/10523670.jpg"),
        Product(name: "Concombre", price: 2.4, departement: "Vegetables", category: "Espagne", urlImage: "https://www.biendecheznous.be/sites/default/files/ps_image/istock_komkommers.jpg"),
        Product(name: "Beterave", price: 2.4, departement: "Vegetables", category: "Espagne", urlImage: "https://jardinsdevartan.com/wp-content/uploads/2016/08/betterave-rouge-crue-jardins-de-vartan.jpg"),
        Product(name: "Avocat", price: 2.4, departement: "Vegetables", category: "France", urlImage: "https://www.atelierdeschefs.com/media/ingredient-e75-l-avocat.jpg"),
        Product(name: "Salade", price: 2.4, departement: "Vegetables", category: "France", urlImage: "https://www.plaineduroussillon.com/wp-content/uploads/2017/06/Salade.png"),
        Product(name: "Courgette", price: 2.4, departement: "Vegetables", category: "France", urlImage: "https://potager-vaivre.fr/wp-content/uploads/2020/04/maraichers-legume-vente-directe-besancon-06.jpg"),
        Product(name: "Poivron", price: 2.4, departement: "Vegetables", category: "Espagne", urlImage: "https://www.fondation-louisbonduelle.org/wp-content/uploads/2016/10/poivron_448084189.png"),
        Product(name: "Pommes de terre", price: 2.4, departement: "Vegetables", category: "France", urlImage: "https://mapetiteassiette.com/wp-content/uploads/2020/11/pomme-de-terre333-e1605184894919-800x592.jpg"),
        Product(name: "Choux", price: 2.4, departement: "Vegetables", category: "Espagne", urlImage: "https://static.greenweez.com/images/products/116000/600/fruits-legumes-du-marche-bio-choux-fleur-france.jpg"),
        // fruits
        Product(name: "Pomme", price: 2.4, departement: "Fruits", category: "France", urlImage: "https://fondationolo.ca/wp-content/uploads/2016/02/pommes.jpg"),
        Product(name: "Banane", price: 2.4, departement: "Fruits", category: "France", urlImage: "https://www.aprifel.com/wp-content/uploads/2019/02/banane.jpg"),
        Product(name: "Cerise", price: 2.4, departement: "Fruits", category: "Espagne", urlImage: "https://cdn-s-www.leprogres.fr/images/7A3E01B6-F689-4DCE-A173-A8A4EF72C832/NW_raw/photo-stock-adobe-com-1562264946.jpg"),
        Product(name: "Mangue", price: 2.4, departement: "Fruits", category: "Espagne", urlImage: "https://static.libertyprim.com/files/familles/mangue-large.jpg?1569271798"),
        // meats
        Product(name: "Jambon 100g", price: 2.4, departement: "Meat", category: "Pork", urlImage: "https://www.dangersalimentaires.com/wp-content/uploads/2018/02/tranches-de-jambon-listeria-1280x720.png"),
        Product(name: "Porc 200g", price: 2.4, departement: "Meat", category: "Pork", urlImage: "https://www.saint-vincentbio.com/wp-content/uploads/2016/11/tranche-fesse-porc-biologique.jpg"),
        Product(name: "Cote de Boeuf 100g", price: 2.4, departement: "Meat", category: "Beef", urlImage: "https://www.mabonneviande.com/6801/cote-de-boeuf-race-viande-sud-ouest-france.jpg"),
        Product(name: "Boeuf 200g", price: 2.4, departement: "Meat", category: "Beef", urlImage: "https://www.mabonneviande.com/6801/cote-de-boeuf-race-viande-sud-ouest-france.jpg"),
        Product(name: "Poulet 100g", price: 2.4, departement: "Meat", category: "Chicken", urlImage: "https://img-3.journaldesfemmes.fr/G5gSARARCFnGYvIEA9SE0rJdoFY=/1500x/smart/04e0cb38f29d48fb8e88390bba19304c/ccmcms-jdf/10661697.jpg"),
        Product(name: "Cuisse de poulet 200g", price: 2.4, departement: "Meat", category: "Chicken", urlImage: "https://thumbs.dreamstime.com/b/viande-de-poulet-32456382.jpg"),
        // Cheese
        Product(name: "Camembert", price: 2.4, departement: "Cheese", category: "France", urlImage: "https://www.lineaires.com/var/site/storage/images/_aliases/large/4/3/3/1/3751334-1-fre-FR/camembert%20extra%20fondant.jpg")
      ];*/
      yield ProductsLoaded(products: newState);
    } else {
      yield ProductsNotLoaded();
    }
  }
}
