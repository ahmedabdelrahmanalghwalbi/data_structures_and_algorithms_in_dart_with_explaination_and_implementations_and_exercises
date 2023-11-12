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
