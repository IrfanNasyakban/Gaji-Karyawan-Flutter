import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaji_karyawan/datakaryawan.dart';
import 'package:gaji_karyawan/gaji.dart';
import 'package:gaji_karyawan/login.dart';
import 'package:gaji_karyawan/mainpage.dart';
import 'package:gaji_karyawan/milihkaryawan.dart';
import 'package:gaji_karyawan/profile.dart';
import 'package:gaji_karyawan/riwayat.dart';
import 'package:gaji_karyawan/riwayatkaryawan.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  Items item1 = new Items(
    title: "Data Karyawan",
    img: "assets/calendar.png",
    nextPage: DataKaryawan(),
  );

  Items item2 = new Items(
      title: "Profile", img: "assets/food.png", nextPage: ProfileKaryawan());
  Items item3 = new Items(
      title: "Input Gaji", img: "assets/map.png", nextPage: MilihKaryawan());
  Items item4 = new Items(
      title: "Riwayat Gaji", img: "assets/map.png", nextPage: Riwayat());
  Items item5 = new Items(
      title: "Riwayat Gaji",
      img: "assets/map.png",
      nextPage: RiwayatKaryawan());

  @override
  Widget build(BuildContext context) {
    String userEmail = user.email!;

    List<Items> myList = [
      if (userEmail == "puput@admin.com") item1,
      if (userEmail == "puput@admin.com") item3,
      if (userEmail == "puput@admin.com") item4,
      if (userEmail != "puput@admin.com") item2,
      if (userEmail != "puput@admin.com") item5,
      Items(
        title: "Keluar",
        img: "assets/festival.png",
        nextPage: MainPage(),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false,
            );
          }).catchError((error) {
            print('Logout Error: $error');
          });
        },
      ),
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(29),
        crossAxisCount: 2,
        crossAxisSpacing: 28,
        mainAxisSpacing: 28,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              // Aksi yang dijalankan saat item di-klik
              if (data.onPressed != null) {
                data.onPressed!(); // Panggil fungsi onPressed jika tidak null
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => data.nextPage),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(height: 14),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 14),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String img;
  Widget nextPage;
  VoidCallback? onPressed;

  Items({
    required this.title,
    required this.img,
    required this.nextPage,
    this.onPressed,
  });
}
