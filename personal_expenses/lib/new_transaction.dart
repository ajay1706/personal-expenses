import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return      Card(
      elevation: 5,

      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title'
              ),
              controller: titleController,
//                      onChanged: (val) => amountInput=val,

            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount'
              ),
              controller: amountController,
//                      onChanged: (val){
//                        titleInput = val;
//                      },
            ),
            FlatButton(
              child: Text("Add Transaction",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600
                ),),
              onPressed: (){
                print(titleController.text);

              },
            )

          ],
        ),
      ),
    );
  }
}
