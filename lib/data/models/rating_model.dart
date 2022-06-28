class RatingModel {
  final bool isLiking;
  final String email;

  final String comment;

  RatingModel({
    required this.isLiking,
    required this.email,
    required this.comment,
  });

  Map<String, dynamic> toFirestore() => {
        "isLiking": isLiking,
        "email": email,
        "comment": comment,
      };

  factory RatingModel.fromFirestore(Map<String, dynamic> json) => RatingModel(
      isLiking: json["isLiking"],
      email: json["email"],
      comment: json["comment"]);
}
