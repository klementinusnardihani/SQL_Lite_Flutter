class Contact {
  int _id;
  String _name;
  String _phone;
  String _gaji;
  String _alamat;
  // konstruktor versi 1
  Contact(this._name, this._alamat, this._phone, this._gaji);

  // konstruktor versi 2: konversi dari Map ke Contact
  Contact.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._alamat = map['alamat'];
    this._phone = map['phone'];
    this._gaji = map['gaji'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get name => _name;
  String get alamat => _alamat;
  String get phone => _phone;
  String get gaji => _gaji;

  // setter
  set name(String value) {
    _name = value;
  }

  set alamat(String value) {
    _alamat = value;
  }
  set phone(String value) {
    _phone = value;
  }

  set gaji(String value) {
    _gaji = value;
  }

  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['alamat'] = alamat;
    map['phone'] = phone;
    map['gaji'] = gaji;
    return map;
  }

}