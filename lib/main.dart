import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MahasiswaList extends StatelessWidget {
  final List<String> namaMahasiswa;
  final List<String> nimMahasiswa;
  final int nomorAbsen;

  const MahasiswaList(
      {super.key,
      required this.namaMahasiswa,
      required this.nimMahasiswa,
      required this.nomorAbsen});

  @override
  Widget build(BuildContext context) {
    int jumlahMahasiswa = namaMahasiswa.length;

    List<Widget> mahasiswaWidgets = [];

    for (int i = nomorAbsen - 2; i <= nomorAbsen + 2; i++) {
      int index = i % jumlahMahasiswa;
      if (index < 0) {
        index += jumlahMahasiswa;
      }

      String nama = namaMahasiswa[index];
      String nim = nimMahasiswa[index];

      Color backgroundColor = index == nomorAbsen ? Colors.green : Colors.white;

      mahasiswaWidgets.add(Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $nama', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 5),
            Text('NIM: $nim',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: mahasiswaWidgets,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mahasiswa List'),
        ),
        body: const MahasiswaList(
          namaMahasiswa: [
            'Wawan Setiawan',
            'Anugerah Bagus',
            'Agung Supra',
            'Linda Vespa',
            'Asep Karbu'
          ],
          nimMahasiswa: [
            'STI202102390',
            'STI202102306',
            'STI202102876',
            'STI202102074',
            'STI202102645'
          ],
          nomorAbsen: 1,
        ),
      ),
    );
  }
}
