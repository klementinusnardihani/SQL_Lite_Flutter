import 'package:flutter/material.dart';
//letak package folder flutter
import 'package:sql_lite/SQL_Lite/forminput.dart';
import 'package:sql_lite/SQL_Lite/kontak.dart';
import 'package:sql_lite/SQL_Lite/database_helper.dart';
import 'package:sqflite/sqflite.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Contact> contactList;
  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = List<Contact>();
    }
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.view_list),
        title: Text('Grosir App'),
         actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.add, color: Colors.black,),
             onPressed: () async {
              var contact = await navigateToFormInput(context, null);
              if (contact != null) addContact(contact);
            },
          )
        ],
      ),
      body: createListView(),
    );
  }

  Future<Contact> navigateToFormInput(BuildContext context, Contact contact) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return FormInput(contact);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
          var listTile = ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.people),
            ),
            title: Text(this.contactList[index].name, style: textStyle,),
            subtitle:Text(this.contactList[index].alamat + ' | ' + this.contactList[index].phone + ' | Rp.' + this.contactList[index].gaji),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.red,),
              onTap: () {
                deleteContact(contactList[index]);
              },
            ),
            onTap: () async {
              var contact = await navigateToFormInput(context, this.contactList[index]);
              if (contact != null) editContact(contact);
            },
          );
        return Card(
          color: Colors.white,
          elevation: 3.0,
          child: listTile,
        );
      },
    );
  }
  //buat contact
  void addContact(Contact object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }
  //edit contact
  void editContact(Contact object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }
  //delete contact
  void deleteContact(Contact object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  } 
  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = dbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }

}

