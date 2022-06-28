import 'package:flutter/material.dart';
import 'package:hiddengems/data/models/place_model.dart';
import 'package:hiddengems/data/remote_data_repository.dart';
import 'package:hiddengems/persentation/pages/about_page.dart';
import 'package:hiddengems/persentation/pages/add_place_page.dart';
import 'package:hiddengems/persentation/pages/profile_page.dart';
import 'package:hiddengems/persentation/pages/search_page.dart';
import 'package:hiddengems/persentation/provider/home_provider.dart';
import 'package:hiddengems/persentation/widgets/icon_menu.dart';
import 'package:hiddengems/persentation/widgets/item_card.dart';
import 'package:hiddengems/theme.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<HomeProvider>(context, listen: false).loadHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgWhite,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: AppTheme.systemUiOverlayStyle,
        titleSpacing: 0,
      ),
      body: Stack(
        children: const [
          _HomeBody(),
          _HomeAppBar(),
          _HomeNavBar(),
          _HomeFloatingActionButton(),
        ],
      ),
    );
  }
}

class _HomeFloatingActionButton extends StatelessWidget {
  const _HomeFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 32,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: AppTheme.bgPink,
              borderRadius: BorderRadius.circular(100),
              elevation: 16,
              shadowColor: const Color(0xFFFF0000),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage(
                              category: '',
                              query: '',
                            ))),
                borderRadius: BorderRadius.circular(100),
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.near_me,
                        color: AppTheme.fgWhite,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Tempat Terdekat',
                        style: AppTheme.poppins14BoldWhite,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class _HomeNavBar extends StatelessWidget {
  const _HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Material(
        child: Ink(
            height: 64,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppTheme.bgPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home,
                      color: AppTheme.fgWhite,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 240 - 28),
                  IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage())),
                    icon: const Icon(
                      Icons.account_circle,
                      color: AppTheme.fgHalfWhite,
                      size: 32,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64),
          const _Menus(),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 64 + 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tempat Terbaru', style: AppTheme.poppins14BoldPurple),
                const SizedBox(height: 4),
                const _ScrollablePlaceholder(),
                // Scroll Buffer
                const SizedBox(height: 720),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Menus extends StatelessWidget {
  const _Menus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _MenuBackground(),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 20, 28, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Kategori Tempat', style: AppTheme.poppins14BoldWhite),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconMenu(
                    label: 'Bengkel',
                    path: 'assets/icons/bengkel.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(
                                query: '', category: 'Bengkel'),
                          ));
                    },
                  ),
                  IconMenu(
                    label: 'Apotik',
                    path: 'assets/icons/apotik.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SearchPage(query: '', category: 'Apotik'),
                          ));
                    },
                  ),
                  IconMenu(
                    label: 'Penginapan',
                    path: 'assets/icons/penginapan.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(
                                query: '', category: 'Penginapan'),
                          ));
                    },
                  ),
                  IconMenu(
                    label: 'Warung Kelontong',
                    path: 'assets/icons/kelontong.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(
                                query: '', category: 'Warung Kelontong'),
                          ));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconMenu(
                    isSecondRow: true,
                    label: 'Sedot WC',
                    path: 'assets/icons/sedot_wc.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(
                                query: '', category: 'Sedot WC'),
                          ));
                    },
                  ),
                  IconMenu(
                    isSecondRow: true,
                    label: 'Rental Kendaraan',
                    path: 'assets/icons/rental.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(
                                query: '', category: 'Rental Kendaraan'),
                          ));
                    },
                  ),
                  IconMenu(
                    isSecondRow: true,
                    label: 'Warung Makan',
                    path: 'assets/icons/warung_makan.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(
                                query: '', category: 'Warung Makan'),
                          ));
                    },
                  ),
                  IconMenu(
                      isSecondRow: true,
                      label: 'Tambah Tempat',
                      path: 'assets/icons/tambah_tempat.png',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPlacePage()))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScrollablePlaceholder extends StatelessWidget {
  const _ScrollablePlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const CircularProgressIndicator();
        } else {
          if (value.isLocationError) {
            return Text(value.errorMessage);
          } else {
            return PaginateFirestore(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, snapshots, index) {
                final data = snapshots[index].data() as Map<String, dynamic>;
                final placeModel = PlaceModel.fromFirestore(data);
                final id = snapshots[index].id;
                return ItemCard(id: id, placeModel: placeModel);
              },
              query: RemoteDataRepository.newestPlaces,
              itemBuilderType: PaginateBuilderType.listView,
            );
          }
        }
      },
    );
  }
}

class _MenuBackground extends StatelessWidget {
  const _MenuBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/home_background.png'),
        Positioned(
            height: 56,
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 56,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: AppTheme.bgWhite,
              ),
            )),
      ],
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: MediaQuery.of(context).size.width,
        height: 64,
        top: 0,
        child: Material(
          child: Ink(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/home_appbar_background.png'),
                    fit: BoxFit.fitWidth)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 8, 0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/home_logo.png',
                    width: 42,
                  ),
                  const SizedBox(width: 22),
                  const _FakeSearchBar(),
                  const SizedBox(width: 12),
                  PopupMenuButton(
                      child: const Icon(
                        Icons.more_vert,
                        color: AppTheme.fgWhite,
                      ),
                      onSelected: (input) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutPage())),
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: '',
                              child: Text('Tentang Aplikasi'),
                            )
                          ]),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ));
  }
}

class _FakeSearchBar extends StatelessWidget {
  const _FakeSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(
                category: '',
                query: '',
                isFocused: true,
              ),
            )),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Ink(
          decoration: const BoxDecoration(
              color: AppTheme.bgQuarterWhite,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Row(
              children: [
                const Icon(Icons.search, color: AppTheme.fgHalfWhite),
                const SizedBox(width: 4),
                Text(
                  'Cari di Hidden Gems...',
                  style: AppTheme.poppins12MediumHalfWhite,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
