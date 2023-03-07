import 'package:flutter_application_1/models/Urun.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {
  String tblUrun = "urunler";
  String colId = "id";
  String colAd = "ad";
  String colAciklama = "aciklama";
  String colFiyat = "fiyat ";

  static final DbHelper _dbHelper = DbHelper._intenal();
  factory DbHelper() {
    return _dbHelper;
  }
  DbHelper._intenal();
  //_dbHelper değişkenimizin içine internal ı tanımlamış olduk

  /*
    Biz her seferinde new diyerek veritabanına yeniden bağlanmak istemiyoruz!
    Çünkü bir defa kurmuş olduğumuz bağlantıyı korumamız gerekiyor
    farklı farklı yeni bağlantılar oluşturmamalıyız
    Bu sebeple senkronizasyonu sağlamış oluyorum
    Oyuzden Static olarak çalışıyoruz
   */

  static Database? _db;
  //veri tabanına erişerek veriyi kullanmak istediğimi belirttim

  Future<Database> get db async {
    if (_db != null) {
      //database oluşturulmadıysa
      _db = await dbolustur();
    }
    return db;
    //eğer oluşturulmuşsa geriye döndür
  }
  //database'i async olarak başlatmak istiyorum
  //async = kullanıcının cihazda birden fazla işlemi aynanda yapmabilmesi (Asenkron)

  Future<Database> dbolustur() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //o uygulamanın dökümanlarına git
    String yol = directory.path + "eticaret.db"; //db nin path'ini ayarladık
    var eTicaretDb = await openDatabase(yol, version: 1, onCreate: olustur);
    return eTicaretDb;
  }

  void olustur(Database db, int version) async {
    await db.execute(
        "Creat table $tblUrun($colId integer primary key, $colAd text, $colAciklama text, $colFiyat int)");
    //execute sql cümleciğini çalıştırmaya yarıyor
  }

  Future<int> ekle(Urun urun) async {
    Database db = await this.db;
    var sonuc = await db.insert(tblUrun, urun.mapYap());
    return sonuc;
  }

  Future<int> getUrunler() async {
    Database db = await this.db;
    var sonuc = await db.rawQuery("SELECT * FROM $tblUrun");
    return sonuc;
  }
}
