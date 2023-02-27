import 'package:booking_app/Components/ticket.dart';
import 'package:booking_app/utils/app_info_list.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';

import 'Components/hotels.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: NoGlowScroll(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              /******* Good Morning Component ****/
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning',
                            style: Styles.h4.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Book Tickets',
                          style: Styles.h1,
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/img_1.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              /******* Search ****/
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search for flights',
                      style: Styles.para,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              /******* Ticket Component ****/
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Flights',
                      style: Styles.h1,
                    ),
                    InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print('View all button was pressed');
                        }
                      },
                      child: Text(
                        'View All',
                        style: Styles.h4,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children:
                        ticketList.map((e) => Ticket(ticketList: e)).toList()),
              ),

              /******* Ticket Component ****/
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hotels',
                      style: Styles.h1,
                    ),
                    InkWell(
                      onTap: () {
                        if (kDebugMode) {
                          print('View all button was pressed');
                        }
                      },
                      child: Text(
                        'View All',
                        style: Styles.h4,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                    children: hotelList.map((e) => Hotels(hotel: e)).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
