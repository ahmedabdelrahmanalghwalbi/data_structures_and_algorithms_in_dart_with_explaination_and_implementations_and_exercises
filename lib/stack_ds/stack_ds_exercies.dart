import 'package:ds_algorithms/stack_ds/stack_ds.dart';

void reverseListByUsingStack(List<dynamic> elements) {
  List<String> names = ['a', 'b', 'c'];
  MyCustomStack<String> s = MyCustomStack<String>.of(names);
  List<String> reversedNames = [];
  for (int i = 0; i < names.length; i++) {
    reversedNames.add(s.pop());
  }
}

bool checkBalanceOfTheParanthese(String str) {
  List<String> paranthese = [];
  for (var i = 0; i < str.length; i++) {
    if (str[i] == '(' || str[i] == ')') {
      paranthese.add(str[i]);
    }
  }
  if (paranthese.isEmpty) {
    return false;
  }
  if (paranthese.length.isOdd) {
    return false;
  }
  MyCustomStack<String> mStack = MyCustomStack<String>.of(paranthese);
  for (var i = 0; i < (paranthese.length / 2); i++) {
    String s1 = mStack.pop();
    String s2 = mStack.pop();
    print("test $s1  ===  $s2 ==== $i === ${paranthese.length}");
    if ((s1 == '(' || s1 == ')') && (s2 == '(' || s2 == ')') && s1 != s2) {
      continue;
    } else {
      return false;
    }
  }
  return true;
}
