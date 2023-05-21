import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
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
                    "Daftar Gaji",
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 33, 34),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ProfileDetailColumn(
                      title: 'Nama',
                    ),
                    ProfileDetailColumn(
                      title: 'Jabatan',
                    ),
                    // for (var siswa in listSiswa)
                    ProfileDetailColumn(
                      title: 'Izin',
                    ),
                    ProfileDetailColumn(
                      title: 'Alpa',
                    ),
                    ProfileDetailColumn(
                      title: 'Potongan Gaji',
                    ),
                    ProfileDetailColumn(
                      title: 'Total',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 320,
            height: 10,
          )
        ],
      ),
    );
  }
}