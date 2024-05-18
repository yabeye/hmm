/* 

  Eight queens puzzle 
  From Wikipedia, the free encyclopedia
  https://en.wikipedia.org/wiki/Eight_queens_puzzle


  The eight queens puzzle is the problem of placing eight chess queens on an 8×8
  chessboard so that no two queens threaten each other; thus, a solution 
  requires that no two queens share the same row, column, or diagonal. 
  There are 92 solutions. The problem was first posed in the mid-19th century. 
  In the modern era, it is often used as an example problem for various computer
  programming techniques.

  The eight queens puzzle is a special case of the more general n queens problem
  of placing n non-attacking queens on an n×n chessboard.

 */

void main() {
  // Tests
  print("*------------------------------------*");
  print("🧪 Testing 🧪");

  // index of array=numer of queens, and values would be possible answers
  List<int> _15PossibleAnswers = [
    0,
    1,
    0,
    0,
    2,
    10,
    4,
    40,
    92,
    340, // 352,
    724,
    // 2680,
    // 14200,
    // 73712,
    // 365596,
    // 2279184
  ];
  for (int i = 0; i < _15PossibleAnswers.length; i++) {
    final test = NQueen(showFullBoard: false);
    test.test(i, _15PossibleAnswers[i], test.solveQueensForN(i));
  }
  print("*------------------------------------*");
}

class NQueen {
  int _count;
  bool _showFullBoard;

  NQueen({bool showFullBoard = true})
      : _count = 0,
        _showFullBoard = showFullBoard;

  // Method to solve the n-queens problem
  void _logger(String text) {
    if (_showFullBoard) {
      print(text);
    }
  }

  void test(int n, int expected, int actual) {
    (expected == actual)
        ? print("✅ PASSED For ♛ = $n which is ${expected}")
        : print(
            "❌ FAILED For ♛ = 1. Expected ${expected} but get Actual ${actual}",
          );
  }

  int solveQueensForN(int n) {
    // Start here ..

    _logger("----------- 🏁 N=${n} -----------\n");

    _backtrackPositions([], n);
    _logger("Possible Positions for N=${n} is ${_count}");
    _logger("\n------------ End ------------");
    return _count;
  }

  // Backtracking method;
  _backtrackPositions(List<int> board, int n) {
    if (n <= 0) {
      // Means no queens
      return 0;
    }

    if (board.length == n) {
      _count++;

      if (_showFullBoard) _logger("${_count} Current board is ${board}");

      return;
    }

    for (int i = 0; i < n; i++) {
      // Conditions
      // 1. key should not be duplicated , b/c no horizontal same row index is
      // allowed.
      // 2. key should not be in diagonal with the next queen position(s),

      if (board.contains(i) || _isCurrentPositionInDiagonal(i, board)) continue;

      final tempBoard = [...board];
      tempBoard.add(i);

      _backtrackPositions(tempBoard, n);
    }
  }

  bool _isCurrentPositionInDiagonal(i, board) {
    for (int j = 0; j < board.length; j++) {
      // Checks if the slope of two queen positions is diagonal @45 degree
      // i.e slope = 1/-1 because it means they cross each other
      if (((i - board[j]) / (board.length - j)).abs() == 1) return true;
    }

    return false;
  }
}
