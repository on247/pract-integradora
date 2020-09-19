import 'package:flutter/material.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  final ProductWishlist wishList;
  GrainsPage({
    Key key,
    @required this.grainsList,
    @required this.wishList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grainsList[index],
            wishList: wishList,
          );
        },
      ),
    );
  }
}
