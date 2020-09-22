import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class Cart extends StatefulWidget {
  final ProductCart cart;
  final ProductWishlist wishlist;
  Cart({
    Key key,
    @required this.wishlist,
    @required this.cart,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.cart.productList()) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito de compra"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: widget.cart.productList().length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCart(
                    onAmountUpdated: _priceUpdate,
                    onRemoveItem: _removeItem,
                    wishlist: widget.wishlist,
                    product: widget.cart.productList()[index],
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "$_total MX\$",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text("Comprar"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeItem(item) {
    setState(() {
      widget.cart.removeItem(item);
      _total = 0;
      for (var item in widget.cart.productList()) {
        _total += (item.productPrice * item.productAmount);
      }
    });
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
