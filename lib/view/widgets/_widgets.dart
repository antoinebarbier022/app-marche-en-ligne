// Ici on place les imports des widgets
import 'package:app_market_online/buisness_logic/bloc_product/product_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_shop/shop_bloc.dart';
import 'package:app_market_online/buisness_logic/bloc_shopping_list/shopping_list_bloc.dart';
import 'package:app_market_online/data/models/_models.dart';
import 'package:app_market_online/view/pages/_pages.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_market_online/services/auth.dart';
import 'package:provider/provider.dart';

// generals
part 'appbar_widget.dart';
part 'sidebar_widget.dart';
part 'image_product_network_widget.dart';

// items
part 'items/shopping_item_widget.dart';
part 'items/product_item_widget.dart';
part 'items/cart_item_widget.dart';
part 'items/departement_item_widget.dart';

// lists
part 'list_widget.dart';

// dialogs
part 'dialogs/dialog_add_new_shopping_list_widget.dart';
part 'dialogs/dialog_save_to_shopping_list_widget.dart';
part 'dialogs/dialog_edit_shopping_list_widget.dart';
part 'dialogs/dialog_confirm_delete_shopping_list_widget.dart';
