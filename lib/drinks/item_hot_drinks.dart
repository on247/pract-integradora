import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  final ProductWishlist wishList;
  final ProductCart cart;
  ItemHotDrinks(
      {Key key,
      @required this.drink,
      @required this.wishList,
      @required this.cart})
      : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  void openItemPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemHotDrinksDetails(
            drink: widget.drink,
            cart: widget.cart,
            wishList: widget.wishList,
          );
        },
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openItemPage,
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
                                  "Café",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "${widget.drink.productTitle}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(color: Colors.white),
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: Text(
                                    "\$ ${widget.drink.productPrice.toInt()}",
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
                                    widget.drink.productImage,
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
                          color: widget.wishList.productExistsByName(
                                  widget.drink.productTitle)
                              ? Colors.white
                              : PRIMARY_TEXT),
                      onPressed: () {
                        setState(() {
                          if (!widget.wishList
                              .productExistsByName(widget.drink.productTitle)) {
                            widget.wishList.addProductDrink(widget.drink);
                          } else {
                            widget.wishList
                                .removeItemByName(widget.drink.productTitle);
                          }
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
