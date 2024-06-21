class Address {
  String street;
  String city;
  String state;
  String zipCode;

  Address(this.street, this.city, this.state, this.zipCode);

  @override
  String toString() {
    return '$street, $city, $state $zipCode';
  }
}

class Person {
  String _name;
  Address _address;
  String _phoneNumber;
  String _email;

  Person(this._name, this._address, this._phoneNumber, this._email);

  @override
  String toString() {
    return 'Name: $_name\nAddress: $_address\nPhone: $_phoneNumber\nEmail: $_email';
  }
}

class Student extends Person {
  String _status;

  Student(String name, Address address, String phoneNumber, String email, this._status)
      : super(name, address, phoneNumber, email);
}

class Employee extends Person {
  String _office;
  double _salary;
  DateTime _dateHired;

  Employee(String name, Address address, String phoneNumber, String email, this._office, this._salary, this._dateHired)
      : super(name, address, phoneNumber, email);

  // Getters to allow access to private variables in subclasses
  String get office => _office;
  double get salary => _salary;
  DateTime get dateHired => _dateHired;
}

class Faculty extends Employee {
  String _officeHours;
  String _rank;

  Faculty(String name, Address address, String phoneNumber, String email, String office, double salary, DateTime dateHired, this._officeHours, this._rank)
      : super(name, address, phoneNumber, email, office, salary, dateHired);

  void display() {
    print('Faculty:');
    print(this);
    print('Office Hours: $_officeHours');
    print('Rank: $_rank');
  }

  @override
  String toString() {
    return '${super.toString()}\nOffice: $office\nSalary: $salary\nDate Hired: $dateHired';
  }
}

class Staff extends Employee {
  String _title;

  Staff(String name, Address address, String phoneNumber, String email, String office, double salary, DateTime dateHired, this._title)
      : super(name, address, phoneNumber, email, office, salary, dateHired);

  void display() {
    print('Staff:');
    print(this);
    print('Title: $_title');
  }

  @override
  String toString() {
    return '${super.toString()}\nOffice: $office\nSalary: $salary\nDate Hired: $dateHired';
  }
}

void main() {
  Address address = Address('123 Main St', 'Anytown', 'Anystate', '12345');

  Faculty faculty = Faculty('Alice', address, '123-456-7890', 'alice@example.com', 'Room 101', 50000, DateTime(2020, 1, 15), '9 AM - 5 PM', 'Professor');
  Staff staff = Staff('Bob', address, '098-765-4321', 'bob@example.com', 'Room 202', 40000, DateTime(2019, 3, 12), 'Technician');

  faculty.display();
  print('');
  staff.display();
}