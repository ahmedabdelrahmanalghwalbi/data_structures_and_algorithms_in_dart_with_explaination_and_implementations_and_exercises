// Complexity:- 
/* BIG O NOTATION : ITS REPRESENT FOR THE DIFFERENT LEVELS OF SCABILITY IN TWO DIMINTIONS : EXCUTION TIME AND MEMORY USAGE.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TIME COMPEXITY :- IS A MEASURE OF THE TIME REQUIRED TO RUN AN ALGORITHM AS THE INPUT SIZE INCREASE.
--------------------------------------------------------------------------------
1- CONSTANT TIME :- HAS THE SAME RUNNING TIME REGARDLESS OF THE INPUT(بمعني ان الوقت بيفضل ثابت بغض النظر عن الذيادة في حجم ال INPUT) ==> O(1).
Example of CONSTANT TIME:-
------------------------
void checkFirst (List<String> names){
  if(names.isNotEmpty){
    print(names.first);
  }else{
    print('no names);
  }
}
--------------------------------------------------------------------------------
2- LINEAR TIME :-  AS INPUT INCREASE , TIME INCREASE BY THE SAME AMOUNT ==> O(n)
Example of LINEAR TIME:-
------------------------
void printNames (List<String> names){
  for(final name in names){
    print(name);
  }
}
--------------------------------------------------------------------------------
3- QUADRATIC TIME :- AS INPUT INCREASE , TIME INCREASE BY SQUARE AMOUNT ==> O(n power of 2)
Example of QUADRATIC TIME:-
------------------------
void printNames (List<String> names){
  for(final _ in names){
    for(final name in names){
      print(name);
    }
  }
}
--------------------------------------------------------------------------------
4- LOGARITHMIC TIME:- As input data increases, the time it takes to execute the algorithm increases at a slow rate ==> O(Log n).
-- ( simillar to linear time complixity but better that him )
Example of LOGARITHMIC TIME:-
------------------------
const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
// Linear Complixity:
bool naiveContains(int value, List<int> list) {
  for (final element in list) {
    if (element == value) return true;
  }
  return false;
}
//(Better Solution that Linear Complixty )logarIthmic time:
bool betterNaiveContains(int value, List<int> sortedlist) {
  if (list.isEmpty) return false;
  final middleIndex = list.length ~/ 2;
    if (value > list[middleIndex]) {
      for (var i = middleIndex; i < list.length; i++) {
        if (list[i] == value) return true;
      }
    } else {
      for (var i = middleIndex; i >= 0; i--) {
        if (list[i] == value) return true;
      }
    }
  return false;
}
--------------------------------------------------------------------------------
5- Quasilinear Time :- perform worse than linear time but dramatically better than quadratic time, You can think of quasi-linear as “kind of” like linear time for large
data sets. An example of a quasilinear time algorithm is Dart’s sort method ==> O(n log n).

NOTE: is a multiplication of linear and logarithmic time

NOTE: Note: At the time of this writing, the List.sort algorithm in Dart internally
uses the quasilinear Dual-Pivot Quicksort algorithm for large lists. However,
for lists below a size threshold of 32, it uses an insertion sort.

NOTE: Quasilinear time complexity nears a linear slope at higher values. This makes it more
resilient to large data sets.
--------------------------------------------------------------------------------
6- Other Time Complixity:

• O(nᵏ): polynomial time.
• O(2ⁿ): exponential time.
• O(n!): factorial time.
--------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SPACE COMPLIXITY :- is a measure of the memory required for an algorithm to run.

1- SPACE COMPLIXITY DEPENDS ON THE AMOUNT AND SIZE OF THE INPUT AND OUTPUT AND HAVE SEVERAL FORMS LIKE TIME COMLIXITY SUCH AS CONSTATNCT SPACE COMPLIXITY ,LINEAR SPACE COMPLIXITY AND QUADRATIC SPACE COMPLIXITY

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
OTHER NOTATIONS:
----------------
• Big Omega notation :- is used to measure the best-case runtime for an algorithm.
This isn’t as useful as Big O because getting the best case is often untenable.

• Big Theta notation :- is used to measure the runtime for an algorithm that is
between the best- and worse-case scenarios.


*/