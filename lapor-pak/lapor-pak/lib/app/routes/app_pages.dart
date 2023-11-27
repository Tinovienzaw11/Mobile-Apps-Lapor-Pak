import 'package:get/get.dart';

import '../modules/bantuan/bindings/bantuan_binding.dart';
import '../modules/bantuan/views/bantuan_view.dart';
import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/berita_detail/bindings/berita_detail_binding.dart';
import '../modules/berita_detail/views/berita_detail_view.dart';
import '../modules/buat_laporan/bindings/buat_laporan_binding.dart';
import '../modules/buat_laporan/views/buat_laporan_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/detail_laporan/bindings/detail_laporan_binding.dart';
import '../modules/detail_laporan/views/detail_laporan_view.dart';
import '../modules/disdukcapil/bindings/disdukcapil_binding.dart';
import '../modules/disdukcapil/views/disdukcapil_view.dart';
import '../modules/disdukcapil_form/bindings/disdukcapil_form_binding.dart';
import '../modules/disdukcapil_form/views/disdukcapil_form_view.dart';
import '../modules/diskusi/bindings/diskusi_binding.dart';
import '../modules/diskusi/views/diskusi_view.dart';
import '../modules/diskusi_create/bindings/diskusi_create_binding.dart';
import '../modules/diskusi_create/views/diskusi_create_view.dart';
import '../modules/diskusi_detail/bindings/diskusi_detail_binding.dart';
import '../modules/diskusi_detail/views/diskusi_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kontak/bindings/kontak_binding.dart';
import '../modules/kontak/views/kontak_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pelaporan/bindings/pelaporan_binding.dart';
import '../modules/pelaporan/views/pelaporan_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/setting_akun/bindings/setting_akun_binding.dart';
import '../modules/setting_akun/views/setting_akun_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.BANTUAN,
      page: () => BantuanView(),
      binding: BantuanBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK,
      page: () => KontakView(),
      binding: KontakBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PELAPORAN,
      page: () => PelaporanView(),
      binding: PelaporanBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_LAPORAN,
      page: () => BuatLaporanView(),
      binding: BuatLaporanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LAPORAN,
      page: () => DetailLaporanView(),
      binding: DetailLaporanBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.BERITA_DETAIL,
      page: () => BeritaDetailView(),
      binding: BeritaDetailBinding(),
    ),
    GetPage(
      name: _Paths.DISKUSI,
      page: () => DiskusiView(),
      binding: DiskusiBinding(),
    ),
    GetPage(
      name: _Paths.DISKUSI_DETAIL,
      page: () => DiskusiDetailView(),
      binding: DiskusiDetailBinding(),
    ),
    GetPage(
      name: _Paths.DISKUSI_CREATE,
      page: () => DiskusiCreateView(),
      binding: DiskusiCreateBinding(),
    ),
    GetPage(
      name: _Paths.DISDUKCAPIL,
      page: () => DisdukcapilView(),
      binding: DisdukcapilBinding(),
    ),
    GetPage(
      name: _Paths.DISDUKCAPIL_FORM,
      page: () => DisdukcapilFormView(),
      binding: DisdukcapilFormBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_AKUN,
      page: () => SettingAkunView(),
      binding: SettingAkunBinding(),
    ),
  ];
}
