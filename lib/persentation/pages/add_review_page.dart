import 'package:flutter/material.dart';
import 'package:hiddengems/data/auth_repository.dart';
import 'package:hiddengems/data/models/rating_model.dart';
import 'package:hiddengems/data/remote_data_repository.dart';
import 'package:hiddengems/persentation/provider/rating_provider.dart';
import 'package:hiddengems/persentation/widgets/cta_button.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';
import 'package:hiddengems/theme.dart';
import 'package:hiddengems/utils.dart';
import 'package:provider/provider.dart';

class AddReviewPage extends StatefulWidget {
  final String placeId;
  final String placeName;
  const AddReviewPage({
    required this.placeId,
    required this.placeName,
    Key? key,
  }) : super(key: key);

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  bool isLoading = false;

  String isLike = 'undefined';
  String comment = '';
  String likeWarning = '';

  final formKey = GlobalKey<FormState>();

  bool validateLikeButtons() {
    if (isLike == 'undefined') {
      likeWarning = 'Pilih suka atau tidak.';
      setState(() {});

      return false;
    }

    likeWarning = '';
    setState(() {});
    return true;
  }

  void addRating() async {
    if (validateLikeButtons() && formKey.currentState!.validate()) {
      formKey.currentState!.save();

      String uid = AuthRepository.getUID();
      String email = AppUtils.obscureEmail(AuthRepository.getEmail() ?? '');

      final rating = RatingModel(
          isLiking: isLike == 'yes' ? true : false,
          email: email,
          comment: comment);

      setState(() {
        isLoading = true;
      });

      try {
        RemoteDataRepository.addRating(widget.placeId, uid, rating);
        AppUtils.showSnackbar(context, 'Berhasil menambahkan ulasan');
        Navigator.pop(context);
        Provider.of<RatingProvider>(context, listen: false)
            .loadRatings(widget.placeId);
      } catch (e) {
        // ignore: avoid_print
        print(e);
        AppUtils.showSnackbar(context, 'Gagal menambahkan ulasan');
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(titleText: 'Tambah Ulasan'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.placeName,
                  style: AppTheme.poppins24BoldBlueDark,
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RateButton(
                      isLike: false,
                      isActive: isLike == 'no',
                      onTap: () => setState(() {
                        isLike = 'no';
                        likeWarning = '';
                      }),
                    ),
                    const SizedBox(width: 24),
                    RateButton(
                      isLike: true,
                      isActive: isLike == 'yes',
                      onTap: () => setState(() {
                        isLike = 'yes';
                        likeWarning = '';
                      }),
                    ),
                  ],
                ),
                Center(
                  child:
                      Text(likeWarning, style: AppTheme.poppins14SemiBoldRed),
                ),
                const SizedBox(height: 24),
                Text('Bagaimana pendapatmu?',
                    style: AppTheme.poppins14BoldBlueDark),
                const SizedBox(height: 12),
                TextFormField(
                  maxLines: 5,
                  onSaved: (input) => comment = input ?? '',
                  validator: (input) => AppUtils.validateEmpty(input),
                  decoration: AppTheme.inputDecoration(
                      'Ceritakan pendapatmu tentang tempat ini...'),
                ),
                const SizedBox(height: 24),
                CTAButton(
                  label: 'Kirim Ulasan',
                  onTap: () => addRating(),
                  isEnabled: !isLoading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RateButton extends StatelessWidget {
  final bool isLike;
  final bool isActive;
  final Function onTap;
  const RateButton({
    required this.isLike,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(128),
      onTap: () => onTap(),
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(128),
          ),
          border: Border.all(color: AppTheme.fgGrey, width: 2),
        ),
        child: Icon(
          isLike ? Icons.thumb_up : Icons.thumb_down,
          color: isActive ? AppTheme.fgPink : AppTheme.fgGrey,
        ),
      ),
    );
  }
}
