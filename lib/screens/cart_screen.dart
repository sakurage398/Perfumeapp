import 'package:flutter/material.dart';
import '../models/perfume.dart';
import 'product_detail_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Mutable cart items (now stateful)
  List<Perfume> cartPerfumes = [
    const Perfume(
      id: '2',
      name: 'Ocean Breeze',
      brand: 'Aqua Collection',
      price: 75.50,
      category: 'Fresh',
      description: 'Fresh marine notes with citrus undertones and sea salt',
      rating: 4.6,
      reviews: 189,
      imageUrl: 'assets/images/perfume2.png',
    ),
    const Perfume(
      id: '6',
      name: 'Lavender Fields',
      brand: 'Provence',
      price: 70.00,
      category: 'Floral',
      description: 'Calming lavender with hints of jasmine and chamomile',
      rating: 4.8,
      reviews: 278,
      imageUrl: 'assets/images/perfume6.png',
    ),
    const Perfume(
      id: '11',
      name: 'Spiced Rum',
      brand: 'Caribbean Soul',
      price: 92.00,
      category: 'Spicy',
      description: 'Rich rum accord with cinnamon and vanilla',
      rating: 4.6,
      reviews: 234,
      imageUrl: 'assets/images/perfume11.png',
    ),
    const Perfume(
      id: '14',
      name: 'Coconut Paradise',
      brand: 'Tropical Vibes',
      price: 52.00,
      category: 'Sweet',
      description: 'Creamy coconut with tiare flower and vanilla',
      rating: 4.5,
      reviews: 298,
      imageUrl: 'assets/images/perfume14.png',
    ),
  ];

  void _removeItem(int index) {
    setState(() {
      cartPerfumes.removeAt(index);
    });
  }

  void _proceedToCheckout() {
    if (cartPerfumes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Navigate to checkout (placeholder)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckoutPlaceholderScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = cartPerfumes.fold(0, (sum, perfume) => sum + perfume.price);
    final double shipping = cartPerfumes.isEmpty ? 0.0 : 8.99;
    final double total = subtotal + shipping;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF1565C0),
              Color(0xFFBBDEFB),
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
                      'My Cart',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${cartPerfumes.length} items',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              // Cart Items or Empty State
              Expanded(
                child: cartPerfumes.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 100,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Add some perfumes to get started',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          // Cart Items List
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: cartPerfumes.length,
                              itemBuilder: (context, index) {
                                final perfume = cartPerfumes[index];
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
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    color: Colors.white,
                                    margin: const EdgeInsets.only(bottom: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          // Product Image (White Background)
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: Image.asset(
                                                perfume.imageUrl,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return const Icon(
                                                    Icons.broken_image,
                                                    size: 40,
                                                    color: Colors.grey,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          // Product Details
                                          Expanded(
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
                                                const SizedBox(height: 2),
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
                                                    const Icon(Icons.star, size: 14, color: Colors.amber),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      '${perfume.rating}',
                                                      style: const TextStyle(fontSize: 12),
                                                    ),
                                                    Text(
                                                      ' (${perfume.reviews})',
                                                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Price & Remove
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\$${perfume.price.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue.shade700,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              IconButton(
                                                icon: const Icon(Icons.close, size: 20),
                                                color: Colors.red.shade400,
                                                tooltip: 'Remove item',
                                                onPressed: () => _removeItem(index),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Summary & Checkout
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, -5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                _buildPriceRow('Subtotal', subtotal),
                                const SizedBox(height: 8),
                                _buildPriceRow('Shipping', shipping),
                                const Divider(height: 24),
                                _buildPriceRow('Total', total, isTotal: true),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                    onPressed: _proceedToCheckout,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade700,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 3,
                                    ),
                                    child: const Text(
                                      'Proceed to Checkout',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isTotal ? Colors.black87 : Colors.grey[700],
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal ? Colors.blue.shade700 : Colors.black87,
          ),
        ),
      ],
    );
  }
}

// Placeholder for future Checkout screen
class CheckoutPlaceholderScreen extends StatelessWidget {
  const CheckoutPlaceholderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: const Center(
        child: Text(
          'Checkout Screen\n(Coming Soon)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}