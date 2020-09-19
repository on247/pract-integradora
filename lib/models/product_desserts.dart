import 'dart:math';
import 'package:flutter/foundation.dart';

enum DessertSize { CH, M, G }

class ProductDesserts {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  DessertSize productSize; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductDesserts({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productSize,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo a la size del producto
    productPrice = productPriceCalculator();
  }

  // Mandar llamar este metodo cuando se cambie el tamanio del producto
  // De esta manera el precio del nuevo tamanio del producto se autocalcula
  // Por ejemplo cuando se cambie a M
  //
  // FlatButton(
  //   child: Text("M"),
  //   onPressed: () {
  //     setState(() {
  //       prod.productSize = ProductSize.M;
  //       prod.productPrice = prods.productPriceCalculator();
  //     });
  //   },
  // ),
  //
  //
  double productPriceCalculator() {
    if (this.productSize == DessertSize.CH)
      return (50 + Random().nextInt(70)).toDouble();
    if (this.productSize == DessertSize.M)
      return (70 + Random().nextInt(90)).toDouble();
    if (this.productSize == DessertSize.G)
      return (90 + Random().nextInt(100)).toDouble();
    return 999.0;
  }
}
