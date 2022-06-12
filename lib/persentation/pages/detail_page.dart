import 'package:flutter/material.dart';
import 'package:hiddengems/data/models/place_model.dart';
import 'package:hiddengems/persentation/widgets/cta_icon_button.dart';
import 'package:hiddengems/theme.dart';

class DetailPage extends StatelessWidget {
  final String id;
  final PlaceModel placeModel;
  const DetailPage({required this.id, required this.placeModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _BodyDetailPage(placeModel: placeModel),
            const _BackButtonDetailPage(),
            const _CTAExternalDetailPage()
          ],
        ),
      ),
    );
  }
}

class _CTAExternalDetailPage extends StatelessWidget {
  const _CTAExternalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 64,
      width: MediaQuery.of(context).size.width,
      bottom: 0,
      child: Material(
        color: AppTheme.bgWhite,
        elevation: 16,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          height: 64,
          width: MediaQuery.of(context).size.width,
          child: CTAIconButton(
              iconData: Icons.near_me,
              label: 'Buka Rute di Google Map',
              onTap: () {}),
        ),
      ),
    );
  }
}

class _BackButtonDetailPage extends StatelessWidget {
  const _BackButtonDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      top: 16,
      child: Material(
        color: AppTheme.bgTransparent,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(34),
          child: Ink(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              color: AppTheme.bgHalfBlack,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppTheme.fgWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BodyDetailPage extends StatelessWidget {
  final PlaceModel placeModel;
  const _BodyDetailPage({
    required this.placeModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ink(
            height: 192,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppTheme.bgGrey,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.bgPurpleLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        placeModel.category,
                        style: AppTheme.heebo12MediumBlueDark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.bgPurpleLighter,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        placeModel.openingHours,
                        style: AppTheme.heebo12MediumBlueDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(placeModel.name, style: AppTheme.poppins24BoldBlueDark),
                const SizedBox(height: 12),
                Text(placeModel.address, style: AppTheme.poppins14BoldBlueDark),
                Ink(
                  height: 256,
                  child: const Center(
                    child: Text('Fitur ulasan dalam pengembangan'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
