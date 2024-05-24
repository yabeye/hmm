// Start time => 2:29 PM
// End time => 2: 41 PM
// First RunTime => Runtime: 362 ms

// Input: paths = [["B","C"],["D","B"],["C","A"]]
// Output: "A"
// Explanation: All possible trips are:
// "D" -> "B" -> "C" -> "A".
// "B" -> "C" -> "A".
// "C" -> "A".
// "A".
// Clearly the destination city is "A".

// void

void main() {
  print("Destination problem");
  final obj = Solution();
  final paths = [
    ["B", "C"],
    ["D", "B"],
    ["C", "A"]
  ];

  final paths2 = [
    ["A", "Z"]
  ];

  final paths3 = [
    ["London", "New York"],
    ["New York", "Lima"],
    ["Lima", "Sao Paulo"]
  ];

  final start = DateTime.now();
  print("PATH is ${obj.destCity(paths)}");
  print("PATH 2  is ${obj.destCity(paths2)}");
  print("PATH 3  is ${obj.destCity(paths3)}");
  final end = DateTime.now();
  print("END: ${DateTime.now()} TAKES=> ${end.second - start.second}");
}

class Solution {
  String destCity(List<List<String>> paths) {
    final destMap = {};
    paths.forEach((e) => destMap[e.first] = e.last);

    return paths.firstWhere((e) => destMap[e.last] == null).last;
  }
}
