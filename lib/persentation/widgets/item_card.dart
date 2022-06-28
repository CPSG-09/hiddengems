import 'package:flutter/material.dart';
import 'package:hiddengems/data/models/place_model.dart';
import 'package:hiddengems/persentation/pages/detail_page.dart';
import 'package:hiddengems/theme.dart';

class ItemCard extends StatelessWidget {
  final String id;
  final PlaceModel placeModel;

  const ItemCard({required this.id, required this.placeModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/icons/';

    switch (placeModel.category) {
      case 'Bengkel':
        imagePath += 'bengkel.png';
        break;
      case 'Apotik':
        imagePath += 'apotik.png';
        break;
      case 'Penginapan':
        imagePath += 'penginapan.png';
        break;
      case 'Warung Kelontong':
        imagePath += 'kelontong.png';
        break;
      case 'Sedot WC':
        imagePath += 'sedot_wc.png';
        break;
      case 'Rental Kendaraan':
        imagePath += 'rental.png';
        break;
      case 'Warung Makan':
        imagePath += 'warung_makan.png';
        break;
    }

    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(id: id, placeModel: placeModel),
          )),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 56,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeModel.name,
                    style: AppTheme.poppins12BoldBlueDark,
                  ),
                  Text(
                    '${placeModel.category}, buka ${placeModel.openingHours}',
                    style: AppTheme.poppins8BoldPink,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    placeModel.address,
                    style: AppTheme.heebo10RegularBlack,
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
