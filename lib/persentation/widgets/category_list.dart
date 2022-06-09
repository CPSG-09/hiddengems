import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List categories = [
    'Semua',
    'Bengkel',
    'Apotik',
    'Penginapan',
    'Warung Kelontong',
    'Sedot WC',
    'Rental Kendaraan',
    'Warung Makan'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 8, right: index == categories.length - 1 ? 16 : 0),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: index == selectedIndex
                    ? kPurple.withOpacity(0.4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: kPurple)),
            child: Text(
              categories[index],
              style: kSubtitle.copyWith(color: kPurple),
            ),
          ),
        ),
      ),
    );
  }
}
