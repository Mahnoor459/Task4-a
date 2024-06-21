class Student {
  String _name;
  List<int> _resultArray; // Initialize with empty list

  // Default constructor
  Student() : _name = '', _resultArray = List.filled(5, 0); // Initialize both name and result array

  // One-argument constructor
  Student.withName(String name) : _name = name, _resultArray = List.filled(5, 0); // Initialize result array

  // Two-argument constructor
  Student.withDetails(String name, List<int> resultArray)
      : _name = name, _resultArray = resultArray;

  // Getter for name
  String get name => _name;

  // Getter for result array
  List<int> get resultArray => _resultArray;

  // Method to calculate the average
  double average() {
    int sum = _resultArray.reduce((a, b) => a + b);
    return sum / _resultArray.length;
  }

  // Method to compare the average of two students
  bool compareAverage(Student other) {
    return this.average() > other.average();
  }
}

void main() {
  // Create two students
  Student student1 = Student.withDetails('Alice', [85, 90, 80, 70, 75]);
  Student student2 = Student.withDetails('Bob', [70, 75, 65, 80, 90]);

  // Calculate and print averages
  print('${student1.name} Average: ${student1.average()}');
  print('${student2.name} Average: ${student2.average()}');

  // Compare averages
  if (student1.compareAverage(student2)) {
    print('${student1.name} has a higher average than ${student2.name}');
  } else {
    print('${student2.name} has a higher average than ${student1.name}');
  }
}