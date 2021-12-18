import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'buisness_logic/bloc_category/category_bloc.dart';
import 'buisness_logic/bloc_departement/departement_bloc.dart';
import 'buisness_logic/bloc_product/product_bloc.dart';
import 'buisness_logic/bloc_shop/shop_bloc.dart';
import 'buisness_logic/bloc_shopping_list/shopping_list_bloc.dart';
import 'config/theme.dart';
import 'data/repositories/_repositories.dart';
import 'view/pages/_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Product Bloc
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(ProductRepository()),
        ),
        // Departement Bloc
        BlocProvider<DepartementBloc>(
          create: (BuildContext context) =>
              DepartementBloc(DepartementRepository()),
        ),
        // Category Bloc Bloc
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => CategoryBloc(CategoryRepository()),
        ),
        //Shop Bloc (cart)
        BlocProvider<ShopBloc>(
          create: (BuildContext context) => ShopBloc(CartRepository()),
        ),
        // ShoppingList Bloc
        BlocProvider<ShoppingListBloc>(
          create: (BuildContext context) => ShoppingListBloc(ShoppingListRepository()),
        ),


      ],
      child: MaterialApp(
          title: 'Online Market',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: AppColors.primaryColor,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: AppColors.primaryColor,
              indicatorColor: AppColors.primaryColor,
              bottomSheetTheme:
                  BottomSheetThemeData(backgroundColor: Colors.grey[800])),
          home: StreamProvider<UserModel?>.value(
            value: AuthService().user,
            initialData: null, // il n'est pas authentifier
            child: const HomePage(title: 'Online Market'),
          )),
    );
  }
}