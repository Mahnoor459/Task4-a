import 'dart:math';

// Generic class RandomBox
class RandomBox<T> {
  List<T> _items = [];

  // Method to add an item to the box
  void add(T item) {
    _items.add(item);
  }

  // Method to check if the box is empty
  bool isEmpty() {
    return _items.isEmpty; // Directly check if _items list is empty
  }

  // Method to draw an item randomly from the box
  T drawItem() {
    if (_items.isEmpty) {
      throw StateError('Cannot draw item: Box is empty'); // Throw an exception if box is empty
    }

    Random random = Random();
    int randomIndex = random.nextInt(_items.length); // Generate random index
    return _items[randomIndex]; // Return the randomly selected item
  }
}

void main() {
  // Create a RandomBox of Strings
  RandomBox<String> stringBox = RandomBox<String>();

  // Add some items to the box
  stringBox.add("Alice");
  stringBox.add("Bob");
  stringBox.add("Charlie");
  stringBox.add("David");

  // Draw items randomly until the box is empty
  while (!stringBox.isEmpty()) {
    try {
      String item = stringBox.drawItem();
      print("Drawn item: $item");
    } catch (e) {
      print("Error: ${e.toString()}"); // Print error message
    }
  }

  // Try drawing from an empty box
  try {
    String item = stringBox.drawItem();
    print("Drawn item from empty box: $item"); // This line won't execute due to the exception
  } catch (e) {
    print("Error: ${e.toString()}"); // Print error message
  }
}