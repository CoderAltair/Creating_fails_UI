import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_creat/funksional.dart';
class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}
class _ListsState extends State<Lists> {
  TextEditingController nameC= TextEditingController();
  TextEditingController numberC=TextEditingController();
  List<Funksional> userList = [];
  @override
  void initState() {
    super.initState();
    addUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddList(context);
          },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(4.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList[index].name),
                        Text(userList[index].number),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap:(){ showEditList(context, userList[index],index); },
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,)),
                        SizedBox( height: 5.0,),
                        GestureDetector(
                            onTap: (){ showDeleteList(context, index); },
                            child: Icon(
                              Icons.delete,
                              color: Colors.black,)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void addUsers() {
    userList.add(Funksional("Abdulaliz", "+998991290449"));
    userList.add(Funksional("Azizbek", "+998938550449"));
    userList.add(Funksional("Xushnud", "+998935550480"));
    userList.add(Funksional("Shohzod", "+99891255048"));
    userList.add(Funksional("Qahramon", "+998945550219"));
    userList.add(Funksional("Jamshid", "+998998886552"));
    userList.add(Funksional("Suxail", "+998991440228"));
    userList.add(Funksional("Sofiya", "+998991290449"));
  }

  void showAddList(BuildContext context) {
    showDialog(context: context, builder: (BuildContext) {
      return AlertDialog(
        title: Text('Add new User'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Are you sure !'),
              TextField(
                controller: nameC,
                decoration: InputDecoration(
                hintText: 'Enter your real life'
              ),),
                TextField(
                controller: numberC,
                  decoration: InputDecoration(
                  hintText: 'Enter time'
                ),
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(onPressed: () {
           if(nameC.text.isNotEmpty){
             if(numberC.text.isNotEmpty){
               setState(() {
                 userList.add(
                     Funksional(nameC.text, numberC.text));
               });
             Navigator.of(context).pop();
             }
           }
           else {print('Enter real life !!!');}
            },
            child: Text('Yes'),),
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
          },
            child: Text('No'),),
        ],
      );
    });
  }
  void showEditList(BuildContext context,Funksional data,int index) {
    showDialog(context: context, builder: (BuildContext) {
      return AlertDialog(
        title: Text('Edit'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Are you sure !'),
              TextField(
                controller: nameC..text=data.name,
                decoration: InputDecoration(
                    hintText: 'Enter your real life'
                ),),
              TextField(
                controller: numberC..text=data.number,
                decoration: InputDecoration(
                    hintText: 'Enter time'
                ),
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(onPressed: () {
            if(nameC.text.isNotEmpty){
              if(numberC.text.isNotEmpty){
                setState(() {
                  userList.insert(
                    index,
                      Funksional(nameC.text, numberC.text));
                });
                Navigator.of(context).pop();
              }
            }
            else {print('Enter real life !!!');}
          },
            child: Text('Yes'),),
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
          },
            child: Text('No'),),
        ],
      );
    });
  }
  void showDeleteList(BuildContext context,int index) {
    showDialog(context: context, builder: (BuildContext) {
      return AlertDialog(
        title: Text('Delete'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Are you sure !'),
            ],
          ),
        ),
        actions: [
          FlatButton(onPressed: () {
            setState(() {
              userList.removeAt(index);
            });
            Navigator.of(context).pop();
          },
            child: Text('Yes'),),
          FlatButton(onPressed: () {
            Navigator.of(context).pop();
          },
            child: Text('No'),),
        ],
      );
    });
  }
}