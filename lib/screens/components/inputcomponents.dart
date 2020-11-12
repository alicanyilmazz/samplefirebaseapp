import 'package:flutter/material.dart';
var txtName = TextEditingController();
bool _nameValidate = false;
String _name;
buildNameField() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14),
    child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color:Colors.orange.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 80.0,
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.start,
        controller: txtName,
        textDirection: TextDirection.ltr,
        autofocus: false,
        autocorrect: true,
        maxLines: 1,
        decoration: InputDecoration(
          errorText: _nameValidate ? 'Name not be empty' : null,
          hintText: "Enter a name",
          labelText: "Name",
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.short_text,
            color: Colors.pink,
          ),
          icon: Icon(
            Icons.text_fields,
            color: Colors.orange,
          ),
          suffixIcon: Icon(
            Icons.mode_edit,
            color: Colors.purple,
          ),
          filled: true,
          fillColor: Colors.orange.shade200,
        ),
        maxLength: 20,
        maxLengthEnforced: true,
        onChanged: (String e) {
          _name=e;
        },
        onSubmitted: (String e) {
        },
        cursorColor: Colors.pink,
      ),
    ),
  );
  ///////////////
}

bool fieldValidate() {
  txtName.text.isEmpty ? _nameValidate = true : _nameValidate = false;
  if((_nameValidate==true)){
    debugPrint("Opps Validation Error!");
    return false;
  }else{
    debugPrint("Process Completed!");
    return true;
  }
}

FlatButton SaveButton() {
  return FlatButton(
    onPressed: () {

        if(fieldValidate()){
          //addProduct();
        }

    },
    child: Text(
      "Save",
      style: TextStyle(color: Colors.white),
    ),
    color: Colors.cyan,
  );
}