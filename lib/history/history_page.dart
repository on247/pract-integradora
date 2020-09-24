import 'package:estructura_practica_1/history/item_history.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/cart/cart.dart';

class HistoryPage extends StatelessWidget {
  final ProductWishlist wishList;
  final ProductCart cart;
  HistoryPage({
    Key key,
    @required this.wishList,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Profile(wishlist: wishList, cart: cart),
      appBar: AppBar(
        title: Text("Historial de compra"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Home(
                      title: APP_TITLE,
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: this.cart.getHistory().length,
        itemBuilder: (BuildContext context, int index) {
          return ItemHistory(
            item: this.cart.getHistory()[index],
            cart: cart,
            wishList: wishList,
          );
        },
      ),
    );
  }
}
