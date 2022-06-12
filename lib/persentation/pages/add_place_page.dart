// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hiddengems/common.dart';
import 'package:hiddengems/data/models/place_model.dart';
import 'package:hiddengems/data/remote_data_repository.dart';
import 'package:hiddengems/persentation/provider/add_place_provider.dart';
import 'package:hiddengems/persentation/widgets/cta_button.dart';
import 'package:hiddengems/persentation/widgets/top_bar.dart';
import 'package:hiddengems/theme.dart';
import 'package:hiddengems/utils.dart';
import 'package:provider/provider.dart';

class AddPlacePage extends StatefulWidget {
  const AddPlacePage({Key? key}) : super(key: key);

  @override
  State<AddPlacePage> createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<AddPlaceProvider>(context, listen: false).loadAddPlace(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(titleText: 'Tambah Tempat'),
      body: Consumer<AddPlaceProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (value.isLocationError) {
              return const Text('Tidak dapat mendapatkan lokasi');
            } else {
              return _AddPlaceForm(position: value.position);
            }
          }
        },
      ),
    );
  }
}

class _AddPlaceForm extends StatefulWidget {
  final Position position;
  const _AddPlaceForm({
    required this.position,
    Key? key,
  }) : super(key: key);

  @override
  State<_AddPlaceForm> createState() => _AddPlaceFormState();
}

class _AddPlaceFormState extends State<_AddPlaceForm> {
  bool isSubmitting = false;

  String name = '';
  String address = '';
  String category = AppCommon.placeCategories[0];
  String openingHour = AppCommon.hours[9];
  String closingHour = AppCommon.hours[17];

  final formKey = GlobalKey<FormState>();

  void addPlace() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final place = PlaceModel(
          name: name,
          address: address,
          longitude: widget.position.longitude,
          latitude: widget.position.latitude,
          openingHours: '$openingHour - $closingHour',
          category: category,
          dateAdded: DateTime.now());

      try {
        await RemoteDataRepository.addPlace(place);
        AppUtils.showSnackbar(context, 'Berhasil menambahkan tempat');
        Navigator.pop(context);
      } catch (e) {
        AppUtils.showSnackbar(context, 'Gagal menambahkan tempat');
      }

      setState(() {
        isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _AddPlaceMap(),
              const SizedBox(height: 28),
              Text(
                'Nama Tempat',
                style: AppTheme.poppins14BoldBlueDark,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: AppTheme.inputDecoration(''),
                validator: (input) => AppUtils.validateEmpty(input),
                onSaved: (input) => name = input ?? '',
              ),
              const SizedBox(height: 28),
              Text(
                'Alamat',
                style: AppTheme.poppins14BoldBlueDark,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: AppTheme.inputDecoration(''),
                validator: (input) => AppUtils.validateEmpty(input),
                onSaved: (input) => address = input ?? '',
              ),
              const SizedBox(height: 28),
              Text(
                'Kategori Tempat',
                style: AppTheme.poppins14BoldBlueDark,
              ),
              const SizedBox(height: 0),
              DropdownButton(
                isExpanded: true,
                value: category,
                onChanged: (value) {
                  setState(() {
                    category = value.toString();
                  });
                },
                items: AppCommon.placeCategories
                    .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 28),
              Text(
                'Jam Operasional',
                style: AppTheme.poppins14BoldBlueDark,
              ),
              const SizedBox(height: 0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      value: openingHour,
                      onChanged: (value) {
                        setState(() {
                          openingHour = value.toString();
                        });
                      },
                      items: AppCommon.hours
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '-',
                    style: AppTheme.poppins14BoldBlueDark,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      value: closingHour,
                      onChanged: (value) {
                        setState(() {
                          closingHour = value.toString();
                        });
                      },
                      items: AppCommon.hours
                          .map<DropdownMenuItem<String>>(
                              (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              CTAButton(
                  label: 'Tambah Tempat',
                  onTap: () => addPlace(),
                  isEnabled: !isSubmitting),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddPlaceMap extends StatelessWidget {
  const _AddPlaceMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          width: MediaQuery.of(context).size.width,
          height: 156,
          decoration: BoxDecoration(
            color: AppTheme.bgGrey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(
            height: 156,
            width: MediaQuery.of(context).size.width - 60,
            child: Center(
              child: Image.asset(
                height: 48,
                width: 30,
                'assets/images/pointer.png',
              ),
            ))
      ],
    );
  }
}
