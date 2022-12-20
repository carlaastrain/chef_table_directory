import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/utils/app_layout.dart';
import 'package:my_app/widgets/layout_wilder_widget.dart';

import 'package:my_app/widgets/thick_container.dart';
import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.85,
        height: AppLayout.getHeight(176),
        child: Container(
          margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isColor == null ? Styles.blueMarine : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21)),
                    topRight: Radius.circular(AppLayout.getHeight(21)),
                  ),
                ),
                padding: EdgeInsets.all(AppLayout.getHeight(16)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(ticket['from']['code'],
                            style: isColor == null
                                ? Styles.headlineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headlineStyle3),
                        Expanded(child: Container()),
                        ThickContainer(isColor: isColor),
                        Expanded(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: AppLayout.getHeight(24),
                                child: const AppLayoutBuilderWidget(
                                  sections: 6,
                                  isColor: true,
                                ),
                              ),
                              Center(
                                child: Transform.rotate(
                                  angle: 1.5,
                                  child: isColor == null
                                      ? const Icon(Icons.local_airport,
                                          color: Colors.white)
                                      : Icon(Icons.local_airport,
                                          color: Styles.iconLightBlue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ThickContainer(isColor: isColor),
                        Expanded(child: Container()),
                        Text(ticket['to']['code'],
                            style: isColor == null
                                ? Styles.headlineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.headlineStyle3),
                      ],
                    ),
                    const Gap(3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppLayout.getWidth(100),
                          child: Text(ticket['from']['name'],
                              style: isColor == null
                                  ? Styles.headlineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headlineStyle4),
                        ),
                        Center(
                          child: Text(ticket['flying_time'],
                              style: isColor == null
                                  ? Styles.headlineStyle4
                                      .copyWith(color: Colors.white)
                                  : Styles.headlineStyle3
                                      .copyWith(color: Colors.black)),
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(100),
                          child: Text(
                            ticket['to']['name'],
                            style: isColor == null
                                ? Styles.headlineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headlineStyle4,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                (constraints.constrainWidth() / 15).floor(),
                                (index) => SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: isColor == null
                                            ? Colors.white
                                            : Colors.grey.shade300),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /*bottom part orange of the ticket*/
              Container(
                decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: isColor == null
                        ? const Radius.circular(21)
                        : const Radius.circular(0),
                    bottomRight: isColor == null
                        ? const Radius.circular(21)
                        : const Radius.circular(0),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ticket['date'],
                                style: isColor == null
                                    ? Styles.headlineStyle3
                                        .copyWith(color: Colors.white)
                                    : Styles.headlineStyle3),
                            const Gap(3),
                            Text("DATE",
                                style: isColor == null
                                    ? Styles.headlineStyle4
                                        .copyWith(color: Colors.white)
                                    : Styles.headlineStyle4),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(ticket['departure_time'],
                                style: isColor == null
                                    ? Styles.headlineStyle3
                                        .copyWith(color: Colors.white)
                                    : Styles.headlineStyle3),
                            const Gap(3),
                            Text("Departure time",
                                style: isColor == null
                                    ? Styles.headlineStyle4
                                        .copyWith(color: Colors.white)
                                    : Styles.headlineStyle4),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(ticket['number'].toString(),
                                style: isColor == null
                                    ? Styles.headlineStyle3
                                        .copyWith(color: Colors.white)
                                    : Styles.headlineStyle3),
                            const Gap(3),
                            Text("Number",
                                style: isColor == null
                                    ? Styles.headlineStyle4
                                        .copyWith(color: Colors.white)
                                    : Styles.headlineStyle4),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
