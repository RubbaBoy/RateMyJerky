import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestService {
  static const URL = 'https://rmj.holysheet.workers.dev';

  Future<void> writeReview(Review review) async => http.post('$URL/review',
      body: jsonEncode({
        'name': review.name,
        'barcode': review.barcode,
        'location': review.location,
        'stars': review.stars,
        'review': review.review,
      }));

  Future<List<Review>> listReviews({String location}) =>
      http.get('$URL/list?location=${location ?? ''}').then((response) {
        var json = jsonDecode(response.body);
        return json.keys
            .map<Review>((key) => Review.fromJson(json[key]))
            .toList();
      });
}

class Review {
  final String name;
  final int barcode;
  final String location;
  final double stars;
  final String review;

  Review(this.name, this.barcode, this.location, this.stars, this.review);

  static Review fromJson(Map<String, dynamic> json) => Review(
      json['name'],
      json['barcode'],
      json['location'],
      double.tryParse(json['stars'].toString()),
      json['review']);
}
