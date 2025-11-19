import 'package:flutter/material.dart';
import 'package:fool_sportswear/models/product_entry.dart';
import 'package:fool_sportswear/widgets/left_drawer.dart';
import 'package:fool_sportswear/screens/product_detail.dart';
import 'package:fool_sportswear/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

enum FilterType { all, my, featured }

class ProductEntryListPage extends StatefulWidget {
  final FilterType initialFilter;

  const ProductEntryListPage({super.key, this.initialFilter = FilterType.all});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late FilterType _filterType;

  @override
  void initState() {
    super.initState();
    _filterType = widget.initialFilter;
  }
  Future<List<ProductEntry>> fetchNews(CookieRequest request) async {
    final url = _filterType == FilterType.my
        ? 'https://rafa-pradipta-foolsportswear.pbp.cs.ui.ac.id/json/my/'
        : 'https://rafa-pradipta-foolsportswear.pbp.cs.ui.ac.id/json/';

    final response = await request.get(url);
    var data = response;

    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }
    if (_filterType == FilterType.featured) {
      listProducts = listProducts.where((p) {
        final val = p.isFeatured;
        if (val == null) return false;
        if (val is bool) return val == true;
      }).toList();
    }
    return listProducts;
  }
  String _filterLabel() {
    switch (_filterType) {
      case FilterType.my:
        return 'Produk Saya';
      case FilterType.featured:
        return 'Produk Unggulan';
      case FilterType.all:
      default:
        return 'Semua Produk';
    }
  }

  IconData _filterIcon() {
    switch (_filterType) {
      case FilterType.my:
        return Icons.person;
      case FilterType.featured:
        return Icons.star;
      case FilterType.all:
      default:
        return Icons.people;
    }
  }


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
          margin: const EdgeInsets.only(right: 8),
          child: PopupMenuButton<FilterType>(
            tooltip: 'Filter products',
            onSelected: (FilterType selected) {
              setState(() {
                _filterType = selected;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: FilterType.all,
                child: Row(
                  children: const [
                    Icon(Icons.people, color: Color(0xFF6A1B9A)),
                    SizedBox(width: 8),
                    Text('Semua Produk'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: FilterType.my,
                child: Row(
                  children: const [
                    Icon(Icons.person, color: Color(0xFF6A1B9A)),
                    SizedBox(width: 8),
                    Text('Produk Saya'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: FilterType.featured,
                child: Row(
                  children: const [
                    Icon(Icons.star, color: Color(0xFF6A1B9A)),
                    SizedBox(width: 8),
                    Text('Produk Unggulan'),
                  ],
                ),
              ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _filterType == FilterType.all ? Colors.white : const Color(0xFF8E24AA),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF6A1B9A).withOpacity(0.15)),
          ),
          child: Row(
            children: [
              Icon(
                _filterIcon(),
                color: _filterType == FilterType.all ? const Color(0xFF6A1B9A) : Colors.white,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                _filterLabel(),
                style: TextStyle(
                  color: _filterType == FilterType.all ? const Color(0xFF6A1B9A) : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.arrow_drop_down,
                color: _filterType == FilterType.all ? const Color(0xFF6A1B9A) : Colors.white,
              ),
            ],
          ),
        ),
      ),
    ),
    ],
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
              const Color(0xFFF3E5F5),
            ],
            stops: const [0.0, 0.01, 0.01],
          ),
        ),
        child: FutureBuilder(
          future: fetchNews(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6A1B9A)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Memuat produk...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6A1B9A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            } if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _filterType == FilterType.my ? Icons.inventory_2_outlined : Icons.shopping_bag_outlined,
                      size: 80,
                      color: const Color(0xFF6A1B9A).withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _filterType == FilterType.my
                          ? 'Anda belum memiliki produk'
                          : 'Belum ada produk di Fool Sportswear',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF6A1B9A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _filterType == FilterType.my
                          ? 'Tambahkan produk pertama Anda!'
                          : 'Jadilah yang pertama menambahkan produk',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFF6A1B9A).withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  // Header with product count
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.inventory_2,
                          color: const Color(0xFF6A1B9A),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${snapshot.data!.length} Produk Ditemukan',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6A1B9A),
                          ),
                        ),
                        const Spacer(),
                        // small label to indicate active filter
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6A1B9A).withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _filterLabel(),
                            style: const TextStyle(color: Color(0xFF6A1B9A), fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Product list
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          }
  ),
  ),
  );
}
}