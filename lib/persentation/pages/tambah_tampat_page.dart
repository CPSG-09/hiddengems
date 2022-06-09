import 'package:flutter/material.dart';
import 'package:hiddengems/common/constants.dart';
import 'package:hiddengems/persentation/widgets/button.dart';

class TambahTempatPage extends StatefulWidget {
  static const ROUTE_NAME = '/tambah-tempat';

  const TambahTempatPage({Key? key}) : super(key: key);

  @override
  State<TambahTempatPage> createState() => _TambahTempatPageState();
}

class _TambahTempatPageState extends State<TambahTempatPage> {
  final tempatController = TextEditingController();
  List<String> itemCategories = [
    'Bengkel',
    'Apotik',
    'Penginapan',
    'Warung Kelontong',
    'Sedot WC',
    'Rental Kendaraan',
    'Warung Makan'
  ];
  String? selectedItemCategories = 'Bengkel';

  List<String> itemTimes = ['06.00', '07.00', '08.00', '09.00'];
  String? selectedItemTimes = '06.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          backgroundColor: kPurple,
          title: Text(
            'Tambah Tempat',
            style: kAppBar,
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 156,
                  width: 500,
                  color: kGrey,
                ),
                const SizedBox(height: 28),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Tempat',
                        style: kFieldTitle,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        style: kFieldInput,
                        controller: tempatController,
                        decoration: InputDecoration(
                          hintText: 'Nama Tempat',
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kPurple, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPurple.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Kategori Tempat',
                        style: kFieldTitle,
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        style: kFieldInput.copyWith(color: kBlack),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: kPurple, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: kPurple.withOpacity(0.2),
                            ),
                          ),
                        ),
                        items: itemCategories
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: kFieldInput,
                                  ),
                                ))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItemCategories = item),
                        value: selectedItemCategories,
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Jam Operasional',
                        style: kFieldTitle,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 125,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kPurple, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: kPurple.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              items: itemTimes
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: kFieldInput,
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => selectedItemTimes = item),
                              value: selectedItemTimes,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right_outlined,
                            size: 50,
                            color: kGrey,
                          ),
                          SizedBox(
                            width: 125,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: kPurple, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: kPurple.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              items: itemTimes
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: kFieldInput,
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => selectedItemTimes = item),
                              value: selectedItemTimes,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Button(
                          name: 'Tambah Tempat',
                          onPressed: () {},
                          backgroundColor: kPurple,
                          textColor: kWhite),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
