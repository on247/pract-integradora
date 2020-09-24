import 'dart:ffi';

import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/cupertino.dart';

class ProductCart {
  List<ProductItemCart> products;
  ProductCart() {
    this.products = new List<ProductItemCart>();
  }

  void addProductDrink(ProductHotDrinks item) {
    ProductItemCart addedProduct = ProductItemCart(
        productTitle: item.productTitle,
        productAmount: 1,
        productPrice: item.productPrice,
        productImage: item.productImage);
    products.add(addedProduct);
  }

  void addProductDessert(ProductDesserts item) {
    ProductItemCart addedProduct = ProductItemCart(
        productTitle: item.productTitle,
        productAmount: 1,
        productPrice: item.productPrice,
        productImage: item.productImage);
    products.add(addedProduct);
  }

  void addProductGrain(ProductGrains item) {
    ProductItemCart addedProduct = ProductItemCart(
        productTitle: item.productTitle,
        productAmount: 1,
        productPrice: item.productPrice,
        productImage: item.productImage);
    products.add(addedProduct);
  }

  ProductItemCart getItemByName(String name) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].productTitle == name) {
        return products[i];
      }
    }
    return null;
  }

  void removeItemByName(String name) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].productTitle == name) {
        products.remove(products[i]);
      }
    }
  }

  bool productExistsByName(String name) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].productTitle == name) {
        return true;
      }
    }
    return false;
  }

  bool productExists(ProductItemCart item) {
    return products.indexOf(item) != -1;
  }

  void removeItem(ProductItemCart item) {
    products.remove(item);
  }

  double cartTotal() {
    double total = 0;
    for (var i = 0; i < products.length; i++) {
      total += products[i].productPrice * products[i].productAmount.toDouble();
    }
    return total;
  }

  List<ProductItemCart> productList() {
    return this.products;
  }
}
