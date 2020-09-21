import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class ItemDessertsDetails extends StatefulWidget {
  final ProductDesserts dessert;
  final ProductWishlist wishList;
  ItemDessertsDetails({
    Key key,
    @required this.dessert,
    @required this.wishList,
  }) : super(key: key);

  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dessert.productTitle),
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
                                          widget.dessert.productImage),
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 4,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color: widget.dessert.liked
                                            ? Colors.white
                                            : PRIMARY_TEXT,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.dessert.liked =
                                              !widget.dessert.liked;
                                          widget.wishList.addProductDessert(
                                              widget.dessert);
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
                      widget.dessert.productTitle,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: PRIMARY_TEXT,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 60, 0),
                    child: Text(widget.dessert.productDescription,
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
                          "\$ ${widget.dessert.productPrice}",
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
                              color:
                                  widget.dessert.productSize == DessertSize.CH
                                      ? Colors.deepPurple
                                      : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.dessert.productSize = DessertSize.CH;
                                widget.dessert.productPrice =
                                    widget.dessert.productPriceCalculator();
                              });
                            },
                            textColor:
                                widget.dessert.productSize == DessertSize.CH
                                    ? Colors.deepPurple
                                    : Colors.black,
                            child: Text("Chico"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: widget.dessert.productSize == DessertSize.M
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.dessert.productSize = DessertSize.M;
                                widget.dessert.productPrice =
                                    widget.dessert.productPriceCalculator();
                              });
                            },
                            textColor:
                                widget.dessert.productSize == DessertSize.M
                                    ? Colors.deepPurple
                                    : Colors.black,
                            color: Colors.amber,
                            child: Text("Mediano"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: widget.dessert.productSize == DessertSize.G
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.dessert.productSize = DessertSize.G;
                                widget.dessert.productPrice =
                                    widget.dessert.productPriceCalculator();
                              });
                            },
                            textColor:
                                widget.dessert.productSize == DessertSize.G
                                    ? Colors.deepPurple
                                    : Colors.black,
                            child: Text("Grande"),
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
                        onPressed: () {},
                        child: Text("AGREGAR AL CARRITO"),
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
                        onPressed: () {},
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
