import 'package:booking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class Hotels extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const Hotels({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      height: 350,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Styles.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${hotel["image"]}'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '${hotel["place"]}',
              style: Styles.h2,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              '${hotel["destination"]}',
              style: Styles.h4.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              '\$${hotel["price"]}/night',
              style: Styles.h1,
            ),
          ),
        ],
      ),
    );
  }
}
