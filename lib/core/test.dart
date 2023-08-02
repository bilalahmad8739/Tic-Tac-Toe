import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  double? ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Center(
              child: Text(
                'Rating ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          RatingBar(
              allowHalfRating: true,
              itemCount: 5,
              initialRating: 0,
              ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
                  empty: const Icon(Icons.star_outline)),
              onRatingUpdate: (value) {
                setState(() {
                  ratingValue = value;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          Text(
            ratingValue.toString(),
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
