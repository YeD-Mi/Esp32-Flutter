//Login Page
import 'package:get/get_rx/src/rx_types/rx_types.dart';

const String loginappbar = 'ESP32 Proje';
const String loginbutton = 'Giriş Yap';
const String signupbutton = 'Kayıt Ol';
const String usernametxt = 'Kullanıcı Adı';
const String passwordtxt = 'Şifre';
const String noUsertxt = 'Kullanici Yok. Kod:3';
const String wrongPasswordtxt = 'Yanlis Parola. Kod:4';
const String deletedusertxt = 'Kullanici Silinmis. Kod:5';

//Users Page
const String userappbartxt = 'KULLANICILAR';
const String searchtxt = 'Ara';
const String edittxt = 'Düzenle';
const String deletetxt = 'Sil';
const String useractivetxt = 'Durum: Aktif';
const String userpassivetxt = 'Durum: Pasif';
const String userstatutxt = 'Statu: Standart Kullanici';
const String adminstatutxt = 'Statu: Yonetici';

//Admin Page
const String adminbartxt = 'Bölgeler';

//Register Page
const String registerapptxt = 'Üye Kaydı';
const String registernick = 'Kullanıcı Adı';
const String registermail = 'E-Posta Adresi';
const String registerpassword = 'Şifre';
const String againpasswordtxt = 'Şifre Tekrarı';
const String registerregion = 'Bölge';
const String mistaketitle = 'Hata!';
const String mistakecomment = 'Eksik bilgi verildi. Kod:1';
const String passworderror = 'Sifreler Eslesmiyor. Kod:2';
const String successfultxt = 'Kayit Basarili.';
const String welcometxt = 'Hosgeldin ';

//Home Page
const String homeappbar = 'Cihaz Analizi';
const String exittxt = 'Çıkış';
const String alluserstxt = 'Kullanicilar';
const String suggestiontxt = "Öneri ve Şikayet";
const String mailtxt = "bilgi@mryed.com";
const String abouttxt = "Hakkımızda";
const String aboutcomment =
    "Cihazların ölçmüş olduğu volt, amper ve sıcaklık bilgilerini buradan görebilirsiniz.";
const String profiltxt = "Profil";

//http
final String registerUrl = 'http://sub.mryed.com/esp32/register.php';
final String loginUrl = 'http://sub.mryed.com/esp32/login.php';
final String usersUrl = 'http://sub.mryed.com/esp32/get_users.php';
final String searchUsers = 'http://sub.mryed.com/esp32/search.php';
final RxnString regionUrl = RxnString('http://sub.mryed.com/esp32/get_ege.php');

@override
void onInit() {
  regionUrl;
}
