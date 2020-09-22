import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProductWishlist wishlist = ProductWishlist();
  final ProductCart cart = ProductCart();
  HotDrinksPage _hotDrinksPage;
  DessertsPage _dessertsPage;
  GrainsPage _grainsPage;
  _HomeState() {
    _hotDrinksPage = HotDrinksPage(
      wishList: wishlist,
      cart: cart,
      drinksList: ProductRepository.loadProducts(
        ProductType.BEBIDAS,
      ),
    );
    _dessertsPage = DessertsPage(
      wishList: wishlist,
      cart: cart,
      dessertsList: ProductRepository.loadProducts(
        ProductType.POSTRES,
      ),
    );
    _grainsPage = GrainsPage(
      wishList: wishlist,
      cart: cart,
      grainsList: ProductRepository.loadProducts(
        ProductType.GRANO,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Profile(
        cart: cart,
        wishlist: wishlist,
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          ItemHome(
            // TODO: Al hacer clic, que muestre un snackbar de "Proximamente"
            title: "Tazas",
            image: "https://i.imgur.com/fMjtSpy.png",
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _hotDrinksPage;
        },
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _grainsPage;
        },
      ),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _dessertsPage;
        },
      ),
    );
  }
}
