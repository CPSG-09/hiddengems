import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/pages/profile_page.dart';
import 'package:hiddengems/persentation/pages/search_page.dart';
import 'package:hiddengems/persentation/pages/tambah_tampat_page.dart';
import 'package:hiddengems/persentation/widgets/icon_menu.dart';
import 'package:hiddengems/persentation/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: kPurple,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, size: 32, color: kWhite),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.ROUTE_NAME);
                },
                icon: const CircleAvatar(
                    child: Icon(Icons.person, size: 32, color: kWhite)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPink,
        onPressed: () {
          Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
        },
        label: Text(
          'Tempat Terdekat',
          style: kButton,
        ),
        icon: const Icon(Icons.near_me),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF442863),
                  Color(0xFF842B6B),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/logo_app.png'),
                                    fit: BoxFit.cover),
                                color: kWhite,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SearchPage.ROUTE_NAME);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 209,
                              height: 50,
                              decoration: BoxDecoration(
                                color: kGrey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: kWhite,
                                  ),
                                  Text(
                                    'Cari HiddenGems....',
                                    style: kFieldInput.copyWith(color: kWhite),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              Icons.menu,
                              color: kWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Kategori Tempat',
                        style: kFieldTitle.copyWith(color: kWhite),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 120),
                        decoration: const BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconMenu(
                                  title: 'Bengkel',
                                  image: 'assets/icons/icon_bengkel.png',
                                  onTap: () {},
                                ),
                                IconMenu(
                                  title: 'Apotik',
                                  image: 'assets/icons/icon_apotik.png',
                                  onTap: () {},
                                ),
                                IconMenu(
                                  title: 'Penginapan',
                                  image: 'assets/icons/icon_penginapan.png',
                                  onTap: () {},
                                ),
                                IconMenu(
                                  title: 'Warung Kelontong',
                                  image: 'assets/icons/icon_kelontong.png',
                                  onTap: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconMenu(
                                  title: 'Sedot WC',
                                  image: 'assets/icons/icon_sedot_wc.png',
                                  titleColor: kBlack,
                                  onTap: () {},
                                ),
                                IconMenu(
                                  title: 'Rental Kendaraan',
                                  image: 'assets/icons/icon_rental.png',
                                  titleColor: kBlack,
                                  onTap: () {},
                                ),
                                IconMenu(
                                  title: 'Warung Makan',
                                  image: 'assets/icons/icon_warung_makan.png',
                                  titleColor: kBlack,
                                  onTap: () {},
                                ),
                                IconMenu(
                                  title: 'Tambah Tempat',
                                  image: 'assets/icons/icon_tambah_tempat.png',
                                  titleColor: kBlack,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, TambahTempatPage.ROUTE_NAME);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Tempat Terbaru',
                              style: kFieldTitle.copyWith(color: kPurple),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                                child: ListView(
                              children: [
                                ItemCard(
                                  title: 'Bengekal Maju Abadi',
                                  address: 'Jl. Diponegoro selatan no 14 Bali',
                                  time: '08.00 - 22.00',
                                  onTap: () {},
                                ),
                                ItemCard(
                                  title: 'Bengekal Maju Abadi',
                                  address: 'Jl. Diponegoro selatan no 14 Bali',
                                  time: '08.00 - 22.00',
                                  onTap: () {},
                                ),
                                ItemCard(
                                  title: 'Bengekal Maju Abadi',
                                  address: 'Jl. Diponegoro selatan no 14 Bali',
                                  time: '08.00 - 22.00',
                                  onTap: () {},
                                ),
                                ItemCard(
                                  title: 'Bengekal Maju Abadi',
                                  address: 'Jl. Diponegoro selatan no 14 Bali',
                                  time: '08.00 - 22.00',
                                  onTap: () {},
                                ),
                                ItemCard(
                                  title: 'Bengekal Maju Abadi',
                                  address: 'Jl. Diponegoro selatan no 14 Bali',
                                  time: '08.00 - 22.00',
                                  onTap: () {},
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
