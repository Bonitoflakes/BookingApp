import 'package:booking_app/utils/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  final Map ticketList;
  const Ticket({Key? key, required this.ticketList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: Styles.orangeColor, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            /******** Ticket Part one --> Blue part ********/
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /******* Departure ****/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${ticketList["from"]["code"]}",
                        style: Styles.h3.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${ticketList["from"]["name"]}',
                        style: Styles.h3.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  /******* Timings ****/
                  Column(
                    children: [
                      Row(
                        children: [
                          /*** First circle ***/
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 2.5, color: Colors.white),
                            ),
                          ),

                          /*** Airplane with dotted lines ****/
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                // width: 50,
                                constraints: const BoxConstraints(
                                    minWidth: 40, maxWidth: 75),
                                child: LayoutBuilder(builder:
                                    (BuildContext context,
                                        BoxConstraints constraints) {
                                  if (kDebugMode) {
                                    print(
                                        'The max width is ${constraints.constrainWidth()}');
                                  }
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        (constraints.constrainWidth() / 9)
                                            .floor(),
                                        (index) => const SizedBox(
                                              width: 5,
                                              height: 1,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                  );
                                }),
                              ),
                              Transform.rotate(
                                angle: 1.5,
                                child: const Icon(
                                  Icons.flight,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          /*** Second circle ***/
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 2.5, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${ticketList["flying_time"]}',
                        style: Styles.h3.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  /******* Destination ****/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${ticketList["to"]["code"]}",
                        style: Styles.h3.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${ticketList["to"]["name"]}',
                        style: Styles.h3.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),

            /******** Ticket Part two: --> Line design ********/
            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                  /******** SemiCircle ********/
                  Transform.translate(
                    offset: const Offset(-2.0, 0.0),
                    child: SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Styles.bgColor,
                          border: Border.all(
                            color: Styles.bgColor,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /******** DottedLines ********/
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(builder: (ctx, constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              (constraints.constrainWidth() / 13).floor(),
                              (index) => const SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                        );
                      }),
                    ),
                  ),

                  /******** SemiCircle ********/
                  Transform.translate(
                    offset: const Offset(2.0, 0.0),
                    child: SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Styles.bgColor,
                          border: Border.all(
                            color: Styles.bgColor,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /******** Ticket Part two: --> Line design ********/
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /******* Departure ****/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${ticketList["date"]}",
                        style: Styles.h3.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Date',
                        style: Styles.h3.copyWith(color: Colors.white),
                      )
                    ],
                  ),

                  /******* Timings ****/
                  Column(
                    children: [
                      Text(
                        '${ticketList["departure_time"]}',
                        style: Styles.h3.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Departure time',
                        style: Styles.h3.copyWith(color: Colors.white),
                      )
                    ],
                  ),

                  /******* Destination ****/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${ticketList["number"]}",
                        style: Styles.h3.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Number',
                        style: Styles.h3.copyWith(color: Colors.white),
                      )
                    ],
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
