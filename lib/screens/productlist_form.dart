import 'package:flutter/material.dart';
import 'package:fool_sportswear/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:fool_sportswear/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "Jerseys";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    'Jerseys',
    'Pants',
    'Shoes',
    'Socks',
    'Accessories',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk Baru',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF6A1B9A),
              const Color(0xFF8E24AA),
              Colors.white,
            ],
            stops: const [0.0, 0.15, 0.15],
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card container for form fields
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          const Text(
                            'Informasi Produk',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6A1B9A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(color: Color(0xFF6A1B9A), thickness: 2),
                          const SizedBox(height: 20),

                          // Name Field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Masukkan nama produk",
                              labelText: "Nama Produk",
                              labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
                              prefixIcon: const Icon(Icons.shopping_bag, color: Color(0xFF6A1B9A)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _name = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Nama tidak boleh kosong!";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Price Field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Masukkan harga produk",
                              labelText: "Harga Produk",
                              labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
                              prefixIcon: const Icon(Icons.attach_money, color: Color(0xFF6A1B9A)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String? value) {
                              setState(() {
                                _price = int.tryParse(value ?? '') ?? 0;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Harga tidak boleh kosong!";
                              }
                              if (int.tryParse(value) == null) {
                                return "Harga harus berupa angka!";
                              }
                              if (int.parse(value) <= 0) {
                                return "Harga harus lebih dari 0!";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Category Field
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "Kategori",
                              labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
                              prefixIcon: const Icon(Icons.category, color: Color(0xFF6A1B9A)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
                              ),
                            ),
                            value: _category,
                            items: _categories
                                .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(cat),
                            ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _category = newValue!;
                              });
                            },
                          ),
                          const SizedBox(height: 16),

                          // Description Field
                          TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: "Masukkan deskripsi produk",
                              labelText: "Deskripsi Produk",
                              labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
                              prefixIcon: const Icon(Icons.description, color: Color(0xFF6A1B9A)),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _description = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Deskripsi tidak boleh kosong!";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Thumbnail Field
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Masukkan URL thumbnail",
                              labelText: "URL Thumbnail",
                              labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
                              prefixIcon: const Icon(Icons.image, color: Color(0xFF6A1B9A)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _thumbnail = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "URL tidak boleh kosong!";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Featured Switch
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3E5F5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SwitchListTile(
                              title: const Text(
                                "Produk Unggulan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF6A1B9A),
                                ),
                              ),
                              subtitle: const Text("Tandai sebagai produk unggulan"),
                              value: _isFeatured,
                              activeColor: const Color(0xFF6A1B9A),
                              onChanged: (bool value) {
                                setState(() {
                                  _isFeatured = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final response = await request.postJson(
                            "https://rafa-pradipta-foolsportswear.pbp.cs.ui.ac.id/create-flutter/",
                            jsonEncode({
                              "name": _name,
                              "price": _price,
                              "description": _description,
                              "category": _category,
                              "thumbnail": _thumbnail,
                              "isFeatured": _isFeatured ? "Ya" : "Tidak",
                            }),
                          );
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Produk berhasil disimpan!"),
                                  backgroundColor: Color(0xFF6A1B9A),
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Terjadi kesalahan, silakan coba lagi."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save, size: 24),
                          SizedBox(width: 8),
                          Text(
                            "Simpan Produk",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
