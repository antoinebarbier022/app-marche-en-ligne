// Ici on place les imports des data_providers
import 'package:app_market_online/data/models/_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


part 'product_provider.dart';
part 'departement_provider.dart';
part 'category_provider.dart';
part 'cart_provider.dart';

// on déclare la base de donnée en variable globale
final FirebaseFirestore firestore = FirebaseFirestore.instance;