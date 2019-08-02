import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {

 List<Widget> todoList=<Widget>[
      ToDoWidget("ToDo 1"," message message message message message message message message message message 1",DateTime.now()),
      Divider(),
      ToDoWidget("ToDo 2"," message message message message message message message message message message 2",DateTime.now()),
      Divider(),
      ToDoWidget("ToDo 3"," message message message message message message message message message message 3",DateTime.now()),
      Divider(),
      ToDoWidget("ToDo 4"," message message message message message message message message message message 4",DateTime.now()),
      Divider(),
      ToDoWidget("ToDo 5"," message message message message message message message message message message 5",DateTime.now()),
      Divider(),


 ];

  @override
  Widget build(BuildContext context) {
    var onNavigationBarTap=(int index){
          print(index);
      };

      var bottomNavigationBar=BottomNavigationBar(onTap:onNavigationBarTap,items:[
        BottomNavigationBarItem(icon:Icon(Icons.home),title: Text("Home"),backgroundColor: Colors.white),
        BottomNavigationBarItem(icon:Icon(Icons.add),title: Text("Add"),backgroundColor: Colors.white),
      ],backgroundColor: Colors.purple,
    );

    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:Scaffold(
        bottomNavigationBar:bottomNavigationBar , 
          appBar:AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("To-Do List"),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(Icons.border_color),
              ),
            ],
          backgroundColor: Colors.purple,
        ) ,
        body: ListView(
          children: <Widget>[
            Container(child: Column(children: this.todoList,),color: Colors.purple[100],)
          ],
        ),
      ),
    );
  }
}

class ToDoWidget extends StatefulWidget {
  final String title;
  final String message;
  final DateTime date;

  ToDoWidget(this.title,this.message,this.date);

  @override
    State<StatefulWidget> createState(){
    return ToDoState(this.title,this.message,this.date);
  }
}

class ToDoState extends State<ToDoWidget> {
  String title;
  String message;
  DateTime date;

  ToDoState(this.title,this.message,this.date);
  
  @override
  Widget build(BuildContext context) {
    String dateString="Created"+this.date.day.toString()+"/"+this.date.month.toString()+"/"+this.date.year.toString();
    
    var message=Expanded(
      child:SingleChildScrollView(
      child:Padding(
        padding:EdgeInsets.only(top: 10.0),
           child:Text(this.message,textAlign: TextAlign.justify,
           ),
        ),
      ),
     );


    var titleController=TextEditingController(text: this.title);

    var textTitleFieldDecoration=InputDecoration(border: InputBorder.none);
 
    var textTitleFieldStyle=TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,color: Colors.deepPurple);

    var title=TextField(
      controller: titleController,
      decoration: textTitleFieldDecoration,
      style: textTitleFieldStyle,

      );

    var dateCreated=Text(dateString);


    var todoCard=Column(
      children: <Widget>[title,message,dateCreated],
      crossAxisAlignment: CrossAxisAlignment.start,
      );
    return Container(
      width: 400.0,
      height: 200.0,
      alignment: Alignment.centerLeft,
      
      constraints: BoxConstraints(maxHeight: 150.0,maxWidth: 1000.0,),
      padding: EdgeInsets.fromLTRB(10 ,10, 10, 15),
      child: todoCard,
    );
  }
}