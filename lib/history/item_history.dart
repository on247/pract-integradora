import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/models/product_cart.dart';

class ItemHistory extends StatefulWidget {
  final ProductHistoryEntry item;
  final ProductWishlist wishList;
  final ProductCart cart;
  ItemHistory({
    Key key,
    @required this.item,
    @required this.wishList,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemHistoryState createState() => _ItemHistoryState();
}

class _ItemHistoryState extends State<ItemHistory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                        width: MediaQuery.of(context).size.width / 2,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.item.purchaseDate.toLocal()}",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text("${widget.item.totalProducts} Productos",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Expanded(child: Container()),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: Text(
                                    "\$ ${widget.item.totalPrice.toInt()}",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
