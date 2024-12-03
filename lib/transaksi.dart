import 'keranjang.dart';

class Transaksi {
  DateTime tanggal;
  Map<String, int> items;
  double total;

  Transaksi(Keranjang keranjang)
      : tanggal = DateTime.now(),
        items = keranjang.items.map((k, v) => MapEntry(k.nama, v)),
        total = keranjang.hitungTotal();

  void cetakStruk() {
    print('--- Struk Belanja ---');
    print('Tanggal: ${tanggal}');
    items.forEach((nama, jumlah) {
      print('$nama x$jumlah');
    });
    print('Total: Rp${total.toStringAsFixed(2)}');
    print('----------------------');
  }
}
