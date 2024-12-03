class Produk {
  String nama;
  double harga;
  int stok;

  Produk(this.nama, this.harga, this.stok);

  @override
  String toString() => '$nama - Rp${harga.toStringAsFixed(2)} (Stok: $stok)';
}
