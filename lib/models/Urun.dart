import 'dart:ffi';

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
}
