import 'package:flutter/material.dart';
import 'package:gaji_karyawan/repository.dart';
import 'package:gaji_karyawan/dashboard.dart';
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
  final _textTotalController = TextEditingController();

  int gajiBersih = 1000000;

  int? selectedValue1;
  int? selectedValue2;

  void calculatePotonganGaji(int alpaCount) {
    int potonganGaji = alpaCount * 100000;
    int gajiBersih = 1000000 - potonganGaji;

    // Update nilai pada controller
    _textPotonganController.text = potonganGaji.toString();
    _textTotalController.text = gajiBersih.toString();
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
        color: Color.fromARGB(255, 10, 20, 24),
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
                      child: TextField(
                          controller: _textPotonganController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Potongan Gaji',
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
                          controller: _textTotalController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Gaji Bersih',
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
                              _textTotalController.text);

                          if (response) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Dashboard();
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
