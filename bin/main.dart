import 'dart:io';

import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/kasir.dart';

void main() {
  // Daftar Produk
  var daftarProduk = [
    Produk('Beras', 12000, 10),
    Produk('Gula', 15000, 20),
    Produk('Minyak', 18000, 10),
    Produk('kecap', 2000, 50),
  ];

  // Kasir
  var kasir = Kasir('Budi');

  // Keranjang
  var keranjang = Keranjang();

  while (true) {
    print('\n=== Menu Utama ===');
    print('1. Lihat Produk');
    print('2. Tambah Produk ke Keranjang');
    print('3. Hapus Produk dari Keranjang');
    print('4. Lihat Keranjang');
    print('5. Checkout');
    print('6. Laporan Penjualan');
    print('7. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        print('\n=== Daftar Produk ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print('${i + 1}. ${daftarProduk[i]}');
        }
        break;

      case '2':
        print('\n=== Tambah Produk ke Keranjang ===');
        for (var i = 0; i < daftarProduk.length; i++) {
          print('${i + 1}. ${daftarProduk[i]}');
        }
        stdout.write('Pilih produk (nomor): ');
        var index = int.tryParse(stdin.readLineSync()!) ?? 0;
        if (index < 1 || index > daftarProduk.length) {
          print('Pilihan tidak valid.');
          break;
        }
        stdout.write('Masukkan jumlah: ');
        var jumlah = int.tryParse(stdin.readLineSync()!) ?? 0;
        if (jumlah > 0) {
          keranjang.tambahProduk(daftarProduk[index - 1], jumlah);
        } else {
          print('Jumlah tidak valid.');
        }
        break;

      case '3':
        print('\n=== Hapus Produk dari Keranjang ===');
        keranjang.cetakKeranjang();
        stdout.write('Masukkan nama produk yang ingin dihapus: ');
        var nama = stdin.readLineSync()!;
        var produk = daftarProduk.firstWhere((p) => p.nama == nama, orElse: () => Produk('', 0, 0));
        if (produk.nama.isEmpty) {
          print('Produk tidak ditemukan.');
          break;
        }
        stdout.write('Masukkan jumlah: ');
        var jumlah = int.tryParse(stdin.readLineSync()!) ?? 0;
        keranjang.hapusProduk(produk, jumlah);
        break;

      case '4':
        print('\n=== Isi Keranjang ===');
        keranjang.cetakKeranjang();
        break;

      case '5':
        print('\n=== Checkout ===');
        var transaksi = Transaksi(keranjang);
        transaksi.cetakStruk();
        kasir.tambahTransaksi(transaksi);
        keranjang = Keranjang(); // Reset keranjang
        break;

      case '6':
        print('\n=== Laporan Penjualan ===');
        kasir.laporanPenjualan();
        break;

      case '7':
        print('Terima kasih telah menggunakan sistem POS.');
        return;

      default:
        print('Pilihan tidak valid. Coba lagi.');
    }
  }
}
