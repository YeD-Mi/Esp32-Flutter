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
const String durumtxt = 'Durum Degistir';
const String statustxt = 'Statu Degistir';
const String useractivetxt = 'Durum: Aktif';
const String userpassivetxt = 'Durum: Pasif';
const String userstatutxt = 'Statu: Standart Kullanici';
const String adminstatutxt = 'Statu: Yonetici';
const String editusertxt1 = 'Basarili';
const String editusertxt2 = 'Kullanici bilgileri degistirildi.';
const String closetxt = 'Kapat';

//Admin Page
const String adminbartxt = 'Bölgeler';

//Profil Page
const String profilappbartxt = 'PROFIL';
const String editpasswordtxt = 'Sifreniz bos veya eski sifreniz olamaz!';
const String savetxt = 'Kaydet';
const String backtxt = 'Kapat';
const String passwordnewtxt = 'Sifre Degisti';
const String againlogintxt = 'Lutfen tekrar giris yap.';

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
const String datatableID = "ID";
const String datatableCurrent = "Akım";
const String datatableVoltage = "Volt";
const String datatableTemparature = "Sıcaklık";
const String datatableDate = "Tarih";

//http
final String registerUrl = 'http://sub.mryed.com/register.php';
final String loginUrl = 'http://sub.mryed.com/login.php';
final String usersUrl = 'http://sub.mryed.com/get_users.php';
final String searchUsers = 'http://sub.mryed.com/search.php';
final String updateUrl = 'http://sub.mryed.com/edit_users.php';
final RxnString regionUrl = RxnString();
