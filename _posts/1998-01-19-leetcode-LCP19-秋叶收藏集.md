---
layout: mypost
title: leetcode-LCP19-秋叶收藏集
categories: [中等, 动态规划]
---
# 1.题目
小扣出去秋游，途中收集了一些红叶和黄叶，他利用这些叶子初步整理了一份秋叶收藏集 leaves， 字符串 leaves 仅包含小写字符 r 和 y， 其中字符 r 表示一片红叶，字符 y 表示一片黄叶。
出于美观整齐的考虑，小扣想要将收藏集中树叶的排列调整成「红、黄、红」三部分。每部分树叶数量可以不相等，但均需大于等于 1。每次调整操作，小扣可以将一片红叶**替换**成黄叶或者将一片黄叶**替换**成红叶。请问小扣最少需要多少次调整操作才能将秋叶收藏集调整完毕。
```
示例 1：
输入：leaves = "rrryyyrryyyrr"

输出：2
解释：调整两次，将中间的两片红叶替换成黄叶，得到 "rrryyyyyyyyrr"

示例 2：
输入：leaves = "ryr"

输出：0
解释：已符合要求，不需要额外操作
```
提示：
```
3 <= leaves.length <= 10^5
leaves 中只包含字符 'r' 和字符 'y'
```
来源
```
力扣（LeetCode）
链接：https://leetcode-cn.com/problems/UlBDOe
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
```
# 2.方案
**理解题意**
1. 输入一个字符串，包括ry两种字符，针对字符串进行**替换**, 编程 ryr的形式
2. **替换**，**替换** 上面已经加粗了，这里的替换，不是字符串内部交换，是字符串内部的一个字符串，和外接的字符串替换，求替换满足条件后最小替换次数
3. 如何理解成交换，题目就完了。。。
4. 自己没有想出来，题解给的方案是动态规划，这个动态规划还比较好理解

定义dp[i][j]表示为从第0片叶子到第j片叶子变为某个颜色的最小操作步数
其中j表示第几片叶子，i表示叶子的状态，在题目中叶子一共有3中状态：
1. 叶子为红色并且是在黄色叶子左侧的 定义为 i = 0 -->dp[0][j] ry
2. 叶子为黄色，夹在红色叶子之间 定义为 i = 1 -->dp[1][j] ryr
3. 叶子为红色并且是在黄色叶子右侧的 定义为 i = 2 -->dp[2][j] yr

**循环体：**
1. dp[0][j] = dp[0][i-1] + isYellow(i) 第i片叶子状态为0的情况，需要操作的步数为第i-1片叶子状态为0的步数 + isYellow(i)。如果第i片叶子原本为黄色，则isYellow(i)值为1，否则为0
2. dp[1][i] = min{dp[0][i-1], dp[1][i-1]} + isRead(i) 如果第i片叶子原本为红色，则isRead(i)值为1，否则为0
3. dp[2][i] = min{dp[1][i-1], dp[2][i-1]} + isYellow(i) 如果第i片叶子原本为黄色，则isYellow(i)值为1，否则为0
4. 我们要的最终结果肯定就是dp[i][2]这个状态

**初始值问题：**
1. dp[0][0]等于1或者0: 表示第0片叶子为左侧红色叶子，可能需要操作1次或者不用操作
2. dp[0][1]等于正无穷: 表示第0片叶子为中间黄色叶子，需要操作无数次（因为压根就不可以，所以就定义成无穷了）
3. dp[0][2]等于正无穷 表示第0片叶子为右侧红色叶子，需要操作无数次（理由同上）

代码
```cpp
class Solution {
public:
    int minimumOperations(string leaves) {
        int n = leaves.size();
        vector<vector<int>> dp(3, vector<int>(n, n+1));
        if (leaves[0] == 'r') {
            dp[0][0] = 0;
        } else {
            dp[0][0] = 1;
        }
        for (int i = 1; i < n; ++i) {
            if (leaves[i] == 'r') {
                dp[0][i] = dp[0][i-1];
                //dp[1][i] = min(y->y, r->y) + 1 (y变成r次数加1)
                dp[1][i] = min(dp[0][i-1], dp[1][i-1]) + 1;
                //dp[2][i] = min(y->r, r->r)
                dp[2][i] = min(dp[1][i-1], dp[2][i-1]);
            } else {
                dp[0][i] = dp[0][i-1] + 1;
                //dp[1][i] = min(y->y, r->y)
                dp[1][i] = min(dp[0][i-1], dp[1][i-1]);
                //dp[2][i] = min(y->r, r->r) + 1 (r变成y次数加1)
                dp[2][i] = min(dp[1][i - 1], dp[2][i - 1]) + 1;
             }
        }
        return dp[2][n-1];
    }
};
```


# 3.参考
1. [leetcode 题解](https://leetcode-cn.com/problems/UlBDOe/solution/dong-tai-gui-hua-chu-ti-yan-by-hybird-hotpot/)
