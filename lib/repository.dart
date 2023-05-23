import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaji_karyawan/models.dart';
import 'package:http/http.dart' as http;

class RepositoryKaryawan {
  final user = FirebaseAuth.instance.currentUser!;
  final _baseUrl = 'https://6469d024183682d61446d6ee.mockapi.io';

  Future<List<Karyawan>> getData() async {
    final response = await http.get(Uri.parse(_baseUrl + '/karyawan'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Karyawan> karyawanList =
          responseData.map((json) => Karyawan.fromJson(json)).toList();
      return karyawanList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<Karyawan>> getDataId() async {
    String userEmail = user.email!;
    String username;

    if (userEmail == 'meydiana@gmail.com') {
      username = 'Meydiana';
    } else {
      username = 'Enisa Warni';
    }

    final response = await http.get(Uri.parse(_baseUrl + '/karyawan'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Karyawan> karyawanList = responseData
          .map((json) => Karyawan.fromJson(json))
          .where((karyawan) => karyawan.nama == username)
          .toList();
      return karyawanList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class RepositoryGaji {
  final user = FirebaseAuth.instance.currentUser!;
  final _baseUrl = 'https://6469d024183682d61446d6ee.mockapi.io';

  Future<List<Gaji>> getData() async {
    final response = await http.get(Uri.parse(_baseUrl + '/gaji'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Gaji> gajiList =
          responseData.map((json) => Gaji.fromJson(json)).toList();
      return gajiList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<Gaji>> getDataId() async {
    String userEmail = user.email!;
    String username;

    if (userEmail == 'meydiana@gmail.com') {
      username = 'Meydiana';
    } else {
      username = 'Enisa Warni';
    }

    final response = await http.get(Uri.parse(_baseUrl + '/gaji'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Gaji> gajiList = responseData
          .map((json) => Gaji.fromJson(json))
          .where((gaji) => gaji.nama == username)
          .toList();
      return gajiList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future postData(
      String nama,
      String jabatan,
      String izin,
      String alpa,
      String potongan_gaji,
      String gaji_pokok,
      String tunjangan,
      String bonus,
      String total_gaji) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/gaji'), body: {
        "nama": nama,
        "jabatan": jabatan,
        "izin": izin,
        "alpa": alpa,
        "potongan_gaji": potongan_gaji,
        "gaji_pokok": gaji_pokok,
        "tunjangan": tunjangan,
        "bonus": bonus,
        "total_gaji": total_gaji
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
