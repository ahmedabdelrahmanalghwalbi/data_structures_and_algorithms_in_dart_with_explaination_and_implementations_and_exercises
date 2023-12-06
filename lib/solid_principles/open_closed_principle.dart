//Open / Closed Principle (OCP)
//OCP:- means that a class accepted to inheritance but not modification
//الكلاس يكون قابل للوراثة وغير قابل للتعديل
//الخدمة الجديدة تكون في كلاس جديد وليس بتغير الكلاس الأساسي
//بمعني عندي كلاس الأب وبيورث منه كلاس الإبن فكلاس الاب وظيفته انه بيرسم فغلط انه اعدلة اخليه يقطع بدل ما يرسم الأحسن اني اخلي الابن يورث منه بحيث ان الابن يبقي بيرسم زي ابوه واعدل علي الابن اخليه يقطع يبقي كدة الابن بيرسم ويقطع

//--------------------BEFORE OCP
class Employee {
  final String id;
  final String name;
  final double salary;

  const Employee({required this.id, required this.name, required this.salary});

  double calcSallaryBasedOnEmployeeExperince(bool isJunior) {
    return isJunior ? (salary * 2) : (salary * 7);
  }
}

//--------------------AFTER OCP
//1- make interface that contains main information and constrains that should implemeneted in sub-classes
abstract class EmployeeInterface {
  final String id;
  final String name;
  final double salary;

  const EmployeeInterface(
      {required this.id, required this.name, required this.salary});

  double calcSallaryBasedOnEmployeeExperince();
}

class JuniorEmployee extends EmployeeInterface {
  const JuniorEmployee(
      {required String id, required String name, required double salary})
      : super(id: id, name: name, salary: salary);

  @override
  double calcSallaryBasedOnEmployeeExperince() {
    return (salary * 2);
  }
}

class SinorEmployee extends EmployeeInterface {
  const SinorEmployee(
      {required String id, required String name, required double salary})
      : super(id: id, name: name, salary: salary);

  @override
  double calcSallaryBasedOnEmployeeExperince() {
    return (salary * 7);
  }
}

//How does this code violate OCP? (Open-Closed Principle)
/*
class PizzaShop {
  constructor(name: string, address: Address){ }
  getName() { }
  getAddress() { }
} 
class InvoiceService {
  generateInvoice(shop: MusicShop): String{
  let invoice = "";
  if(company instanceOf A)
  invoice = "format of invoice for A";
  if(company instanceOf B)
  invoice = "format of invoice for B";
  if(company instanceOf C)
  invoice = "format of invoice for C";
  return invoice;
  }
}
The provided code violates the Open-Closed Principle (OCP) because the InvoiceService class is not closed for modification.
The OCP states that classes should be open for extension but closed for modification.
In the generateInvoice method of the InvoiceService class, the conditional statements check the type of company (A, B, or C)
and generate the invoice format accordingly. This violates the OCP because if a new type of company
(for example, company type D) is introduced, the InvoiceService class would need to be modified to accommodate the new company
 type.
To adhere to the OCP, you could use polymorphism and create separate invoice format classes for each company type.
Then, you could use inheritance or composition to have the InvoiceService class work with these different format classes
without needing to modify the InvoiceService class itself when a new company type is introduced.
*/