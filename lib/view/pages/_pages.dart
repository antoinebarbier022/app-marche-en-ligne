import 'package:app_market_online/buisness_logic/bloc_category/category_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_shop/shop_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_departement/departement_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_product/product_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_shopping_list/shopping_list_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_shopping_list/shopping_list_bloc.dart';
import 'package:app_market_online/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/view/widgets/_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// Home
part 'home/home_page.dart';

// Product
part 'product/product_detail_page.dart';

// Cart
part 'cart/shopping_cart_page.dart';

// Departement
part 'departement/store_departements_page.dart';
part 'departement/departement_details_page.dart';
part 'departement/departement_category_page.dart';

// Shopping List
part 'shoppingList/shopping_lists_page.dart';
part 'shoppingList/shopping_list_details_page.dart';

// errors
part 'errors/building_page.dart';

// Authentification
part 'auth/authenticate.dart';
part 'auth/sign_in.dart';