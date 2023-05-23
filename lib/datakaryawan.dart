import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gaji_karyawan/models.dart';
import 'package:gaji_karyawan/repository.dart';

class DataKaryawan extends StatefulWidget {
  const DataKaryawan({super.key});

  @override
  State<DataKaryawan> createState() => _DataKaryawanState();
}

class _DataKaryawanState extends State<DataKaryawan> {
  List<Karyawan> listKaryawan = [];
  RepositoryKaryawan repository = RepositoryKaryawan();

  getData() async {
    try {
      listKaryawan = await repository.getData();
      setState(() {});
    } catch (error) {
      // Tangani error dengan sesuai, misalnya tampilkan pesan kesalahan
      print('Error: $error');
      setState(() {
        listKaryawan = []; // Set listSiswa ke daftar kosong
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 0, 3, 4),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Data Karyawan",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
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
                            color: Color.fromARGB(255, 209, 239, 238),
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
            for (var karyawan in listKaryawan) ...[
              Padding(
                padding: const EdgeInsets.all(11),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 6, 65, 75),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ProfileDetailColumn(
                        title: 'Nama      : ' + karyawan.nama,
                      ),
                      ProfileDetailColumn(
                        title: 'Jabatan   : ' + karyawan.jabatan,
                      ),
                      ProfileDetailColumn(
                        title: 'NIP           : ' + karyawan.nip,
                      ),
                      ProfileDetailColumn(
                        title: 'TTL           : ' + karyawan.ttl,
                      ),
                      ProfileDetailColumn(
                        title: 'Alamat     : ' + karyawan.alamat,
                      ),
                    ],
                  ),
                ),
              ),
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
    return Column(
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
    );
  }
}
