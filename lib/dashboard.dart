import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    String userEmail = user.email!;
    String username;

    if (userEmail == 'meydiana@gmail.com') {
      username = 'Meydiana';
    } else if (userEmail == 'enisa@gmail.com') {
      username = 'Enisa Warni';
    } else if (userEmail == 'salsa@gmail.com') {
      username = 'Salsabila';
    } else {
      username = 'Puput';
    }

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 225, 230, 225),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Text(
              username,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "PT. Amarta Karya",
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 90,
            ),
            GridDashboard()
          ],
        ),
      ),
    );
  }
}
