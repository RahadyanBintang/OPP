import 'transaksi.dart';

class Kasir {
  String nama;
  List<Transaksi> daftarTransaksi = [];

  Kasir(this.nama);

  void tambahTransaksi(Transaksi transaksi) {
    daftarTransaksi.add(transaksi);
    print('Transaksi berhasil ditambahkan.');
  }

  void laporanPenjualan() {
    print('--- Laporan Penjualan ---');
    if (daftarTransaksi.isEmpty) {
      print('Belum ada transaksi.');
    } else {
      daftarTransaksi.forEach((transaksi) {
        print(
            '${transaksi.tanggal}: Rp${transaksi.total.toStringAsFixed(2)}');
      });
    }
    print('--------------------------');
  }
}
