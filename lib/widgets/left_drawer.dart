import 'package:flutter/material.dart';
import 'package:fool_sportswear/screens/menu.dart';
import 'package:fool_sportswear/screens/productlist_form.dart';
import 'package:fool_sportswear/widgets/product_card.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Fool Sportswear',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Seluruh produk sportswear terkini di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal, // Make text bold
                    color: Colors.white, // Set text color
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke Product
            // FormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductFormPage(),
                  ));
            },
          )
          // ListTile(
          //   leading: const Icon(Icons.newspaper),
          //   title: const Text('See Products'),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => MyHomePage(),
          //         ));
          //   },
          // )
        ],
      ),
    );
  }
}