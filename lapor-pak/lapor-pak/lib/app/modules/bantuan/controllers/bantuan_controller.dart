import 'package:get/get.dart';

class BantuanController extends GetxController {
  final newssContent = '''Fitur News Lapor Pak! merupakan salah satu fitur pada aplikasi Lapor Pak! ''' +
      '''yang bertujuan untuk memberikan informasi atau berita terkini terutama seputar perkembangan dan ''' +
      '''update dari kota Purwakarta kepada pengguna aplikasi.\n\nTata cara penggunaan fitur News Lapor Pak! ''' +
      '''sebagai berikut:\n\n1.Buka aplikasi Lapor Pak! pada perangkat mobile anda.\n2.Pilih menu News Lapor Pak! yang terdapat pada halaman utama aplikasi.\n''' +
      '''3.Anda akan diarahkan ke halaman berita, dimana terdapat beberapa artikel terbaru yang bisa anda baca.\n''' +
      '''4.Untuk membaca artikel, klik pada judul artikel yang ingin dibaca.\n5.Setelah membaca artikel, anda bisa menekan tombol "Kembali" untuk kembali ke halaman utama News Lapor Pak!.\n''' +
      '''Dengan fitur News Lapor Pak!, pengguna aplikasi bisa mendapatkan informasi terkini seputar perkembangan dari kota Purwakarta secara mudah dan cepat.''';

  final disdukCapilContent =
      '''Menu Disdukcapil berisi Informasi lengkap mengenai layanan dan syarat yang dibutuhkan saat mengurus ''' +
          '''keperluaan anda di Disduk Capil, selain itu juga terdapat Informasi mengenai Alamat Kantor Disduk Capil Kota''' +
          ''' Kendari berdasarkan Maps.\nCaranya :\n1.Klik Pilih Layanan\n2.Pilih layanan yang Anda inginkan\n3.Lalu ''' +
          '''akan tertera informasi lengkap tentang layanan yang Anda butuhkan di Disduk Capil''';

  final laporanContent = '''Menu pelaporan adalah bagian dari fitur yang disediakan oleh aplikasi Lapor Pak untuk ''' +
      '''memudahkan pengguna dalam melaporkan kerusakan fasilitas umum atau pelayanan publik. Fitur ini ''' +
      '''memungkinkan pengguna untuk membuat laporan kerusakan dengan cepat dan mudah melalui aplikasi.\n\n''' +
      '''Berikut adalah tata cara penggunaan fitur pelaporan di Lapor Pak:\n\n''' +
      '''1.Buka aplikasi Lapor Pak pada smartphone Anda.\n''' +
      '''2.Pilih menu Pelaporan pada halaman utama aplikasi.\n''' +
      '''3.Pilih kategori pelaporan yang sesuai dengan jenis kerusakan yang ingin dilaporkan.\n''' +
      '''4.Isi informasi yang dibutuhkan dalam formulir pelaporan, seperti deskripsi kerusakan, lokasi kerusakan, dan lain sebagainya.''' +
      '''5.Tambahkan foto kerusakan jika diperlukan\n''' +
      '''6.Tekan tombol "Kirim" untuk mengirim laporan kerusakan ke sistem.\n''' +
      '''7.Tunggu konfirmasi dari sistem yang menandakan bahwa laporan kerusakan Anda telah diterima.\n''' +
      '''8.Pantau perkembangan status laporan kerusakan Anda melalui aplikasi Lapor Pak.\n''' +
      '''Dalam menggunakan fitur pelaporan di Lapor Pak, pastikan untuk mengisi informasi dengan benar dan jelas ''' +
      '''sehingga petugas responsif dapat dengan mudah memahami dan menangani laporan Anda. Selain itu, pastikan ''' +
      '''juga untuk memilih kategori pelaporan yang sesuai dengan jenis kerusakan yang dilaporkan.''';

  final dimasContent = '''Menu DIMAS (Diskusi Masyarakat) pada aplikasi Lapor Pak adalah fitur yang memungkinkan pengguna untuk ''' +
      '''berdiskusi dan mencari solusi bersama atas permasalahan publik. Pengguna dapat memposting permasalahan ''' +
      '''yang dihadapi melalui gambar, video, komentar, atau bentuk lainnya, dan meminta masukan atau saran dari ''' +
      '''pengguna lain atau pihak berwenang.\n\nBerikut adalah tata cara penggunaan fitur Dimas:\n\n''' +
      '''1.Buka aplikasi Lapor Pak dan pilih menu Dimas.\n2.Klik tombol "Tambah Diskusi" untuk memulai posting baru.\n''' +
      '''3.Isi judul dan deskripsi singkat mengenai permasalahan yang ingin dibahas.\n4.Tambahkan gambar atau video jika ''' +
      '''diperlukan untuk memperjelas permasalahan yang dihadapi.\n5.Pilih kategori permasalahan yang sesuai.\n''' +
      '''6.Klik tombol "Post" untuk memposting diskusi.\n7.Pengguna lain dapat memberikan tanggapan atau saran pada diskusi ''' +
      '''dengan membalas atau memberikan komentar.\n8.Diskusi juga dapat diberi tanda "disukai" atau "dilaporkan" jika diperlukan.\n''' +
      '''9.Pihak berwenang atau pemangku kepentingan dapat menanggapi atau memberikan solusi atas permasalahan yang diposting.\n''' +
      '''Dengan fitur Diskusi Masyarakat di Lapor Pak, pengguna dapat berpartisipasi aktif dalam mencari solusi ''' +
      '''bersama atas permasalahan publik dan juga dapat berinteraksi dengan pengguna lain atau pihak berwenang.''';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
