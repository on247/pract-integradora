import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ProductWishlist wishlist;
  final ValueChanged<double> onAmountUpdated;
  final Function onRemoveItem;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.onRemoveItem,
    @required this.product,
    @required this.wishlist,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ACCENT_DARK, ACCENT],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: widget.wishlist
                          .productExistsByName(widget.product.productTitle)
                      ? Colors.white
                      : PRIMARY_TEXT,
                ),
                onPressed: () {
                  setState(() {
                    if (!widget.wishlist
                        .productExistsByName(widget.product.productTitle)) {
                      widget.wishlist.addCartProduct(widget.product);
                    } else {
                      widget.wishlist
                          .removeItemByName(widget.product.productTitle);
                    }
                  });
                },
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.onRemoveItem(widget.product);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.product.productTitle}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: _remProd,
                          ),
                          Text("${widget.product.productAmount}",
                              style: Theme.of(context).textTheme.headline6),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: _addProd,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 48, 0),
                        child: Text(
                          "\$ ${widget.product.productPrice}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    if (widget.product.productAmount <= 1) {
      return;
    }
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
