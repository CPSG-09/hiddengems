import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/widgets/category_list.dart';
import 'package:hiddengems/persentation/widgets/item_card.dart';

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 16),
            width: double.infinity,
            height: 90,
            color: kPurple,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kWhite,
                  ),
                ),
                const SizedBox(width: 18),
                Container(
                  width: 280,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    style: kFieldInput.copyWith(color: kWhite),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: kWhite,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: kWhite)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategoryList(),
                const SizedBox(height: 28),
                Text('Dalam 100m', style: kFieldTitle),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 28),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 28),
            child: Text('Dalam 500m', style: kFieldTitle),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 28),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                  ItemCard(
                    title: 'Bengkelku',
                    address: 'Jl. Pekanbaru',
                    time: '08.00 - 23.59',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
