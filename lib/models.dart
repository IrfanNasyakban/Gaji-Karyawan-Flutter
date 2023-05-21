class Karyawan {
  String nama;
  String jabatan;
  String nip;
  String ttl;
  String alamat;
  String id;

  Karyawan({
    required this.nama,
    required this.jabatan,
    required this.nip,
    required this.ttl,
    required this.alamat,
    required this.id,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) {
    return Karyawan(
      nama: json['nama'],
      jabatan: json['jabatan'],
      nip: json['nip'],
      ttl: json['ttl'],
      alamat: json['alamat'],
      id: json['id'],
    );
  }
}

class Gaji {
  String nama;
  String jabatan;
  String izin;
  String alpa;
  String potongan_gaji;
  String gaji_bersih;
  String id;

  Gaji({
    required this.nama,
    required this.jabatan,
    required this.izin,
    required this.alpa,
    required this.potongan_gaji,
    required this.gaji_bersih,
    required this.id,
  });

  factory Gaji.fromJson(Map<String, dynamic> json) {
    return Gaji(
      nama: json['nama'],
      jabatan: json['jabatan'],
      izin: json['izin'],
      alpa: json['alpa'],
      potongan_gaji: json['potongan_gaji'],
      gaji_bersih: json['gaji_bersih'],
      id: json['id'],
    );
  }
}
