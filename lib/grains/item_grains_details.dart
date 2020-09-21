import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grain;
  final ProductWishlist wishList;
  ItemGrainsDetails({
    Key key,
    @required this.grain,
    @required this.wishList,
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.grain.productTitle),
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
                                        color: widget.grain.liked
                                            ? Colors.white
                                            : PRIMARY_TEXT,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.grain.liked =
                                              !widget.grain.liked;
                                          widget.wishList
                                              .addProductGrain(widget.grain);
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
