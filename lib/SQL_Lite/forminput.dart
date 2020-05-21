import 'package:flutter/material.dart';
import 'package:sql_lite/SQL_Lite/kontak.dart';

class FormInput extends StatefulWidget {
  final Contact contact;
  FormInput(this.contact);
  @override
  FormInputState createState() => FormInputState(this.contact);
}
//class controller
class FormInputState extends State<FormInput> {
  Contact contact;
  FormInputState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gajiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (contact != null) {
      nameController.text = contact.name;
      alamatController.text = contact.alamat;
      phoneController.text = contact.phone;
      gajiController.text = contact.gaji;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: contact == null ? Text('Tambah Data') : Text('Edit Data'),
          leading: Icon(Icons.view_list),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              // nama
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //alamat
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // telepon
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Telepon',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: gajiController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Gaji',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // tombol button
              Padding (
                padding: EdgeInsets.only(top:15.0, bottom:10.0, left: 160.0,),
                child: Row(
                  children: <Widget> [
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.0,
                        ),
                        onPressed: () {
                          if (contact == null) {
                            // tambah data
                            contact = Contact(nameController.text, alamatController.text, phoneController.text, gajiController.text);
                          } else {
                            // ubah data
                            contact.name = nameController.text;
                            contact.alamat = alamatController.text;
                            contact.phone = phoneController.text;
                            contact.gaji = gajiController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, contact);
                        },
                      ),
                    ),
                    Container(width: 10.0,),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}