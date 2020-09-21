import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/models/product_wishlist.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  final ProductWishlist wishList;
  ItemGrains({
    Key key,
    @required this.grain,
    @required this.wishList,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  void openItemPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ItemGrainsDetails(
            grain: widget.grain,
            wishList: widget.wishList,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openItemPage,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
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
            child: Card(
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Grano",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "${widget.grain.productTitle}",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  widget.grain.productWeight ==
                                          ProductWeight.KILO
                                      ? '1 kg'
                                      : '250 gr',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  child: Text(
                                    "\$ ${widget.grain.productPrice.toInt()}",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 48, 8),
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Image.network(
                                    widget.grain.productImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.thumb_up,
                          color:
                              widget.grain.liked ? Colors.white : PRIMARY_TEXT),
                      onPressed: () {
                        setState(() {
                          if (!widget.grain.liked) {
                            widget.wishList.addProductGrain(widget.grain);
                          } else {
                            widget.wishList
                                .removeItemByName(widget.grain.productTitle);
                          }
                          widget.grain.liked = !widget.grain.liked;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
