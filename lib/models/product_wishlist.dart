import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:flutter/cupertino.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class GenericProduct {
  dynamic product;
  String name;
  String image;
  double price;
  String description;
  int quantity;

  GenericProduct(
      {@required this.name,
      @required this.image,
      @required this.price,
      @required this.description,
      this.quantity = 0});
}

class ProductWishlist {
  List<GenericProduct> products;
  ProductWishlist() {
    this.products = new List<GenericProduct>();
  }

  void addProductDrink(ProductHotDrinks item) {
    GenericProduct addedProduct = GenericProduct(
      name: item.productTitle,
      description: item.productDescription,
      image: item.productImage,
      price: item.productPrice,
    );
    products.add(addedProduct);
  }

  void addCartProduct(ProductItemCart item) {
    GenericProduct addedProduct = GenericProduct(
      name: item.productTitle,
      description: "",
      image: item.productImage,
      price: item.productPrice,
    );
    products.add(addedProduct);
  }

  void addProductDessert(ProductDesserts item) {
    GenericProduct addedProduct = GenericProduct(
      name: item.productTitle,
      description: item.productDescription,
      image: item.productImage,
      price: item.productPrice,
    );
    products.add(addedProduct);
  }

  void addProductGrain(ProductGrains item) {
    GenericProduct addedProduct = GenericProduct(
      name: item.productTitle,
      description: item.productDescription,
      image: item.productImage,
      price: item.productPrice,
    );
    products.add(addedProduct);
  }

  void removeItemByName(String name) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].name == name) {
        products.remove(products[i]);
      }
    }
  }

  void removeItem(GenericProduct item) {
    products.remove(item);
  }

  bool productExistsByName(String name) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].name == name) {
        return true;
      }
    }
    return false;
  }

  bool productExists(GenericProduct item) {
    return products.indexOf(item) != -1;
  }

  List<GenericProduct> productList() {
    return this.products;
  }
}
