import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDesserts dessert;
  final ProductWishlist wishList;
  ItemDesserts({
    Key key,
    @required this.dessert,
    @required this.wishList,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 4,
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
                                  "${widget.dessert.productTitle}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: Text(
                                    "\$ ${widget.dessert.productPrice.toInt()}",
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
                                    widget.dessert.productImage,
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
                      icon: Icon(Icons.thumb_up,
                          color: widget.dessert.liked
                              ? Colors.white
                              : PRIMARY_TEXT),
                      onPressed: () {
                        setState(() {
                          if (!widget.dessert.liked) {
                            widget.wishList.addProductDessert(widget.dessert);
                          } else {
                            widget.wishList
                                .removeItemByName(widget.dessert.productTitle);
                          }
                          widget.dessert.liked = !widget.dessert.liked;
                        });
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
