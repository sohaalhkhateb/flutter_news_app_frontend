import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}
int x = 0;
int y = 0;
String op = '';
String equal = '';
String result = '';
String inputNumber1 = '';
String inputNumber2 = '';
int? x1;
int? y1;

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    String num1 = (funnum1(inputNumber1)).toString();
    String num2 = (funnum2(inputNumber2)).toString();
    String str = '$x $op $y $result';

    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Column(
        children: [
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.purpleAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Center(
              child: Text(
                '$x $op $y $result',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 25.0,
              ),
              IconButton(onPressed: ()
              {

              },
                  icon: Icon(Icons.access_time,
                color: Colors.purple,),
              ),

              SizedBox(
                width: 25.0,
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.horizontal_rule_rounded,
                color: Colors.purple,))
              ,
              SizedBox(
                width: 25.0,
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.pivot_table_chart_outlined,
                color: Colors.purple,),),

              SizedBox(
                width: 110.0,
              ),
              IconButton(onPressed: ()
              {
                setState(() {
                  inputNumber1 = removeCharacter(inputNumber1, 1);
                  inputNumber2 = removeCharacter(inputNumber1, 2);

                });
              }, icon: Icon(Icons.backspace_outlined,
                color: Colors.purple,),),

            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
              indent: 20,
              endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      inputNumber1 = '';
                      inputNumber2 = '';
                      x = 0;
                      y = 0;
                      op = '';
                      result = '';
                    });
                  },
                  child: Text(
                    'C',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: (){},
                  child: Text(
                    '()',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      op = '%';
                    });
                  },
                  child: Text(
                    '%',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      op = '÷';

                    });
                  },
                  child: Text(
                    '÷',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                      funnum1('7');
                      inputNumber1 += '7';
                      x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('7');
                        inputNumber2 += '7';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '7',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('8');
                        inputNumber1 += '8';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('8');
                        inputNumber2 += '8';
                        y = int.parse(inputNumber2);
                      }
                    });
                  },
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('9');
                        inputNumber1 += '9';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('9');
                        inputNumber2 += '9';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '9',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 24.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      setState(() {
                        op = '*';
                      });

                    });
                  },
                  child: Text(
                    '×',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('4');
                        inputNumber1 += '4';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('4');
                        inputNumber2 += '4';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '4',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('5');
                        inputNumber1 += '5';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('5');
                        inputNumber2 += '5';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '5',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('6');
                        inputNumber1 += '6';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('6');
                        inputNumber2 += '6';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '6',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 26.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      setState(() {
                        op = '-';
                      });

                    });
                  },
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('1');
                        inputNumber1 += '1';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('1');
                        inputNumber2 += '1';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('2');
                        inputNumber1 += '2';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('2');
                        inputNumber2 += '2';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('3');
                        inputNumber1 += '3';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('3');
                        inputNumber2 += '3';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 26.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      op = '+';
                    });

                  },
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 27, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: (){},
                  child: Text(
                    '+/-',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14.0,

                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: ()
                  {
                    setState(() {
                      if(op == ''){
                        funnum1('0');
                        inputNumber1 += '0';
                        x = int.parse(inputNumber1);
                      }
                      if(op == '+' || op == '-' || op == '*' || op == '÷' || op == "%"){
                        funnum2('0');
                        inputNumber2 += '0';
                        y = int.parse(inputNumber2);

                      }
                    });
                  },
                  child: Text(
                    '0',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.purple[300],
                ),
                  onPressed: (){},
                  child: Text(
                    '.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 25.0,
                    ),
                  )
              ),
              SizedBox(
                width: 26.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.pink,
                ),
                  onPressed: ()
                  {
                    setState(() {
                      equal = '=';
                        result = resultOperation(x, y, op, equal);
                        resultOperation(x, y, op, equal);
                    });

                  },
                  child: Text(
                    '=',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );

  }
  String resultOperation(int x,int y,String op,String equal)
  {
    if(equal == '=') {
      switch (op) {
        case '+':
          return '=  ${x + y}';
        case '-':
          return '=  ${x - y}';
        case '*':
          return '=  ${x * y}';
        case '÷':
          if(y != 0) {
            return '=  ${x / y}';
          }
          else{
            throw 'divide by zero';
          }
        case '%':
          return '=  ${x % y}';
        default:
          return '';
      }
    }
    else{
      return '';
    }
  }
String funnum1(String x)
  {
    return x;
  }
  String funnum2(String y)
  {
    return y;
  }
}
String removeCharacter(String input, int index){
  if(index < 0 || index >= input.length)
  {
    throw RangeError('Index is out of range');
  }
  return input.substring(0, index) + input.substring(index + 1);
}
