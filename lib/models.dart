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
  String gaji_pokok;
  String tunjangan;
  String bonus;
  String total_gaji;
  String id;

  Gaji({
    required this.nama,
    required this.jabatan,
    required this.izin,
    required this.alpa,
    required this.potongan_gaji,
    required this.gaji_pokok,
    required this.tunjangan,
    required this.bonus,
    required this.total_gaji,
    required this.id,
  });

  factory Gaji.fromJson(Map<String, dynamic> json) {
    return Gaji(
      nama: json['nama'],
      jabatan: json['jabatan'],
      izin: json['izin'],
      alpa: json['alpa'],
      potongan_gaji: json['potongan_gaji'],
      gaji_pokok: json['gaji_pokok'],
      tunjangan: json['tunjangan'],
      bonus: json['bonus'],
      total_gaji: json['total_gaji'],
      id: json['id'],
    );
  }
}
