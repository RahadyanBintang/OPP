import 'produk.dart';

class Keranjang {
  Map<Produk, int> items = {};

  void tambahProduk(Produk produk, int jumlah) {
    if (produk.stok >= jumlah) {
      items.update(produk, (existing) => existing + jumlah, ifAbsent: () => jumlah);
      produk.stok -= jumlah;
    } else {
      print('Stok ${produk.nama} tidak mencukupi.');
    }
  }

  void hapusProduk(Produk produk, int jumlah) {
    if (items.containsKey(produk) && items[produk]! >= jumlah) {
      items[produk] = items[produk]! - jumlah;
      if (items[produk] == 0) items.remove(produk);
      produk.stok += jumlah;
    } else {
      print('Produk tidak ditemukan di keranjang.');
    }
  }

  double hitungTotal() {
    return items.entries.fold(
        0.0, (total, entry) => total + (entry.key.harga * entry.value));
  }

  void cetakKeranjang() {
    if (items.isEmpty) {
      print('Keranjang kosong.');
    } else {
      items.forEach((produk, jumlah) {
        print('${produk.nama} x$jumlah = Rp${(produk.harga * jumlah).toStringAsFixed(2)}');
      });
    }
    print('Total: Rp${hitungTotal().toStringAsFixed(2)}');
  }
}
