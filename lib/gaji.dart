import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gaji_karyawan/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class Gaji extends StatefulWidget {
  const Gaji({super.key});

  @override
  State<Gaji> createState() => _GajiState();
}

class _GajiState extends State<Gaji> {
  @override
  Widget build(BuildContext context) {
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
                            fontWeight: FontWeight.w600)),
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
                          // controller: _textSemesterController,
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
                          // controller: _textSemesterController,
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
                      child: TextField(
                          // controller: _textSemesterController,
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Izin/Sakit',
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
                          // controller: _textSemesterController,
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Alpa',
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
                          // controller: _textSemesterController,
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
                          // controller: _textSemesterController,
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
                      onPressed: () {},
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
