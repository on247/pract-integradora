import 'dart:developer';

import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class ItemWishlist extends StatefulWidget {
  final ProductWishlist wishlist;
  final GenericProduct listItem;
  Function onItemDelete;
  ItemWishlist({
    Key key,
    @required this.wishlist,
    @required this.listItem,
    @required this.onItemDelete,
  }) : super(key: key);

  @override
  _ItemWishlistState createState() => _ItemWishlistState();
}

class _ItemWishlistState extends State<ItemWishlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ITEM_BACKGROUND_DARK,
                  spreadRadius: -3,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Card(
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Grano",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "${widget.listItem.name}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: Text(
                                    "\$ ${widget.listItem.price}",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 48, 8),
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Image.network(
                                    widget.listItem.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.delete, color: PRIMARY_TEXT),
                      onPressed: () {
                        widget.wishlist.removeItem(widget.listItem);
                        widget.onItemDelete();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
