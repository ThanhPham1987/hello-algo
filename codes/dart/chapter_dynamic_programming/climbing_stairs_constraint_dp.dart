/**
 * File: climbing_stairs_constraint_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 带约束爬楼梯：动态规划 */
int climbingStairsConstraintDP(int n) {
  if (n == 1 || n == 2) {
    return n;
  }
  // 初始化 dp 表，用于存储子问题的解
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
  // 初始状态：预设最小子问题的解
  dp[1][1] = 1;
  dp[1][2] = 0;
  dp[2][1] = 0;
  dp[2][2] = 1;
  // 状态转移：从较小子问题逐步求解较大子问题
  for (int i = 3; i <= n; i++) {
    dp[i][1] = dp[i - 1][2];
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
  }
  return dp[n][1] + dp[n][2];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsConstraintDP(n);
  print("爬 $n 阶楼梯共有 $res 种方案");
}
