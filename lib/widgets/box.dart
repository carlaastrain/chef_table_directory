import 'package:flutter/material.dart';
import 'package:my_app/utils/app_layout.dart';
import 'package:my_app/utils/app_styles.dart';
import 'package:my_app/widgets/column_layout.dart';
import 'package:my_app/widgets/favorite_widget.dart';

import '../interfaces/restaurant.dart';

class Box extends StatelessWidget {
  final Restaurant restaurant;

  const Box({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppLayout.getHeight(5)),
      child: FittedBox(
        child: Material(
          color: Colors.white,
          elevation: 14,
          borderRadius: BorderRadius.circular(AppLayout.getHeight(24.0)),
          shadowColor: Styles.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(AppLayout.getHeight(4)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21)),
                    bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/images/${restaurant.mainImage}'),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 190,
                padding: EdgeInsets.only(
                    left: AppLayout.getHeight(7.0),
                    top: AppLayout.getHeight(7.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumnLayout(
                      firstText: restaurant.restaurantName,
                      secondText: restaurant.chefName,
                      alignment: CrossAxisAlignment.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyFavourite(
                          restaurant: restaurant,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
