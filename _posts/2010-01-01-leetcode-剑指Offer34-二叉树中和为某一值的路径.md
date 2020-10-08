---
layout: mypost
title: leetcode-剑指Offer34-二叉树中和为某一值的路径
categories: [中等, dfs, 二叉树]
---
# 1.题目

输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

```
示例:
给定如下二叉树，以及目标和 sum = 22，

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \    / \
        7    2  5   1
返回:

[
   [5,4,11,2],
   [5,8,4,5]
]
 
提示：

节点总数 <= 10000
注意：本题与主站 113 题相同：https://leetcode-cn.com/problems/path-sum-ii/

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
```
# 2.方案
**理解题意**
1. 求根节点到叶子节点的和等于sum的路径

**思路**
1. dfs
```cpp

class Solution {
public:
    vector<vector<int>> result;
    vector<vector<int>> pathSum(TreeNode* root, int sum) {
        dfs(root, sum, 0, {});
        return result;
    }
    void dfs(TreeNode * root, int sum, int sub_sum, vector<int> path) {
        if (root == NULL) return;
        if (sum == sub_sum + root->val && root->left == NULL && root->right == NULL) {
            path.push_back(root->val);
            result.push_back(path);
            return;
        }
        sub_sum += root->val;
        path.push_back(root->val);
        dfs(root->left, sum, sub_sum, path);
        dfs(root->right, sum, sub_sum, path);
    }
};
```

改写成传引用
```cpp

class Solution {
public:
    vector<vector<int>> result;
    vector<vector<int>> pathSum(TreeNode* root, int sum) {
        vector<int> path;
        dfs(root, sum, 0, path);
        return result;
    }
    void dfs(TreeNode * root, int sum, int sub_sum, vector<int> & path) {
        if (root == NULL) return;
        path.push_back(root->val);
        if (sum == sub_sum + root->val && root->left == NULL && root->right == NULL) {
            result.push_back(path);
            // return;
        }
        // sub_sum += root->val;
        // path.push_back(root->val);
        dfs(root->left, sum, sub_sum + root->val, path);
        dfs(root->right, sum, sub_sum + root->val, path);
        path.pop_back();
    }
};
```
# 3.参考
1. [leetcode题解]()
