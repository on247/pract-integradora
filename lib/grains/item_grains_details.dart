import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/cart/cart.dart';

import 'package:estructura_practica_1/payment.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grain;
  final ProductWishlist wishList;
  final ProductCart cart;
  ItemGrainsDetails({
    Key key,
    @required this.grain,
    @required this.wishList,
    @required this.cart,
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Profile(wishlist: widget.wishList, cart: widget.cart),
      appBar: AppBar(
        title: Text(widget.grain.productTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Cart(wishlist: widget.wishList, cart: widget.cart);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(48.0),
                          child: AspectRatio(
                            aspectRatio: 1.2,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [ACCENT_DARK, ACCENT],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Center(
                                      child: Image.network(
                                          widget.grain.productImage),
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 4,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color: widget.wishList
                                                .productExistsByName(
                                                    widget.grain.productTitle)
                                            ? Colors.white
                                            : PRIMARY_TEXT,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (!widget.wishList
                                              .productExistsByName(
                                                  widget.grain.productTitle)) {
                                            widget.wishList
                                                .addProductGrain(widget.grain);
                                          } else {
                                            widget.wishList.removeItemByName(
                                                widget.grain.productTitle);
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
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Text(
                      widget.grain.productTitle,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: PRIMARY_TEXT,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 60, 0),
                    child: Text(widget.grain.productDescription,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 60, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TAMAÑOS DISPONIBLES"),
                        Text(
                          "\$ ${widget.grain.productPrice}",
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: widget.grain.productWeight ==
                                      ProductWeight.CUARTO
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.grain.productWeight =
                                    ProductWeight.CUARTO;
                                widget.grain.productPrice =
                                    widget.grain.productPriceCalculator();
                              });
                            },
                            textColor: widget.grain.productWeight ==
                                    ProductWeight.CUARTO
                                ? Colors.deepPurple
                                : Colors.black,
                            child: Text("250 G"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: widget.grain.productWeight ==
                                      ProductWeight.KILO
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.grain.productWeight = ProductWeight.KILO;
                                widget.grain.productPrice =
                                    widget.grain.productPriceCalculator();
                              });
                            },
                            textColor:
                                widget.grain.productWeight == ProductWeight.KILO
                                    ? Colors.deepPurple
                                    : Colors.black,
                            child: Text("KILO"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            if (!widget.cart.productExistsByName(
                                widget.grain.productTitle)) {
                              widget.cart.addProductGrain(widget.grain);
                            } else {
                              widget.cart
                                  .removeItemByName(widget.grain.productTitle);
                            }
                          });
                        },
                        child: Text(widget.cart
                                .productExistsByName(widget.grain.productTitle)
                            ? "AGREGADO AL CARRITO"
                            : "AGREGAR AL CARRITO"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                widget.cart.addProductGrain(widget.grain);
                                return PaymentPage(
                                  type: PaymentType.PAY_ITEM,
                                  wishList: widget.wishList,
                                  cart: widget.cart,
                                  product: widget.cart.getItemByName(
                                    widget.grain.productTitle,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Text("COMPRAR AHORA"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
