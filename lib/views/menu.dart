import 'package:flutter/material.dart';
import 'package:tugas_1/routes/route_names.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    String username =  ModalRoute.of(context)!.settings.arguments as String? ?? 'Guest';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            bool? confirmLogout = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Konfirmasi Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    'Yakin ingin logout?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            if (confirmLogout == true) {
              Navigator.pushReplacementNamed(
                context,
                RouteName.login,
              );
              showSnackbar(context, 'Logout Berhasil', Colors.green);
            }
          },
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hai, $username',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 75,
              padding: const EdgeInsets.all(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Row(
                  spacing: 15,
                  children: [
                    Icon(Icons.person, size: 24,color: Colors.white),
                    const Text(
                      'Biodata Kelompok',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, RouteName.biodata),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 75,
              padding: const EdgeInsets.all(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Row(
                  spacing: 15,
                  children: [
                    Icon(Icons.calculate, size: 24,color: Colors.white),
                    const Text(
                      'Kalkulator',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onPressed: () => Navigator.pushNamed(
                  context,
                  RouteName.kalkulator,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 75,
              padding: const EdgeInsets.all(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Row(
                  spacing: 15,
                  children: [
                    Icon(Icons.calculate, size: 24,color: Colors.white),
                    const Text(
                      'Ganjil Genap',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onPressed: () => Navigator.pushNamed(
                  context,
                  RouteName.ganjilGenap,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: 75,
              padding: const EdgeInsets.all(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Row(
                  spacing: 15,
                  children: [
                    Icon(Icons.calculate, size: 24,color: Colors.white),
                    const Text(
                      'Hitung Karakter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onPressed: () => Navigator.pushNamed(
                  context,
                  RouteName.hitungKarakter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 void showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }