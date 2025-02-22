import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_1/controllers/kalkulator_controller.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});
  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  List<bool> isPressed = [false, false, false, false];
  double angka1 = 0, angka2 = 0;
  double hasil = 0;
  final KalkulatorController kalkulatorController = KalkulatorController();
  void checkOperator(int index) {
    setState(() {
      // isPressed = [false, false, false, false];
        // isPressed[index] = !isPressed[index];
      // if(!isPressed[index]){
      // }

      if(!isPressed[index]){
        isPressed = [false, false, false, false];
        isPressed[index] = true;
      }
      else{
        isPressed[index] = false;
      }
    });
  }

  void setAngka() {
    angka1 = double.tryParse(kalkulatorController.angka1C.text) ?? 0;
    angka2 = double.tryParse(kalkulatorController.angka2C.text) ?? 0;
  }

  void calculate() => hasil = isPressed[0]
      ? kalkulatorController.calculate(angka1, angka2, '+')
      : isPressed[1]
          ? kalkulatorController.calculate(angka1, angka2, '-')
          : isPressed[2]
              ? kalkulatorController.calculate(angka1, angka2, '*')
              : isPressed[3]
                  ? kalkulatorController.calculate(angka1, angka2, '/')
                  : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            onChanged: (value) {
              setState(() {
                setAngka();
                calculate();
              });
            },
            controller: kalkulatorController.angka1C,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Masukkan angka 1',
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: isPressed[0] ? Colors.green : Colors.white,
                  ),
                  icon: Icon(Icons.add),
                  iconSize: 32.0,
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      checkOperator(0);
                      setAngka();
                      calculate();
                    });
                  }),
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: isPressed[1] ? Colors.green : Colors.white,
                  ),
                  icon: Icon(Icons.remove),
                  iconSize: 32.0,
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      checkOperator(1);
                      setAngka();
                      calculate();
                    });
                  }),
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: isPressed[2] ? Colors.green : Colors.white,
                  ),
                  icon: Icon(Icons.clear),
                  iconSize: 32.0,
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      checkOperator(2);
                      setAngka();
                      calculate();
                    });
                  }),
              IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: isPressed[3] ? Colors.green : Colors.white,
                  ),
                  icon: Icon(CupertinoIcons.divide),
                  iconSize: 32.0,
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      checkOperator(3);
                      setAngka();
                      calculate();
                    });
                  }),
            ],
          ),
          SizedBox(height: 32.0),
          TextField(
            onChanged: (value) {
              setState(() {
                setAngka();
                calculate();
              });
            },
            controller: kalkulatorController.angka2C,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Masukkan angka 2',
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 32.0),
          if (kalkulatorController.angka1C.text.isEmpty ||
              kalkulatorController.angka2C.text.isEmpty)
            Text(
              'Masukkan angka terlebih dahulu',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Text(
              'Hasil: $hasil',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
        ]),
      ),
    );
  }
}
