import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/wishlist/item_wishlist.dart';

class WishlistPage extends StatefulWidget {
  final ProductWishlist wishlist;
  WishlistPage({Key key, @required this.wishlist}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  void onItemDelete() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de deseos"),
      ),
      body: ListView.builder(
        itemCount: widget.wishlist.productList().length,
        itemBuilder: (BuildContext context, int index) {
          return ItemWishlist(
              onItemDelete: onItemDelete,
              wishlist: widget.wishlist,
              listItem: widget.wishlist.products[index]);
        },
      ),
    );
  }
}
