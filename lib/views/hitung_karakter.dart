import 'package:flutter/material.dart';
import 'package:tugas_1/controllers/hitung_karakter_controller.dart';

class HitungKarakterPage extends StatefulWidget {
  const HitungKarakterPage({super.key});
  @override
  State<HitungKarakterPage> createState() => _HitungKarakterPageState();
}

class _HitungKarakterPageState extends State<HitungKarakterPage> {
  bool isPressed = false;
  String hasil = "";
  final HitungKarakterController hitungKarakterController = HitungKarakterController();
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
              controller: hitungKarakterController.hitungKarakterC,
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
                hintText: 'Masukkan karakter',
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
                  hitungKarakterController.checkKarakter(hitungKarakterController.hitungKarakterC.text);
                  hasil = hitungKarakterController.hasil;
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
                'Cek Jumlah Karakter',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (isPressed)
              if (hitungKarakterController.hitungKarakterC.text.isEmpty)
                Text(
                  'Masukkan karakter terlebih dahulu',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Panjang karakter: $hasil',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
