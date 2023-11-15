/*
1- Data Hiding :-
---------------
In OO terminology, data is referred to as attributes, and behaviors are referred to as methods.
Restricting access to certain attributes and/or methods is called data hiding.
By combining the attributes and methods in the same entity, which in OO parlance is
called encapsulation.

2- Getters and Setters :-
----------------------
The concept of getters and setters supports the concept of data hiding. Because other objects
should not directly manipulate data within another object, the getters and setters provide
controlled access to an object’s data. Getters and setters are sometimes called
accessor methods and mutator methods, respectively.

3- Modeling Tools :-
------------------
Visual modeling tools provide a mechanism to create and manipulate class diagrams using
the Unified Modeling Language (UML).

4- What Exactly Is a Class?
--------------------------
In short, a class is a blueprint for an object.When you instantiate an object, you use a class
as the basis for how the object is built.
Note :- Classes Are Object Templates.

5- Access Designations
-----------------------
When a data type or method is defined as public, other objects can directly access it.
When a data type or method is defined as private, only that specific object can access it.
Another access modifier, protected, allows access by related objects,


6- Methods:-
-----------
methods implement the required behavior of a class.

7- Messages
-----------
Messages are the communication mechanism between objects.
 
////////////////////////////////////////////////////////////////////////////////
8- POLYMORPHISM (many forms)
____________________________
  first polymorphism type : Method overloading (static / compile time polymorphism)
  second polymorphism type : (runtime polymorphism)
  third polymorphisim type : an object can be addresses as either parent type or child /sub type.
           ======= ======= ======= ====== =========
8-1 - Method Overloading (NOT SUPPORTING IN DART) :- 
------------------------------------------------ 2 methods with same but differ in number of parametares or types of parameters 
for example:
  add (int x, int y)
  add (double x, double y)
  add (int x , double y)
  add(double x, int y)
  add (int x, int y , int y)

8-2 - Method Overriding :-
------------------------ A method overrides the imlementation of a method in a parent class

8-3 - Referencing Objects:-
for example:
  Bus b = new RahatBus()
  //its allow becouse rahatBus extends or implement from bus
  List<String> list = new ArrayList<String>
  //its allow becouse ArrayList implements from List Interface

//////////////////////////////////////////////////////////////////////////////
9- Abstractactions (abstract classes) :-
-------------------------------------
- when we need in out design a class that only created for inheritancec puposes and can't be instantiated ( معناه اني بحتاج الكلاس ده عشان اورث منه سوار امبليمينت او اكستند ومش محتاج اعرف منه اوبجكتس )
- enforce subclasses to implement abstract methods in the base class.
- All classes that inherites from abstract class must implement (override) all abstract methods in that base class.
- مفهوم الابستراكت كلاس عموما هو اني اعمل منه وراثة واني مقدرش اخد منه اوبجكت
- One class can inherit from only one class (in many languages as dart becouse it not suppot multiple inheritance)
9-1- abstract method:- Method without implementation (in dart we decfined abstract methods that the method with no implementation and without abstract keyword).
Example of abstract methods in interface:-
----------------------------------------
//iterface
abstract class MyCustomInterface{
  //abstract method (that i defined it without implementation and not defined it with abstract keyword)
  void getName();
  //abstract method (that i defined it without implementation and not defined it with abstract keyword)
  void getAge(String gender);
} 
////////////////////////////////////////////////////////////////////////////////
10- Interfaces:
---------------
- like 100% abstract with all the methods abstract (methods that defined as abstract and have no implementation)
- الانترفيس هو هو الابستراكت كلاس بس كل الميثودس اللي فيه ابستراكت ومش معول لاي واحدة فيهم امبليمينت .
- all classes implements the interface must implement (like override) all methods on the interface .
- all methods are abstract and ca'nt have implementation>
- classess can implement multiple interfaces>
- Add/Enforce/Describe behaviors to other classess / types.
- Note :-
-------- في لغات برمجة مش بتتعدم ال المالتبل انهيرتنس زي الدرات (يعني مقدرش اعمل اكستند لاكتر من اب  )
بس اقدر اعمل امبليمنت لاكتر من انترفيس عادي (يعني اعمل امبليمنت لاكتر من اب عادي )

 */