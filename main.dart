

import 'package:flutter/material.dart';
// import 'package:sample/fetching_input.dart';
void main() {
  runApp(myCalculator());
}

class myCalculator extends StatelessWidget{
  const myCalculator({Key? key}) : super(key:key);
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      home: introduction(),
    );
  }
}



class introduction extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InputPage();
}


class InputPage extends State<introduction>{
  var number1=TextEditingController();
  var number2=TextEditingController();
  var result;
  var operation;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Input Page")),

      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(height: 50,
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: number1,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 3
                  ),
                ),
    ),
                ),
              ),
            ),

            Container(height: 50,
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: number2,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 3
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.green,
                    // width: 300,
                    // height: 50,
                    child: ElevatedButton(

                        onPressed: (){
                          result= int.parse(number1.text) + int.parse(number2.text);
                          print(result);
                          operation="+";
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> OutputPage(int.parse(number1.text),int.parse(number2.text),result,operation)));


                        },

                        child: Text("Addition",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.red),))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.green,
                    // width: 300,
                    // height: 50,
                    child: ElevatedButton(onPressed: (){
                      result= int.parse(number1.text) * int.parse(number2.text);
                      operation="*";
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OutputPage(int.parse(number1.text),int.parse(number2.text),result,operation)));


                    }, child: Text("Multipliation"))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.green,
                    // width: 300,
                    // height: 50,
                    child: ElevatedButton(onPressed: (){
                      result= int.parse(number1.text) / int.parse(number2.text);
                      operation="/";

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OutputPage(int.parse(number1.text),int.parse(number2.text),result,operation)));



                    }, child: Text("Division"))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.green,
                    // width: 300,
                    // height: 50,
                    child: ElevatedButton(onPressed: (){
                      result= int.parse(number1.text) - int.parse(number2.text);
                      operation="-";
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> OutputPage(int.parse(number1.text),int.parse(number2.text),result,operation)));

                    }, child: Text("Subtraction"))),
              ),
            ],)

          ],

        ),
      )
    );
  }

}

class OutputPage extends StatelessWidget{
  var inputnumber1;
  var inputnumber2;
  var output;
  var operation;
  OutputPage(this.inputnumber1,this.inputnumber2,this.output,this.operation);


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body:Center(
        child: Container(

          height: 300,
          child: Column(
            children: [
              Center(child: Text("YOUR INPUT")),
              Text("$inputnumber1  $operation  $inputnumber2",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.red)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(

                    color:  Colors.black,
                    child: Text("$output",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.red),textAlign:TextAlign.center,)),
              ),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);

              }, child: Text("BACK"))

            ],
          ),
        ),
      )

    );
  }
}





