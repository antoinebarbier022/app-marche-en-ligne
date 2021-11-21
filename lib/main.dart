import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buisness_logic/bloc/departement_bloc.dart';
import 'buisness_logic/bloc/product_bloc.dart';
import 'buisness_logic/bloc/shop_bloc.dart';
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
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
        BlocProvider<DepartementBloc>(
          create: (BuildContext context) => DepartementBloc(),
        ),
        BlocProvider<ShopBloc>(
          create: (BuildContext context) => ShopBloc(),
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
