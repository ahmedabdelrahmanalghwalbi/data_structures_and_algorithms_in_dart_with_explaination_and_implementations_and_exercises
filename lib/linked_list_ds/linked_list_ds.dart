/*
LINKED LIST :-
------------
1-  is a collection of values arranged in a linear , unidirectional swquance.
2- it has serveral theortical over contiguous storage options such as the Dart List.
3- Constant time insertion and removal from the front of the list.
4- A linked list has the concept of a head and tail, which refers to the first and last
nodes of the list respectively:

Nodes :-
-----
1- have two responsibilities :- 1) Hold a value. , 2) Hold a reference to the next node. A null reference indicates the end of the list.
*/
//Implementation of the Node class
class Node<T> {
  T value;
  Node<T>? next;
  Node({required this.value, this.next});
  @override
  String toString() {
    if (next == null) return this.value.toString();
    //This will recursively print all of the nodes after this one in the linked list
    return '${this.value} ==> ${this.next.toString()}';
  }
}

// Test Implementation of Node<T>
void main() {
  List test = [];
  test.sort();
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);
  node1.next = node2;
  node2.next = node3;
  print(node1);
}

////////////////////////////////////////////////////////////////////////////////////////////////
//Implementation of the Linked List class
class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'this is Empty Linked List ';
    //This will recursively print all of the nodes after this one in the linked list
    return head.toString();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////
/*
//ADDING VALUES TO LINKED LIST
//----------------------------
1. push: Adds a value at the front of the list.
2. append: Adds a value at the end of the list.
3. insertAfter: Adds a value after a particular node in the list.
------------------------------------------------------------------
1. push: Adds a value at the front of the list (also known as head-first insertion):-
-----------------------------------------------------------------------------------
// i will add this method intire linked list interface
void push(E value){
  1- هنا انا بقوله اعمل هيد جديد وحط فيه القيمة اللي جيالك وخلي التالي بتاعه الهيد القديم ولو كان اصلا انا بضيف في ليست مفهلش الا الهيد والتيل فاضي هخلي التيل هوهو الهيد 
  head = Node(value:value,next : head);
  2- في حاله اني بضيف في ليست فاضيه مفهاش تيل هخلي الهيد هو هو التيل
  3- In the case in which you’re pushing into an empty list, the new node is both the head and tail of the list.
  tail??=head;
}
-------------------------------------------------------------------------------------
2- Appending to the End of a List (also called tail-end insertion):-
-------------------------------------------------------------------
void append (E value){
  //case: if the list is empty ,then i will push the new node (call push method)
  if(isEmpty){
    push(value);
    return;
  }
  //case: if the list is not empty , then i will make the next of the tail refrence to the new node and reset tail to the new node (new tail)
  tail.next = Node(value: value,next:null);
  //assert new Node to the tail
  tail = tail!.next;
}

------------------------------------------------------------------------------------
Inserting in Middle of a List :-
-------------------------------
The third and final operation for adding values is insertAfter. This operation
inserts a value after a particular node in the list, and requires two steps:
1. Finding a particular node in the list.
2. Inserting the new node after it.
-----------------------------------
1. Finding a particular node in the list :- 
-----------------------------------------
Node<E>? nodeAt(int index) {
  // 1. You create a new reference to head and set up a counter to keep track of where
  //    you are in the list.
  var currentNode = head;
  var currentIndex = 0;
  // 2. Using a while loop, you move the reference down the list until you’ve reached
        the desired index. Empty lists or out-of-bounds indexes will result in a null return value.
  while (currentNode != null && currentIndex < index) {
    currentNode = currentNode.next;
    currentIndex += 1;
  }
  return currentNode;
}
//AFTER THIS METHOD I WILL GET THE NODE OF THE INDEX THAT I WANT THE I WILL PASS THIS INDEX TO THE (insertAfter( currentNode )) to adding new node after it. 
--------------------------------------
2. Inserting the new node after it.
-----------------------------------
Node<E> insertAfter(Node<E> nodeThatIncommingFromNodeAtMethodThatIWillCreateNewNodeWithNewValueAfterIt (node), E value) {
  //node is the wanted node that return from the first method that get node after certain index
  // 1 - In the case where this method is called with the tail node, you’ll call the
        functionally equivalent append method. This will take care of updating tail.
  //بمعني اني لو عندي النود اللي انا بحثت عنها هي هي الهيد يعني كده انا عندي الليست عباره عن نود واحدة وهي الهيد ونفس الوقت النود اللي بحثت عنها في الميثود الاولي
  // فعشان كده مفهوم اللي انا اضيف النود الجديدة بعد نود معينه هي نفس المفهوم بتاع الابيند او اني هستخدم نفس الميثود اللي بتضيف في اخر الميثود عشان معنديش الا الهيد وانا هضيف بعده
  // ولما عستخدم الميثود اللي بتضيف في الاخر مش هشيل هم تعيين التيل عشان كده كده هي بتهندله
  if (tail == node) {
    append(value);
    return tail!;
  }
  // 2- you simply link up the new node with the rest of the list and return
        the new node.
  //ببساطة كده هخلي النود اللي بحثت عليها التالي بتاعها نود جديدة فيها القيمة الجديده اللي عايز اضيفها بعد النود اللي بحث عليها وهخلي التالي بتاع النود الجديده هو التالي القديم بتاع النود اللي بحث عنها في الاول عشان اضيف النفود الجديدة بعدها
  node.next = Node(value: value, next: node.next);
  return node.next!;
}

Expample of the calling of those method to adding node after certain node:-
-------------------------------------------------------------------------
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print('Before: $list');
  var middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);
  print('After: $list');
-------------------------------------------PERFORMANCE----------------------------------------------------
1- PUSH ==> O (1)
2- APPEND ==> O (1)
3- INSERT AFTER NODE ==> O (1)
4- NODE AT (that i use before INSERT AT) ==> O(N) where n is the index of the node that i wand to add new node after it. 
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
Removing Values From a List :-
----------------------------
There are three main operations for removing nodes:
1. pop: Removes the value at the front of the list.
2. removeLast: Removes the value at the end of the list.
3. removeAfter: Removes the value after a particular node in the list.
----------------------------------------------------------------------
1-Popping From the Front of a List:-
-----------------------------------
E? pop() {
  final value = head?.value;
  head = head?.next;
  if (isEmpty) {
    tail = null;
  }
  return value;
}

2-Removing From the End of a List :-
-----------------------------------

E? removeLast() {
  // 1 - check if linked list only contains the head of list then i will use pop() method>
  if (head?.next == null) return pop();
  // 2 - take temp from head of the linked list and looping untill the next of the current node == tail
  var current = head;
  while (current!.next != tail) {
    current = current.next;
  }
  // 3 - if i reach to the node that before tail then i will make the next of it refere to null and reset tail to the new tail (node before the old tail)
  final value = tail?.value;
  tail = current;
  tail?.next = null;
  return value;
}

3-Removing a Value From the Middle of a List (much like insertAfter) :
-------------------------------------------------------------------
1- first i will search on the specific node that i want to remove the node before it.
2- once i get the node (using nodeAt() method) just easly skip the node after it that i want to delete it by make it (node.next == node.next.next)  
E? removeAfter(Node<E> node) {
  final value = node.next?.value;
  if (node.next == tail) {
    tail = node;
  }
  //skip easy 
  node.next = node.next?.next;
  return value;
}

---------------------------------------------------------------------
1- pop ==> O (1)
2- RemoveLast ==> O (n) ==> becouse , i looping in the linked list untill reached to the node previouse tail and make it next to null and assert it to be a new tail 
3- Remove the next node  ==> O (1)
4- NODE AT (that i use before INSERT AT) ==> O(N) where n is the index of the node that i wand to add new node after it.

*/