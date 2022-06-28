import 'package:flutter/material.dart';
import 'package:hiddengems/data/models/rating_model.dart';
import 'package:hiddengems/theme.dart';

class RatingCommentCard extends StatelessWidget {
  final RatingModel ratingModel;
  const RatingCommentCard({
    required this.ratingModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ratingModel.email,
                style: AppTheme.poppins14BoldBlueDark,
              ),
              Text(
                ratingModel.comment,
                style: AppTheme.heebo14RegularBlack,
              ),
            ],
          ),
          Icon(
            ratingModel.isLiking ? Icons.thumb_up : Icons.thumb_down,
            color: AppTheme.fgGrey,
          )
        ],
      ),
    );
  }
}
