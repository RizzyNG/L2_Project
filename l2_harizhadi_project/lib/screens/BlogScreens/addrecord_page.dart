import 'package:flutter/material.dart';
import 'package:l2_harizhadi_project/services/firestore_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  String bookAuthor;
  String bookTitle;
  String bookDescription;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Blog'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'UserName'),
                  validator: (val) => val.length == 0 ? "Enter UserName" : null,
                  onSaved: (val) => this.bookAuthor = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Content'),
                  validator: (val) => val.length == 0 ? 'Enter Content' : null,
                  onSaved: (val) => this.bookTitle = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Date'),
                  validator: (val) => val.length == 0 ? 'Enter Date' : null,
                  onSaved: (val) => this.bookDescription = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService().addBookData(bookAuthor, bookTitle, bookDescription);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
}
