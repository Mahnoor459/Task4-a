// Abstract class Movie
abstract class Movie {
  int idNumber;
  String title;
  int rentalDays;

  Movie(this.idNumber, this.title, this.rentalDays);

  // Getters
  int get getIdNumber => idNumber;
  String get getTitle => title;
  int get getRentalDays => rentalDays;

  // Setters
  set setIdNumber(int id) => idNumber = id;
  set setTitle(String title) => this.title = title;
  set setRentalDays(int days) => rentalDays = days;

  // Method to check if two movies are the same
  bool equals(Movie other) {
    return this.idNumber == other.idNumber;
  }

  // Abstract method for calculating late fees
  double calcLateFees(int lateDays);
}

// Action movie class
class Action extends Movie {
  Action(int idNumber, String title, int rentalDays) : super(idNumber, title, rentalDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 3.0; // $3 per day late fee
  }
}

// Comedy movie class
class Comedy extends Movie {
  Comedy(int idNumber, String title, int rentalDays) : super(idNumber, title, rentalDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 2.5; // $2.50 per day late fee
  }
}

// Drama movie class
class Drama extends Movie {
  Drama(int idNumber, String title, int rentalDays) : super(idNumber, title, rentalDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 2.0; // $2 per day late fee
  }
}

// Abstract class Person
abstract class Person {
  String name;

  Person(this.name);

  // Getter and Setter for name
  String get getName => name;
  set setName(String name) => this.name = name;

  // Abstract method to check if a person is outstanding
  bool isOutstanding();
}

// Student class
class Student extends Person {
  double cgpa;

  Student(String name, this.cgpa) : super(name);

  double get getCgpa => cgpa;
  set setCgpa(double cgpa) => this.cgpa = cgpa;

  @override
  bool isOutstanding() {
    return cgpa > 3.5; // Outstanding if CGPA is greater than 3.5
  }
}

// Professor class
class Professor extends Person {
  int numberOfPublications;

  Professor(String name, this.numberOfPublications) : super(name);

  int get getNumberOfPublications => numberOfPublications;
  set setNumberOfPublications(int numberOfPublications) => this.numberOfPublications = numberOfPublications;

  @override
  bool isOutstanding() {
    return numberOfPublications > 50; // Outstanding if more than 50 publications
  }
}

void main() {
  // Create instances of different movie types
  var actionMovie = Action(1, "Fast & Furious", 5);
  var comedyMovie = Comedy(2, "The Hangover", 5);
  var dramaMovie = Drama(3, "The Godfather", 5);

  // Calculate and print late fees for each movie type
  print("Late fee for Action Movie: \$${actionMovie.calcLateFees(3)}");
  print("Late fee for Comedy Movie: \$${comedyMovie.calcLateFees(3)}");
  print("Late fee for Drama Movie: \$${dramaMovie.calcLateFees(3)}");

  // Check if two movies are the same
  print("Action movie equals comedy movie: ${actionMovie.equals(comedyMovie)}");

  // Downcasting example
  if (actionMovie is Action) {
    actionMovie.setIdNumber = 10; // Reset Id for Action Movies
    print("New ID for Action Movie: ${actionMovie.getIdNumber}");
  }

  // Create an array of Person
  var persons = [
    Student('Alice', 3.6),
    Professor('Dr. Smith', 30),
  ];

  // Check if persons are outstanding
  for (var person in persons) {
    print('${person.getName} is outstanding: ${person.isOutstanding()}');
  }

  // Update professor's publication count
  var professor = persons[1] as Professor;
  professor.numberOfPublications = 100;

  // Check outstanding status again
  print('${professor.getName} is outstanding: ${professor.isOutstanding()}');
}