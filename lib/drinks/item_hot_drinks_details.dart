import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  final ProductWishlist wishList;
  ItemHotDrinksDetails({
    Key key,
    @required this.drink,
    @required this.wishList,
  }) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.productTitle),
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
                                        widget.drink.productImage,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 4,
                                    top: 4,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color: widget.drink.liked
                                            ? Colors.white
                                            : PRIMARY_TEXT,
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            widget.drink.liked =
                                                !widget.drink.liked;
                                            widget.wishList
                                                .addProductDrink(widget.drink);
                                          },
                                        );
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
                      widget.drink.productTitle,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: PRIMARY_TEXT,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 8, 60, 0),
                    child: Text(widget.drink.productDescription,
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
                          "\$ ${widget.drink.productPrice}",
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
                              color: widget.drink.productSize == ProductSize.CH
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.drink.productSize = ProductSize.CH;
                                widget.drink.productPrice =
                                    widget.drink.productPriceCalculator();
                              });
                            },
                            textColor:
                                widget.drink.productSize == ProductSize.CH
                                    ? Colors.deepPurple
                                    : Colors.black,
                            child: Text("Chico"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                            borderSide: BorderSide(
                              color: widget.drink.productSize == ProductSize.M
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.drink.productSize = ProductSize.M;
                                widget.drink.productPrice =
                                    widget.drink.productPriceCalculator();
                              });
                            },
                            textColor: widget.drink.productSize == ProductSize.M
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
                              color: widget.drink.productSize == ProductSize.G
                                  ? Colors.deepPurple
                                  : Colors.grey[300],
                            ),
                            onPressed: () {
                              setState(() {
                                widget.drink.productSize = ProductSize.G;
                                widget.drink.productPrice =
                                    widget.drink.productPriceCalculator();
                              });
                            },
                            textColor: widget.drink.productSize == ProductSize.G
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
