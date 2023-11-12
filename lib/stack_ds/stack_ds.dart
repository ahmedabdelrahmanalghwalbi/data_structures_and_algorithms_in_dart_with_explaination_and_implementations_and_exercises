//==> STACK
//1- the main goal of building a stack is to enforce how you access your data.
//2- they are two essintial operation in stack :- 1)pop()  -  2)push.
//3- posh() & pop() are both constant time.
//4- these two operations limitting the interface (stack) to only can edit or remove from one direction.
//5- a stack is known as LIFO Data structure
//6- Meomery Allocation uses stacks at the architectural level .
//7- Meomery of locale variables is also managed using a stack .
//8- Programming languages that supported (recursion)  manage the function calls with a stack, if you accidentally write an infinite recursion you will get a STACK OVERFLOW

//                               **** Implementation ****
class MyCustomStack<T> {
  //this anotation is available (:) for private members
  MyCustomStack() : _storage = <T>[];
  List<T> _storage;
  //The alternative
  //also we can use this constractor
  //MyCustomStack(this._storage) ;
  //List<T> _storage = <T>[];
  //we can use both of those declarations to identify private params inside constractor
  //   class Student{
  //   var _id;
  //   var _name;
  //   Student({this._id, this._name}); // error
  //   void set id(int id) => _id = id;
  //   void set name(String name) => _name = name;
  // }
  ////////////////////////////////////////////////
  //   class Student{
  //   var _id;
  //   var _name;
  //   Student({int id, String name}) : _id = id, _name = name;
  //   void set id(int id) => _id = id;
  //   void set name(String name) => _name = name;
  // }
  //////////////////////////////////////////////
  /*class Animal {
  String _name;
  int _age;
  }
  class Dog extends Animal {
    String _race;
    Dog(String name, int age, {String? race}) : _race = race ?? "Wild", super(name, age);
  }
*/
///////////////////////////////////////////////
  @override
  String toString() {
    return '---> top of the stack \n'
        '${_storage.reversed.join('\n')}'
        '\n ---> top of the stack';
  }

  // add() :- adding elements on the end of the iteratbles
  void push(T element) => _storage.add(element);
  //removwLast() :- removing last elemets from the iteratables0
  T pop() => _storage.removeLast();
  //peak of the stack :- return last in elemet in stack
  T get peck => _storage.last;
  // check if this stacl is empty
  bool get isStackEmpty => _storage.isEmpty;
  //you might to take an existing iterable collection and convert it to stack and loop on it (for example pop all elements)
  //we will use names constractor (of) that take an iteratble and asign it to _storage
  MyCustomStack.of(Iterable<T> elements) : _storage = List<T>.of(elements);
}

//                               **** sample usage of this stack ****
// final myStack = Stack<int>();
// myStack.push('3');
// myStack.pop();
//converting iteratbles to stack
// const listChars = ['a', 'h', 'm', 'e', 'd'];
// final iterableToStack = Stack.of(listChars);
// iterableToStack.pop();
