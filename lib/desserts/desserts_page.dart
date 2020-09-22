import 'package:estructura_practica_1/profile.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/cart/cart.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDesserts> dessertsList;
  final ProductWishlist wishList;
  final ProductCart cart;
  DessertsPage({
    Key key,
    @required this.dessertsList,
    @required this.wishList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Profile(wishlist: wishList, cart: cart),
      appBar: AppBar(
        title: Text("Postres"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Cart(wishlist: wishList, cart: cart);
                  },
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            wishList: wishList,
            cart: cart,
            dessert: dessertsList[index],
          );
        },
      ),
    );
  }
}
