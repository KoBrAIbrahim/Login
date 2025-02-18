class Product {
  final int id;
  final String name;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  void updateQuantity(int newQuantity) {
    if (newQuantity >= 0) {
      quantity = newQuantity;
    } else {
      throw Exception("Quantity cannot be negative.");
    }
  }

  double totalPrice() {
    return price * quantity;
  }
}
