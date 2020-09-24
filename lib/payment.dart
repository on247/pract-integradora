import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';

enum PaymentType { PAY_CART, PAY_ITEM }

class PaymentPage extends StatefulWidget {
  final ProductWishlist wishList;
  final ProductCart cart;
  final ProductItemCart product;
  final PaymentType type;
  PaymentPage({
    Key key,
    @required this.type,
    @required this.wishList,
    @required this.cart,
    this.product,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void pay(context) {
    if (widget.type == PaymentType.PAY_ITEM) {
      widget.cart.checkoutProduct(widget.product);
    } else {
      widget.cart.checkoutCart();
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        "https://previews.123rf.com/images/garloon/garloon1503/garloon150300017/37887938-granos-de-caf%C3%A9-en-la-textura-de-fondo-de-la-tabla.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: 32.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Orden Exitosa",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Gracias for tu compra",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Tu orden ha sido registrada , para mayor informacion consulta tu historial de compras",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Aceptar"),
              )
            ],
          );
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Profile(wishlist: widget.wishList, cart: widget.cart),
      appBar: AppBar(
        title: Text("Pago"),
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
          )
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              pay(context);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 16, 30, 8),
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
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ITEM_BACKGROUND_DARK, ITEM_BACKGROUND],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 48, 8),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Icon(
                                          Icons.attach_money,
                                          size: 96.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pago en efectivo",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(color: Colors.white),
                                      ),
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
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
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
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ITEM_BACKGROUND_DARK, ITEM_BACKGROUND],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 48, 8),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Icon(
                                          Icons.credit_card,
                                          size: 96.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tarjeta de credito",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(color: Colors.white),
                                      ),
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
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
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
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ITEM_BACKGROUND_DARK, ITEM_BACKGROUND],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 48, 8),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Icon(
                                          Icons.card_giftcard,
                                          size: 96.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tarjeta de regalo",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(color: Colors.white),
                                      ),
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
          )
        ],
      ),
    );
  }
}
