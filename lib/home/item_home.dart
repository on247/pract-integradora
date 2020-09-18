import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  final String title;
  final String image;
  ItemHome({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            top: 16,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              child: Container(height: 180),
            ),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "$title",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: PRIMARY_TEXT,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "$image",
                fit: BoxFit.contain,
                height: 180,
                width: 180,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
