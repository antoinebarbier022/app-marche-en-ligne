import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme.dart';
import 'view/pages/_pages.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}*/

void main() {
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
          create: (BuildContext context) => ProductBloc(),
        ),
        // Departemnt Bloc
        BlocProvider<DepartementBloc>(
          create: (BuildContext context) => DepartementBloc(),
        ),
        //Shop Bloc (cart)
        BlocProvider<ShopBloc>(
          create: (BuildContext context) => ShopBloc(),
        ),
        // ShoppingList Bloc
        BlocProvider<ShoppingListBloc>(
          create: (BuildContext context) => ShoppingListBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Online Market',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.primaryColor,
          //scaffoldBackgroundColor: Colors.grey[50]
        ),
        home: HomePage(title: 'Online Market'),
      ),
    );
  }
}
