import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculater());
}
class MyCalculater extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculater",
        home: Calculater(),
      );

  }
}
class Calculater extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculater();
  }
}
class _Calculater extends State<Calculater>{
  String text = '0';
  double numOne =0;
  double numTwo =0;
  String result = '0';
  String finalResult = '0';
  String opr ='';
  String preOpr='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end ,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            )
,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("C",Color(0xffa5a5a5),1),
                Button("+/-",Color(0xffa5a5a5),1),
                Button("%",Color(0xffa5a5a5),1),
                Button("/",Color(0xffff9800),1),
              ],
            )
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("7",Colors.deepPurple,1),
                Button("8",Colors.deepPurple,1),
                Button("9",Colors.deepPurple,1),
                Button("X",Color(0xffff9800),1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("4",Colors.deepPurple,1),
                Button("5",Colors.deepPurple,1),
                Button("6",Colors.deepPurple,1),
                Button("-",Color(0xffff9800),1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("1",Colors.deepPurple,1),
                Button("2",Colors.deepPurple,1),
                Button("3",Colors.deepPurple,1),
                Button("+",Color(0xffff9800),1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button("0",Colors.deepPurple,0),
                Button(".",Colors.deepPurple,1),
                Button("=",Color(0xffff9800),1),
              ],
            )
          ],
        ),
      ),
    );
  }
 Widget Button(String btntxt, Color color, int num){
    Container container = null;
    if(num==0){
      container=  Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(onPressed: (){
          calculatemethod(btntxt);
        },
          child: Text(
            btntxt,
            style: TextStyle(
                fontSize: 30
            ),
          ),
          color: color,
          padding: EdgeInsets.only(left: 81,top: 20,right: 81,bottom: 20),
          shape: StadiumBorder(),
        ),

      );
    }
    else {
     container=  Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(onPressed: (){
          calculatemethod(btntxt);
        },
          child: Text(
            btntxt,
            style: TextStyle(
                fontSize: 30
            ),
          ),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    }
return container;
 }
  void calculatemethod(txtBtn) {
    if(txtBtn == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && txtBtn == '=' ){
      switch(preOpr) {
        case '+':
          finalResult =  add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'X':
          finalResult = mult();
          break;
        case '/':
          finalResult = div();
          break;
      }
    } else if(txtBtn == '+' || txtBtn == '-' || txtBtn == 'X' || txtBtn == '/' || txtBtn == '=') {
     if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      switch(opr){
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'X':
          finalResult = mult();
          break;
        case '/':
          finalResult = div();
          break;
      }
      preOpr =  opr;
      opr = txtBtn;
      result = '';
    } else if (txtBtn  == '%') {
      result = (numOne / 100).toString();
      finalResult = result;
    }
    else if(txtBtn=='.'){
      if(!result.contains('.'))
        result+='.';
      finalResult = result;
    }
    else if(txtBtn=='+/-'){
      result.startsWith('-')? result.substring(1): result='-'+result;
      finalResult = result;
    }
    else {
      if (result == '0')
        result = txtBtn;
      else
        result = result + txtBtn;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }
  String add(){
    result = (numOne+numTwo).toString();
    numOne= double.parse(result);
    return decimalRemove(result);
  }
  String sub(){
    result = (numOne-numTwo).toString();
    numOne= double.parse(result);
    return decimalRemove(result);
  }
  String mult (){
    result = (numOne*numTwo).toString();
    numOne= double.parse(result);
    return decimalRemove(result);
  }
  String div(){
    result = (numOne/numTwo).toString();
    numOne= double.parse(result);
 return  decimalRemove(result);
  }
  String decimalRemove(String _result) {

    if (_result.contains('.')) {
      List<String> split = _result.split('.');
      //[11, 0]
      if(!(int.parse(split[1]) > 0))
        return split[0];
    }
    return _result;
  }
}
