import "package:flutter/material.dart";
import 'package:hiddengems/common.dart';
import 'package:hiddengems/persentation/provider/search_provider.dart';
import 'package:hiddengems/persentation/widgets/item_card.dart';
import 'package:hiddengems/persentation/widgets/loading_content.dart';
import "package:hiddengems/theme.dart";
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SearchPage extends StatefulWidget {
  final String query;
  final String category;
  final bool isFocused;
  const SearchPage({
    required this.query,
    required this.category,
    this.isFocused = false,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<SearchProvider>(context, listen: false)
        ..query = widget.query
        ..category = widget.category
        ..loadNearstPlace(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgWhite,
      appBar: AppBar(
        systemOverlayStyle: AppTheme.systemUiOverlayStyle,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const _SearchPageBody(),
          _SearchPageAppBar(
            category: widget.category,
            isFocused: widget.isFocused,
          ),
        ],
      ),
    );
  }
}

class _SearchPageAppBar extends StatelessWidget {
  final bool isFocused;
  final String category;
  const _SearchPageAppBar({
    required this.category,
    required this.isFocused,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Material(
        child: Column(
          children: [
            Ink(
              height: 64,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppTheme.bgPurple,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 28, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                      color: AppTheme.fgWhite,
                    ),
                    const SizedBox(width: 12),
                    _SearchBar(
                      isFocused: isFocused,
                    ),
                  ],
                ),
              ),
            ),
            Ink(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppTheme.bgWhite,
              ),
              child: Consumer<SearchProvider>(builder: (context, value, child) {
                // print(value.scrollIndex);
                return ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppCommon.placeCategories.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(width: 28);
                    }
                    if (index == 1) {
                      return _PlaceCategoryChip(
                        label: 'Semua Tempat',
                        isActive: value.category == '',
                      );
                    }
                    return _PlaceCategoryChip(
                      label: AppCommon.placeCategories[index - 2],
                      isActive: value.category ==
                          AppCommon.placeCategories[index - 2],
                    );
                  },
                  // initialScrollIndex: value.scrollIndex + 2,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceCategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  const _PlaceCategoryChip({
    required this.label,
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () {
          String labelToBeSubmitted = '';
          if (label != 'Semua Tempat') {
            labelToBeSubmitted = label;
          }
          Provider.of<SearchProvider>(context, listen: false)
            ..category = labelToBeSubmitted
            ..loadNearstPlace();
        },
        child: Material(
          elevation: 4,
          color: AppTheme.bgWhite,
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? AppTheme.bgPurpleLight : AppTheme.bgWhite,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color:
                      isActive ? AppTheme.bgPurpleLight : AppTheme.fgGreyDark,
                  width: 1),
            ),
            child: Text(
              label,
              style: isActive
                  ? AppTheme.heebo12MediumBlueDark
                  : AppTheme.heebo12MediumGreyDarker,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchPageBody extends StatelessWidget {
  const _SearchPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 64 + 48 + 12, 28, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Dalam 500m',
              style: AppTheme.poppins14BoldBlueDark,
            ),
            Consumer<SearchProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const LoadingContent();
                } else {
                  if (value.isError) {
                    return const Center(
                      child: Text('Terjadi Kesalahan'),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.near500mPlaces.length,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          id: value.near500mPlaces[index].id,
                          placeModel: value.near500mPlaces[index].placeModel,
                        );
                      },
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final bool isFocused;
  const _SearchBar({required this.isFocused, Key? key}) : super(key: key);

  @override
  __SearchBarState createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFocused) {
      focusNode.requestFocus();
    }
    return Expanded(
      child: Ink(
        height: 36,
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.bgQuarterWhite,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  Provider.of<SearchProvider>(context, listen: false)
                    ..query = value
                    ..loadNearstPlace();
                },
                controller: controller,
                focusNode: focusNode,
                style: AppTheme.poppins12MediumWhite,
                decoration: InputDecoration(
                    hintStyle: AppTheme.poppins12MediumHalfWhite,
                    hintText: 'Cari di Hidden Gems...',
                    border: InputBorder.none),
              ),
            ),
            IconButton(
                iconSize: 20,
                onPressed: () {
                  Provider.of<SearchProvider>(context, listen: false)
                    ..query = ''
                    ..loadNearstPlace();
                  controller.clear();
                },
                icon: const Icon(
                  Icons.cancel,
                  color: AppTheme.fgWhite,
                ))
          ],
        ),
      ),
    );
  }
}
