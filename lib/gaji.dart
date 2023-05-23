import 'package:flutter/material.dart';
import 'package:gaji_karyawan/milihkaryawan.dart';
import 'package:gaji_karyawan/repository.dart';
import 'package:gaji_karyawan/dashboard.dart';
import 'package:gaji_karyawan/riwayat.dart';
import 'package:google_fonts/google_fonts.dart';

class Gaji extends StatefulWidget {
  const Gaji({super.key});

  @override
  State<Gaji> createState() => _GajiState();
}

class _GajiState extends State<Gaji> {
  RepositoryGaji repository = RepositoryGaji();
  final _textNamaController = TextEditingController();
  final _textJabatanController = TextEditingController();
  final _textIzinController = TextEditingController();
  final _textAlpaController = TextEditingController();
  final _textPotonganController = TextEditingController();
  final _textGajiController = TextEditingController();
  final _textTunjanganController = TextEditingController();
  final _textBonusController = TextEditingController();
  final _textTotalController = TextEditingController();

  int? selectedValue1;
  int? selectedValue2;

  void calculatePotonganGaji(int alpaCount) {
    double gajiBersih;

    if (_textJabatanController.text == 'Karyawan') {
      gajiBersih = 1000000;
    } else if (_textJabatanController.text == 'HRD') {
      gajiBersih = 3000000;
    } else {
      gajiBersih = 4000000;
    }

    double potonganGaji = alpaCount * 100000;
    double gajiBersihdua = gajiBersih - potonganGaji;

    // Update nilai pada controller
    _textPotonganController.text = potonganGaji.toString();
    _textGajiController.text = gajiBersihdua.toString();

    // Update nilai gaji pokok
    gajiPokok = gajiBersihdua;
    calculateTotalGaji();
  }

  double gajiPokok = 0.0;
  double tunjangan = 0.0;
  double bonus = 0.0;

  void calculateTotalGaji() {
    double totalGaji = gajiPokok + tunjangan + bonus;
    _textTotalController.text = totalGaji.toString();
  }

  @override
  void dispose() {
    _textAlpaController.dispose();
    _textPotonganController.dispose();
    _textTotalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args[0].isNotEmpty) {
      _textNamaController.text = args[0];
    }
    if (args[1].isNotEmpty) {
      _textJabatanController.text = args[1];
    }

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 55, 121, 129),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 10, 20, 24),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Input Gaji",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "PT. AMARTA KARYA",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Color(0xffa29aac),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                          controller: _textNamaController,
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nama',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                          controller: _textJabatanController,
                          enabled: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Jabatan',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: DropdownButtonFormField<int>(
                        value: selectedValue1,
                        onChanged: (value) {
                          setState(() {
                            selectedValue1 = value;
                            _textIzinController.text = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Izin/Sakit',
                        ),
                        items: [
                          DropdownMenuItem<int>(
                            value: 0,
                            child: Text('-'),
                          ),
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text('1'),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text('2'),
                          ),
                          DropdownMenuItem<int>(
                            value: 3,
                            child: Text('3'),
                          ),
                          DropdownMenuItem<int>(
                            value: 4,
                            child: Text('4'),
                          ),
                          DropdownMenuItem<int>(
                            value: 5,
                            child: Text('5'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: DropdownButtonFormField<int>(
                        value: selectedValue2,
                        onChanged: (value) {
                          setState(() {
                            selectedValue2 = value;
                            _textAlpaController.text = value.toString();
                          });
                          calculatePotonganGaji(value!);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Alpa',
                        ),
                        items: [
                          DropdownMenuItem<int>(
                            value: 0,
                            child: Text('-'),
                          ),
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text('1'),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text('2'),
                          ),
                          DropdownMenuItem<int>(
                            value: 3,
                            child: Text('3'),
                          ),
                          DropdownMenuItem<int>(
                            value: 4,
                            child: Text('4'),
                          ),
                          DropdownMenuItem<int>(
                            value: 5,
                            child: Text('5'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _textPotonganController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Potongan Gaji',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _textGajiController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Gaji Pokok',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  gajiPokok = double.parse(value);
                                });
                                calculateTotalGaji();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _textTunjanganController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Tunjangan',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  tunjangan = double.parse(value);
                                });
                                calculateTotalGaji();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                              controller: _textBonusController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Bonus',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  bonus = double.parse(value);
                                });
                                calculateTotalGaji();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                          controller: _textTotalController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Total Gaji',
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                        onPressed: () async {
                          bool response = await repository.postData(
                            _textNamaController.text,
                            _textJabatanController.text,
                            _textIzinController.text,
                            _textAlpaController.text,
                            _textPotonganController.text,
                            _textGajiController.text,
                            _textTunjanganController.text,
                            _textBonusController.text,
                            _textTotalController.text,
                          );

                          if (response) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Riwayat();
                                },
                              ),
                            );
                          } else {
                            print('Post data gagal');
                          }
                        },
                        child: Text(
                          'Kirim',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 15)),
                    SizedBox(width: 30),
                    MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Dashboard();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Kembali',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        color: Colors.blue,
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 15)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
