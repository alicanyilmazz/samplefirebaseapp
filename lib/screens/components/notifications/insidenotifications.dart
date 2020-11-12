import 'package:flutter/material.dart';

void callSnackBar({GlobalKey<ScaffoldState> key, String message,IconData icon,Color iconColor,Color textColor,FontWeight fontWeight}) {
  key.currentState.showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon,color: iconColor,),
          Text(message,style: TextStyle(color:textColor,fontWeight: fontWeight),),
          SizedBox(width: 50,),
        ],
      ),
      backgroundColor: Colors.amberAccent));
}

// Custom Alert Dialog
Future<bool> showCustomAlertDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 200,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Are you sure you wish to delete this item?",
                  ),
                ),
                SizedBox(
                  width: 320.0,
                  child: RaisedButton(
                    color: Color(0xFF1BC0C5),
                    onPressed: (){},
                    child: Text("Confirm",style: TextStyle(color:Colors.white,),),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}