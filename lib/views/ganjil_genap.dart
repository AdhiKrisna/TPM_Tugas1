import 'package:flutter/material.dart';
import 'package:tugas_1/controllers/ganjil_genap_controller.dart';

class GanjilGenapPage extends StatefulWidget {
  const  GanjilGenapPage({super.key});
  @override
  State<GanjilGenapPage> createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  bool isPressed = false;
  final GanjilGenapController ganjilGenapController = GanjilGenapController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: ganjilGenapController.ganjilGenapC,
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
                hintText: 'Masukkan angka',
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 32.0),
            TextButton(
              onPressed: () {
                setState(() { 
                    isPressed = true;
                    ganjilGenapController.checkGanjilGenap(ganjilGenapController.ganjilGenapC.text);
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
               child: Text(
                'Cek Ganjil/Genap',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (isPressed)
              if(ganjilGenapController.ganjilGenapC.text.isEmpty)
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
                '${ganjilGenapController.ganjilGenapC.text} adalah bilangan ${ganjilGenapController.hasil}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
