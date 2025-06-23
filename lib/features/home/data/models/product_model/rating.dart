class Rating {
  Rating({this.rate, this.count});

  num? rate;
  int? count;

  static Rating empty() => Rating(rate: 0, count: 0);

  factory Rating.fromJson(Map<String, dynamic>? ratingData) {
    if (ratingData != null && ratingData.isNotEmpty) {
      return Rating(
        rate: ratingData["rate"] as num?,
        count: ratingData["count"] as int?,
      );
    } else {
      return empty();
    }
  }
}
