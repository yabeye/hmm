// start @ 1:34 PM
// End @ 1:50 PM

// Input: height = [1,8,6,2,5,4,8,3,7]
// Output: 49
// Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
// Example 2:

// Input: height = [1,1]
// Output: 1

void main() {
  final sol = Solution();
  final height = [1, 8, 6, 2, 5, 4, 8, 3, 7];
  // 49

  print("Start @ ${DateTime.now()}");
  print("Solution =  ${sol.maxArea(height)}   ------ real ans is 49");
  print("End @ ${DateTime.now()}");
}

class Solution {
  int maxArea(List<int> height) {
    int maxArea = -1;

    // FIRST ATTEMPT
    // for (int i = 0; i < height.length - 1; i++) {
    //   for (int j = i + 1; j < height.length; j++) {
    //     final tempMaxArea =
    //         (height[i] < height[j] ? height[i] : height[j]) * (j - i);
    //     maxArea = (tempMaxArea > maxArea) ? tempMaxArea : maxArea;
    //   }
    // }

    // BETTER SOLN

    int i = 0;
    int j = height.length - 1;

    while (j > i) {
      final tempMaxArea =
          (height[i] < height[j] ? height[i] : height[j]) * (j - i);

      maxArea = (tempMaxArea > maxArea) ? tempMaxArea : maxArea;

      (height[i] < height[j]) ? i++ : j--;
    }

    return maxArea;
  }
}
