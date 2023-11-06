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
