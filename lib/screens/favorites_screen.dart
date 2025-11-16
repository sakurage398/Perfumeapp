import 'package:flutter/material.dart';
import '../models/perfume.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  // Pre-loaded favorite perfumes
  static const List<Perfume> favoritePerfumes = [
    Perfume(
      id: '1',
      name: 'Midnight Rose',
      brand: 'Luxe Paris',
      price: 89.99,
      category: 'Floral',
      description: 'A captivating blend of roses and sandalwood with hints of vanilla',
      rating: 4.8,
      reviews: 245,
      imageUrl: 'assets/images/perfume1.png',
    ),
    Perfume(
      id: '3',
      name: 'Vanilla Dream',
      brand: 'Sweet Essence',
      price: 65.00,
      category: 'Sweet',
      description: 'Warm vanilla with hints of caramel and white musk',
      rating: 4.9,
      reviews: 312,
      imageUrl: 'assets/images/perfume3.png',
    ),
    Perfume(
      id: '7',
      name: 'Black Orchid',
      brand: 'Elite Noir',
      price: 120.00,
      category: 'Oriental',
      description: 'Luxurious black orchid with dark chocolate and patchouli',
      rating: 4.9,
      reviews: 421,
      imageUrl: 'assets/images/perfume7.png',
    ),
    Perfume(
      id: '10',
      name: 'Jasmine Night',
      brand: 'Moon Blossom',
      price: 85.00,
      category: 'Floral',
      description: 'Night-blooming jasmine with white musk and neroli',
      rating: 4.8,
      reviews: 289,
      imageUrl: 'assets/images/perfume10.png',
    ),
    Perfume(
      id: '13',
      name: 'Oud Royale',
      brand: 'Arabian Nights',
      price: 150.00,
      category: 'Woody',
      description: 'Premium oud wood with rose and saffron',
      rating: 4.9,
      reviews: 176,
      imageUrl: 'assets/images/perfume13.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF1565C0), // Deep blue (bottom-right)
              Color(0xFFBBDEFB), // Light sky blue (top-left)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Perfume Grid or Empty State
              Expanded(
                child: favoritePerfumes.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              size: 100,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'No favorites yet',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Start adding your favorite perfumes',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: favoritePerfumes.length,
                        itemBuilder: (context, index) {
                          final perfume = favoritePerfumes[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(perfume: perfume),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image Section: Pure WHITE background
                                  Expanded(
                                    child: Container(
                                      color: Colors.white, // ← Pure white, no gradient
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                          child: Image.asset(
                                            perfume.imageUrl,
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                            height: double.infinity,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.broken_image,
                                                    size: 60,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    'Image not found',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Details Section
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          perfume.brand,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          perfume.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${perfume.rating}',
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              ' (${perfume.reviews})',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '\$${perfume.price.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}