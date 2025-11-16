class Perfume {
  final String id, name, brand, category, description, imageUrl;
  final double price, rating;
  final int reviews;

  const Perfume({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.category,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });
}