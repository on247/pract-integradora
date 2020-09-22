import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  final ProductWishlist wishList;
  final ProductCart cart;

  HotDrinksPage({
    Key key,
    @required this.drinksList,
    @required this.wishList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemHotDrinks(
              drink: drinksList[index], cart: cart, wishList: wishList);
        },
      ),
    );
  }
}
