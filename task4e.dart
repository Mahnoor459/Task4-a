// Job class remains unchanged
class Job {
  String designation;
  double salary;
  int id;

  Job(this.designation, this.salary, this.id);

  String getDesignation() {
    return designation;
  }

  void setDesignation(String designation) {
    this.designation = designation;
  }

  double getSalary() {
    return salary;
  }

  void setSalary(double salary) {
    this.salary = salary;
  }

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }
}

// Updated Employee class with null safety
class Employee {
  String name;
  int age;
  Job job; // Job object

  // Constructor with Job parameter
  Employee(this.name, this.age, {required this.job}) {
    job = job ?? Job('Unassigned', 0, 0); // Initialize job if null
  }

  // Updated constructor without Job parameter
  Employee.withoutJob(this.name, this.age) : job = Job('Unassigned', 0, 0);

  // Getters and setters remain unchanged
  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  int getAge() {
    return age;
  }

  void setAge(int age) {
    this.age = age;
  }

  Job getJob() {
    return job;
  }

  void setJob(Job job) {
    this.job = job;
  }

  bool isHighSalary() {
    return job.getSalary() > 50000;
  }

  void display() {
    print('Name: $name');
    print('Age: $age');
    print('Job Designation: ${job.getDesignation()}');
    print('Job Salary: ${job.getSalary()}');  
    print('Job ID: ${job.getId()}'); 
  }
}

void main() {
  // Example usage
  Job job1 = Job('Software Engineer', 75000, 1);
  Employee emp1 = Employee('Alice', 30, job: job1);

  print('Employee Details:');
  emp1.display();

  if (emp1.isHighSalary()) {
    print('${emp1.getName()} has a high salary.');
  } else {
    print('${emp1.getName()} does not have a high salary.');
  }

  Employee emp2 = Employee.withoutJob('Bob', 28);

  print('\nEmployee Details:');
  emp2.display();

  if (emp2.isHighSalary()) {
    print('${emp2.getName()} has a high salary.');
  } else {
    print('${emp2.getName()} does not have a high salary.');
  }
}