import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class BuildCover extends StatelessWidget {
  const BuildCover({super.key});

  @override
  Widget build(BuildContext context) {
    const double coverHeight = 280;
    const double profileHeight = 100;
    const top = coverHeight - profileHeight / 2;
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 280,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Styles.blueMarine,
                Styles.pink,
              ],
            ),
          ),
        ),
        Positioned(
          top: top,
          height: profileHeight,
          child: const Image(
            image: AssetImage(
              'assets/images/meal-icon.png',
            ),
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
