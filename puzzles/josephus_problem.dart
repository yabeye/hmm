/* 

  Josephus problem
  From Wikipedia, the free encyclopedia
  https://en.wikipedia.org/wiki/Josephus_problem

  In computer science and mathematics, the Josephus problem (or Josephus
  permutation) is a theoretical problem related to a certain counting-out game. 
  Such games are used to pick out a person from a group, 
  e.g. eeny, meeny, miny, moe.

  In the particular counting-out game that gives rise to the Josephus problem,
  a number of people are standing in a circle waiting to be executed. Counting
  begins at a specified point in the circle and proceeds around the circle in a 
  specified direction. After a specified number of people are skipped, the next
  person is executed. The procedure is repeated with the remaining people,
  starting with the next person, going in the same direction and skipping the
  same number of people, until only one person remains, and is freed.

 */

void main() {
  for (int i = -1; i <= 41; i++) {
    print("🔪 Safest Place for ${i} 💂Solders is ${solveJosephusForN(i)}");
  }
}

int solveJosephusForN(int n) {
  if (n <= 0) {
    // no solders
    return -1;
  }

  int i = 0;
  List<int> solders = List.generate(n, (i) => i + 1);

  while (solders.length > 1) {
    // kills the next person
    i++;
    i = i % solders.length;
    solders.remove(solders[i]);
  }

  return solders.first; // last solders to be freed.
}
