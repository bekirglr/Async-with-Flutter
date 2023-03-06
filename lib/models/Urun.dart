class Urun {
  int _id;
  String _ad;
  String _aciklama;
  double _fiyat;

  Urun(this._id, this._ad, this._aciklama, this._fiyat);
  Urun.withId(this._id, this._ad, this._aciklama, this._fiyat);

  //Getter & Setter

  int get id => _id; //return işlemi görüyor
  set id(int value) {
    _id = value;
  }

  String get ad => _ad;
  set ad(String value) {
    _ad = value;
  }

  String get aciklama => _aciklama;
  set aciklama(String value) {
    _aciklama = value;
  }

  double get fiyat => _fiyat;
  set fiyat(double value) {
    _fiyat = value;
  }

  Map<String, dynamic> mapYap() {
    //    <key value> Neden dynamic tipi? çünkü dynamik yapısı bütün veri türlerini karşılıyor
    var map = Map<String, dynamic>(); // map oluşturduk

    map["ad"] = _ad;
    map["aciklama"] = _aciklama;
    map["fiyat"] = _fiyat;
    //Map'in öğelerini oluşruduk

    //Database'in ID verip vermediğini sorgulatacağız
    if (_id != null) {
      map["id"] = _id;
    } //ID değeri null ise buradan bir ID ver

    return map;
  }

  //map'i ürüne çevirme
  Urun.fromObject(dynamic o) {
    this._id = o["id"];
    this._ad = o["ad"];
    this._aciklama = o["aciklama"];
    this._fiyat = double.tryParse(o["fiyat"].toString());
    //sqfLite'da sadece number değeri tutulduğu için dönüştürme işlemi gerçekleştireceğiz
  }

}

