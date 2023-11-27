import 'package:get/get.dart';

class DisdukcapilController extends GetxController {
  final contentDisdukcapil = '''Berikut adalah persyaratan yang harus disiapkan:\n''' +
      '''1. Dokumen Identitas:\n''' +
      '''   •  Pastikan Anda memiliki salinan Kartu Keluarga (KK) yang masih berlaku.\n''' +
      '''   •  Persiapkan juga dokumen identitas diri seperti KTP atau surat keterangan lahir bagi anak-anak yang belum memiliki KTP.\n\n''' +
      '''2. Bukti Alamat:\n''' +
      '''   •  Sertakan salinan dokumen yang membuktikan alamat tempat tinggal Anda, seperti tagihan listrik, air, atau telepon.\n''' +
      '''   •  Jika Anda tinggal di tempat sewa, pastikan Anda memiliki surat kontrak sewa atau surat pernyataan dari pemilik rumah.\n\n''' +
      '''3. Foto Terbaru:\n''' +
      '''   •  Sertakan foto terbaru Anda dengan latar belakang warna biru atau merah.\n''' +
      '''   •  Pastikan foto memiliki kualitas yang baik dan jelas.\n\n''' +
      '''4. Syarat Usia:\n''' +
      '''   •  Untuk pendaftaran e-KTP, pastikan Anda telah mencapai usia minimal yang ditentukan oleh peraturan setempat. Biasanya, usia minimal adalah 17 tahun.\n\n''' +
      '''Himbauan tambahan yang dapat diberikan kepada pengguna adalah:\n''' +
      '''   •  Pastikan semua dokumen yang diunggah telah dalam bentuk file digital yang jelas dan terbaca.\n''' +
      '''   •  Periksa kembali semua informasi yang diisi pada form pendaftaran e-KTP untuk memastikan keakuratan dan kelengkapan data.\n''' +
      '''   •  Jika terdapat pertanyaan atau kebingungan mengenai persyaratan atau proses pendaftaran, pengguna dapat menghubungi kontak yang tersedia di menu Disdukcapil atau mengunjungi kantor Disdukcapil terdekat untuk mendapatkan bantuan lebih lanjut. ''';

  final contentDokumenIdentitas =
      '''1. Pastikan Anda memiliki salinan Kartu Keluarga (KK) yang masih berlaku.\n''' +
          '''2. Persiapkan juga dokumen identitas diri seperti KTP atau surat keterangan lahir bagi anak-anak yang belum memiliki KTP.''';

  final contentBuktiAlamat =
      '''1. Sertakan salinan dokumen yang membuktikan alamat tempat tinggal Anda, seperti tagihan listrik, air, atau telepon.\n''' +
          '''2. Jika Anda tinggal di tempat sewa, pastikan Anda memiliki surat kontrak sewa atau surat pernyataan dari pemilik rumah.''';

  final contentFotoTerbaru =
      '''1. Sertakan foto terbaru Anda dengan latar belakang warna biru atau merah.\n''' +
          '''2. Pastikan foto memiliki kualitas yang baik dan jelas.''';

  final contentSyaratUsia =
      '''Untuk pendaftaran e-KTP, pastikan Anda telah mencapai usia minimal yang ditentukan oleh peraturan setempat. Biasanya, usia minimal adalah 17 tahun.''';

  final contentHimbauan =
      '''1. Pastikan semua dokumen yang diunggah telah dalam bentuk file digital yang jelas dan terbaca.\n''' +
          '''2. Periksa kembali semua informasi yang diisi pada form pendaftaran e-KTP untuk memastikan keakuratan dan kelengkapan data.\n''' +
          '''3. Jika terdapat pertanyaan atau kebingungan mengenai persyaratan atau proses pendaftaran, pengguna dapat menghubungi kontak yang tersedia di menu Disdukcapil atau mengunjungi kantor Disdukcapil terdekat untuk mendapatkan bantuan lebih lanjut. ''';

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
