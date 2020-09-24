import 'package:estructura_practica_1/history/history_page.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/wishlist/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class Profile extends StatelessWidget {
  final ProductWishlist wishlist;
  final ProductCart cart;
  const Profile({
    Key key,
    @required this.wishlist,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILE_TITLE),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      PROFILE_PICTURE,
                    ),
                    minRadius: 40,
                    maxRadius: 80,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  PROFILE_NAME,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(PROFILE_EMAIL),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: Text(PROFILE_CART),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Cart(
                            cart: cart,
                            wishlist: wishlist,
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(PROFILE_WISHES),
                  leading: Icon(Icons.thumb_up),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return WishlistPage(wishlist: wishlist);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(PROFILE_HISTORY),
                  leading: Icon(Icons.store),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HistoryPage(cart: cart, wishList: wishlist);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text("Productos"),
                  leading: Icon(Icons.local_drink),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Home(
                            title: APP_TITLE,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text(PROFILE_LOGOUT),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
