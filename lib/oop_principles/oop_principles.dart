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
- we use getters as a shortcuts
- we can adding return types to getters but it is not required 
we can do this :-
  1- Adding return types (not required)
  -------------------------------------
//Add Data to Stream
Function(String) get changeEmail => emailController.sink.add;
Function(String) get chnagePassword => passwordController.sink.add;
//Retrive Data From Stream
Stream<String> get email => emailController.stream;
Stream<String> get password => passwordController.stream;
  2- using getters without using return types
  -------------------------------------------
//Add Data to Stream
get changeEmail => emailController.sink.add;
get chnagePassword => passwordController.sink.add;
//Retrive Data From Stream
get email => emailController.stream;
get password => passwordController.stream;


3- Modeling Tools :-
------------------
Visual modeling tools provide a mechanism to create and manipulate class diagrams using
the Unified Modeling Language (UML).

4- What Exactly Is a Class?
--------------------------
In short, a class is a blueprint for an object When you instantiate an object, you use a class
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
9- abstract classes :-
-------------------------------------
- when we need in out design a class that only created for inheritancec puposes and can't be instantiated ( معناه اني بحتاج الكلاس ده عشان اورث منه سوار امبليمينت او اكستند ومش محتاج اعرف منه اوبجكتس )
- enforce subclasses to implement abstract methods in the base class.
- All classes that inherites from abstract class must implement (override) all abstract methods in that base class.
- مفهوم الابستراكت كلاس عموما هو اني اعمل منه وراثة واني مقدرش اخد منه اوبجكت
- One class can inherit from only one class (in many languages as dart becouse it not suppot multiple inheritance)
9-1- abstract method:- Method without implementation (in dart we decfined abstract methods that the method with ( no implementation and without abstract keyword ) ).
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
- all methods are abstract and ca'nt have implementation.
- classess can implement multiple interfaces but not extends multiple classes (Multiple inheritance forbidden in dart).
- Add/Enforce/Describe behaviors to other classess / types.
- Note :-
-------- في لغات برمجة مش بتتعدم ال المالتبل انهيرتنس زي الدرات (يعني مقدرش اعمل اكستند لاكتر من اب  )
بس اقدر اعمل امبليمنت لاكتر من انترفيس عادي (يعني اعمل امبليمنت لاكتر من اب عادي )

////////////////////////////////////////////////////////////////////////////////
11- Abstraction :-
---------------
11-1- abstraction is hiding details for whom should not know , or don't care, about (or) Make only required details to be publicly available>

12- Mixins and (with) keyword :-
-------------------------------
1-Mixin :-  Mixins are a way to reuse a set of methods from one or more 
   classes without using inheritance. A mixin is a class that provides methods and instance variables and can be "mixed in" to 
   another class to provide that functionality.
2- with :- The with keyword in Dart is used to implement mixins.

mixin Performer {
  void perform() {
    print("Performing on stage");
  }
}

class Musician with Performer {
  // Other class members
}

--In this example, the Musician class uses the with keyword to mix in the functionality defined in the Performer mixin.



13- whats is Mixins and the different between it and concrete class and why and when we using mixins :-
-----------------------------------------------------------------------------------------------------
- A concrete class in Dart is a class that can be instantiated directly, and it can provide both state (variables) and behavior (methods).
  On the other hand, a mixin is a way to modularize and reuse code in Dart, allowing you to define a set of methods that can be "mixed in" to other classes

Here are the key differences between a concrete class and a mixin:
-----------------------------------------------------------------
Concrete Class:
--------------
 - A concrete class can be instantiated on its own to create objects.
 - It can have its own state (fields) and behavior (methods).
 - Concrete classes are used to create objects that have attributes and behavior specific to that class.

Example of a concrete class:
---------------------------
class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print("Some generic sound");
  }
}

Mixin:
------
- A mixin is a way to encapsulate and provide a set of methods that can be combined with other classes.
- Mixins cannot be instantiated on their own; they are meant to be mixed into other classes that provide the required state.
- They are used to share functionality across different classes without using traditional inheritance.

Example of Mixin :-
-----------------
mixin Performer {
  void perform() {
    print("Performing on stage");
  }
}
class Musician with Performer {
  String instrument;

  Musician(this.instrument);
  
  // Other class members
}

Why Use Mixins?
---------------
- Mixins are valuable for code reuse and for providing a way to avoid deep inheritance hierarchies. They offer the following advantages:
- Code Reusability: Mixins allow you to define a set of methods once and reuse them across multiple classes, promoting code reusability and maintainability.
- Avoiding Multiple Inheritance: Unlike some other programming languages, Dart doesn't support multiple inheritance. Mixins provide a way to include functionality from multiple sources without the complexity of multiple inheritance.
- Separation of Concerns: Mixins help in separating different concerns and organizing code in a modular way, making it easier to manage and understand.
- Promoting Flexibility: By using mixins, you can add functionality to a class without forcing it to inherit from a specific superclass, promoting more flexible code designs.

-In summary, while a concrete class represents a complete unit with its own state and behavior, a mixin in Dart offers a means of modularizing
 and reusing functionality across different classes, promoting code reusability, separation of concerns, and flexibility in your codebase.


14- Summary (extends , with , implements) :-
-----------------------------------------
extends :- is used for inheritance, allowing a subclass to inherit from a superclass.
with :- is used for mixins, allowing a class to include functionality from a mixin without inheritance.
implements :- is used to declare that a class supports a certain interface, promising to provide implementations 
              for the methods declared in the interface.
 */