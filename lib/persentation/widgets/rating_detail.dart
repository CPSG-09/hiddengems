import 'package:flutter/material.dart';
import 'package:hiddengems/persentation/pages/add_review_page.dart';
import 'package:hiddengems/persentation/provider/rating_provider.dart';
import 'package:hiddengems/persentation/widgets/aux_icon_button.dart';
import 'package:hiddengems/persentation/widgets/rating_comment_card.dart';
import 'package:hiddengems/theme.dart';
import 'package:provider/provider.dart';

class RatingDetail extends StatefulWidget {
  final String placeId;
  final String placeName;
  const RatingDetail({
    required this.placeId,
    required this.placeName,
    Key? key,
  }) : super(key: key);

  @override
  State<RatingDetail> createState() => _RatingDetailState();
}

class _RatingDetailState extends State<RatingDetail> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<RatingProvider>(context, listen: false)
          .loadRatings(widget.placeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RatingProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : value.isError
                ? Center(child: Text(value.errorMessage))
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: value.isRated
                                ? StarRating(
                                    ratingValue: value.ratingValue,
                                  )
                                : Text(
                                    'Belum ada ulasan.',
                                    style: AppTheme.heebo12MediumGreyDarker,
                                  ),
                          ),
                          const SizedBox(width: 12),
                          value.isAbleToReview
                              ? AuxIconButton(
                                  label: 'Tulis Ulasan',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddReviewPage(
                                            placeId: widget.placeId,
                                            placeName: widget.placeName,
                                          ),
                                        ));
                                  },
                                  iconData: Icons.rate_review,
                                )
                              : Container()
                        ],
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        itemCount: value.ratings.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RatingCommentCard(
                            ratingModel: value.ratings[index],
                          );
                        },
                      )
                    ],
                  );
      },
    );
  }
}

class StarRating extends StatelessWidget {
  final double ratingValue;
  const StarRating({
    required this.ratingValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(Icons.star,
              color: ratingValue > .10 ? AppTheme.fgYellow : AppTheme.fgGrey),
          Icon(Icons.star,
              color: ratingValue > .24 ? AppTheme.fgYellow : AppTheme.fgGrey),
          Icon(Icons.star,
              color: ratingValue > .49 ? AppTheme.fgYellow : AppTheme.fgGrey),
          Icon(Icons.star,
              color: ratingValue > .74 ? AppTheme.fgYellow : AppTheme.fgGrey),
          Icon(Icons.star,
              color: ratingValue > .89 ? AppTheme.fgYellow : AppTheme.fgGrey),
        ]),
        const SizedBox(height: 6),
        Text(
          '${(ratingValue * 100).toInt()}% Orang menyukai tempat ini',
          style: AppTheme.poppins12RegularBlueDark,
        )
      ],
    );
  }
}
