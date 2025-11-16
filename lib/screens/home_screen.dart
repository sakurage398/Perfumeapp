import 'package:flutter/material.dart';
import '../models/perfume.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _searchQuery = '';
  String _selectedCategory = 'All';

  final List<Perfume> perfumes = [
    // ORIGINAL 6 PERFUMES
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
      id: '4',
      name: 'Mystic Wood',
      brand: 'Forest Tales',
      price: 95.00,
      category: 'Woody',
      description: 'Deep cedarwood with amber and leather notes',
      rating: 4.7,
      reviews: 156,
      imageUrl: 'assets/images/perfume4.png',
    ),
    Perfume(
      id: '5',
      name: 'Citrus Burst',
      brand: 'Sunny Days',
      price: 55.00,
      category: 'Fresh',
      description: 'Vibrant citrus blend with bergamot and grapefruit',
      rating: 4.5,
      reviews: 203,
      imageUrl: 'assets/images/perfume5.png',
    ),
    Perfume(
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
    
    // 11 NEW PERFUMES ADDED
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
      id: '8',
      name: 'Amber Sunset',
      brand: 'Desert Sands',
      price: 78.00,
      category: 'Oriental',
      description: 'Warm amber with vanilla and spicy notes',
      rating: 4.7,
      reviews: 198,
      imageUrl: 'assets/images/perfume8.png',
    ),
    Perfume(
      id: '9',
      name: 'Green Tea Mist',
      brand: 'Zen Garden',
      price: 58.00,
      category: 'Fresh',
      description: 'Light green tea with mint and cucumber essence',
      rating: 4.4,
      reviews: 167,
      imageUrl: 'assets/images/perfume9.png',
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
    Perfume(
      id: '12',
      name: 'Cherry Blossom',
      brand: 'Tokyo Spring',
      price: 68.00,
      category: 'Floral',
      description: 'Delicate cherry blossom with peach and white tea',
      rating: 4.7,
      reviews: 312,
      imageUrl: 'assets/images/perfume12.png',
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
    Perfume(
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
    Perfume(
      id: '15',
      name: 'Leather & Smoke',
      brand: 'Urban Edge',
      price: 105.00,
      category: 'Woody',
      description: 'Bold leather with smoky vetiver and tobacco',
      rating: 4.6,
      reviews: 143,
      imageUrl: 'assets/images/perfume15.png',
    ),
    Perfume(
      id: '16',
      name: 'Peony Garden',
      brand: 'English Rose',
      price: 72.00,
      category: 'Floral',
      description: 'Fresh peony with lily of the valley and soft musk',
      rating: 4.8,
      reviews: 267,
      imageUrl: 'assets/images/perfume16.png',
    ),
    Perfume(
      id: '17',
      name: 'Mint Mojito',
      brand: 'Summer Nights',
      price: 48.00,
      category: 'Fresh',
      description: 'Refreshing mint with lime and white rum accord',
      rating: 4.3,
      reviews: 189,
      imageUrl: 'assets/images/perfume17.png',
    ),
  ];

  List<String> get categories {
    Set<String> cats = {'All'};
    for (var perfume in perfumes) {
      cats.add(perfume.category);
    }
    return cats.toList();
  }

  List<Perfume> get filteredPerfumes {
    return perfumes.where((perfume) {
      bool matchesSearch = perfume.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          perfume.brand.toLowerCase().contains(_searchQuery.toLowerCase());
      bool matchesCategory = _selectedCategory == 'All' || perfume.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      _buildHomeContent(),
      const FavoritesScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0, // Remove shadow for pure white
              title: Row(
                children: [
                  // Logo from assets
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/logo.png', // Your logo here
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.local_florist,
                            color: Colors.lightBlue,
                            size: 24,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Essence de Ley',
                    style: TextStyle(
                      fontFamily: 'Pacifico', // Cursive font
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
            )
          : null,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Container(
      // Gradient background from dark blue at bottom to white at top
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.lightBlue.shade400, // Darker blue at bottom
            Colors.lightBlue.shade300,
            Colors.lightBlue.shade200,
            Colors.lightBlue.shade100,
            Colors.lightBlue.shade50,
            Colors.white, // White at top (near appbar)
          ],
          stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
        ),
      ),
      child: Column(
        children: [
          // Search Bar Section - NO BACKGROUND COLOR
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search perfumes...',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search, color: Colors.lightBlue.shade700),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.lightBlue.shade200, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.lightBlue.shade400, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Category Filter Chips
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: Colors.lightBlue.shade400,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    side: BorderSide(
                      color: isSelected ? Colors.lightBlue.shade400 : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                );
              },
            ),
          ),
          // Product Grid
          Expanded(
            child: filteredPerfumes.isEmpty
                ? const Center(
                    child: Text(
                      'No perfumes found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
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
                    itemCount: filteredPerfumes.length,
                    itemBuilder: (context, index) {
                      final perfume = filteredPerfumes[index];
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
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.lightBlue.shade100,
                                        Colors.lightBlue.shade50,
                                      ],
                                    ),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                      child: Image.asset(
                                        perfume.imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(
                                            Icons.broken_image,
                                            size: 60,
                                            color: Colors.grey.shade400,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                                        color: Colors.lightBlue.shade700,
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
    );
  }
}