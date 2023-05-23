import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaji_karyawan/models.dart';
import 'package:gaji_karyawan/repository.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatKaryawan extends StatefulWidget {
  const RiwayatKaryawan({super.key});

  @override
  State<RiwayatKaryawan> createState() => _RiwayatKaryawanState();
}

class _RiwayatKaryawanState extends State<RiwayatKaryawan> {
  final user = FirebaseAuth.instance.currentUser!;

  List<Gaji> listGaji = [];
  RepositoryGaji repository = RepositoryGaji();

  getDataId() async {
    try {
      listGaji = await repository.getDataId();
      setState(() {});
    } catch (error) {
      // Tangani error dengan sesuai, misalnya tampilkan pesan kesalahan
      print('Error: $error');
      setState(() {
        listGaji = []; // Set listImage ke daftar kosong
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataId();
  }

  @override
  Widget build(BuildContext context) {
    String userEmail = user.email!;
    String username;

    if (userEmail == 'meydiana@gmail.com') {
      username = 'Meydiana';
    } else {
      username = 'Enisa Warni';
    }

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 51, 78, 78),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 34, 132, 162),
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
            for (var gaji in listGaji) ...[
              Padding(
                padding: const EdgeInsets.all(11),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 15, 60, 124),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ProfileDetailColumn(
                        title: 'Nama         : ' + gaji.nama,
                      ),
                      ProfileDetailColumn(
                        title: 'Jabatan      : ' + gaji.jabatan,
                      ),
                      ProfileDetailColumn(
                        title: 'Izin              : ' + gaji.izin,
                      ),
                      ProfileDetailColumn(
                        title: 'Alpa            : ' + gaji.alpa,
                      ),
                      ProfileDetailColumn(
                        title: 'Potongan   : ' + gaji.potongan_gaji,
                      ),
                      ProfileDetailColumn(
                        title: 'Gaji Pokok  : ' + gaji.gaji_pokok,
                      ),
                      ProfileDetailColumn(
                        title: 'Tunjangan   : ' + gaji.tunjangan,
                      ),
                      ProfileDetailColumn(
                        title: 'Bonus   : ' + gaji.bonus,
                      ),
                      ProfileDetailColumn(
                        title: 'Total Gaji : ' + gaji.gaji_pokok,
                      ),
                    ],
                  ),
                ),
              )
            ]
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
