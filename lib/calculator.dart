import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double number1 = 0.0;
  double number2 = 0.0;
  String operation = "";
  String resoult = "";
  String output = "";
  Color btnColor = colorForBtns[i];
  Color txtColor = colorForTxts[i];

  btnclick(String btnText) {
    try {
      switch (btnText) {
        case "C":
          resoult = "";
          number1 = 0.0;
          number2 = 0.0;
          operation = "";
          break;
        case "+":
        case "-":
        case "×":
        case "÷":
        case "%":
          number1 = double.parse(output);
          operation = btnText;
          resoult = "";
          break;
        case ".":
          if (resoult.contains(".")) {
          } else if (resoult == "") {
            resoult = "0$resoult$btnText";
            // resoult = "0" + resoult + btnText;
          } else {
            resoult = resoult + btnText;
          }
          break;
//-number إضافة إشارة ناقص
        case "(+/-)":
          if (resoult == "") {
            resoult = "-$resoult";
          } else if (resoult.isNotEmpty) {
            // } else if (resoult.length > 0) {
          } else {
            resoult = resoult + btnText;
          }
          break;
        case "del":
          resoult = resoult.substring(0, output.length - 1);
          //(substring):
          // تعيد النص ضمن مجال معين
          //وهنا حددت المجال من أول مححرف الى قبل أخر محرف
          //أي أنه سيعيد النص من دون أخر محرف وهو المطلوب
          break;
        case "=":
          number2 = double.parse(output);
          switch (operation) {
            case "+":
              resoult = (number1 + number2).toString();
              break;
            case "-":
              resoult = (number1 - number2).toString();
              break;
            case "×":
              resoult = (number1 * number2).toString();
              break;
            case "÷":
              resoult = (number1 / number2).toString();
              break;
            case "%":
              resoult = (number1 % number2).toString();
              break;
          }
          number1 = 0.0;
          number2 = 0.0;
          operation = "";
          break;
        default:
          resoult = resoult + btnText;
          break;
      }

      setState(() {
        if (resoult == "") {
          output = "0";
        } else {
          output = resoult;
        }
      });
    } catch (e) {
      return;
    }
  }

//إنشاء زر وتمرير النص الظاهر ولون النص ولون الزر
  Widget btnbuild(String btnText, Color btnColor, Color txtColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: btnColor,
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => btnclick(btnText),
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 20,
              color: txtColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens, size: 30, color: txtColor),
            onPressed: () {
              setState(() {
                if (colorForTxts.length - 1 > i) {
                  i = i + 1;
                  btnColor = colorForBtns[i];
                  txtColor = colorForTxts[i];
                } else {
                  i = 0;
                  btnColor = colorForBtns[i];
                  txtColor = colorForTxts[i];
                }
                // print(i);
              });
            },
          ),
          const Padding(padding: EdgeInsets.only(right: 15)),
        ],
        backgroundColor: btnColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "MyCalculator",
            style:
                TextStyle(fontSize: 35, color: txtColor, fontFamily: "ruslan"),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 40.0,
                  color: btnColor,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10), child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    btnbuild("C", txtColor, btnColor),
                    btnbuild("del", txtColor, btnColor),
                    btnbuild("%", txtColor, btnColor),
                    btnbuild("÷", txtColor, btnColor),
                  ],
                ),
                Row(
                  children: <Widget>[
                    btnbuild("7", btnColor, txtColor),
                    btnbuild("8", btnColor, txtColor),
                    btnbuild("9", btnColor, txtColor),
                    btnbuild("×", txtColor, btnColor),
                  ],
                ),
                Row(
                  children: <Widget>[
                    btnbuild("4", btnColor, txtColor),
                    btnbuild("5", btnColor, txtColor),
                    btnbuild("6", btnColor, txtColor),
                    btnbuild("-", txtColor, btnColor),
                  ],
                ),
                Row(
                  children: <Widget>[
                    btnbuild("1", btnColor, txtColor),
                    btnbuild("2", btnColor, txtColor),
                    btnbuild("3", btnColor, txtColor),
                    btnbuild("+", txtColor, btnColor),
                  ],
                ),
                Row(
                  children: <Widget>[
                    btnbuild("(+/-)", txtColor, btnColor),
                    btnbuild("0", btnColor, txtColor),
                    btnbuild(".", btnColor, txtColor),
                    btnbuild("=", txtColor, btnColor),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
