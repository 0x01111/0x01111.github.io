---
layout: mypost
title: leetcode-0406-other-后继者
categories: [中等, 二叉树, dfs]
---
# 1.题目

设计一个算法，找出二叉搜索树中指定节点的“下一个”节点（也即中序后继）。

如果指定节点没有对应的“下一个”节点，则返回null。
```
示例 1:

输入: root = [2,1,3], p = 1

  2
 / \
1   3

输出: 2
示例 2:

输入: root = [5,3,6,2,4,null,null,1], p = 6

      5
     / \
    3   6
   / \
  2   4
 /   
1

输出: null


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/successor-lcci
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
```
# 2.方案
**理解题意**
1. 中序遍历中，p节点的下一个节点

**思路**
1. 中序遍历，遇到大于p的节点就是答案

**方案**
```cpp
class Solution {
public:
    TreeNode* inorderSuccessor(TreeNode* root, TreeNode* p) {
        if (root == NULL) return NULL;
        TreeNode * left = inorderSuccessor(root->left, p);
        if (left != NULL) return left;
        // 第一个大于p节点的就是答案
        if (root->val > p->val) return root;
        return inorderSuccessor(root->right, p);
    }
};
```
上面的代码好简洁，下面我写的又臭又长

上面代码是先执行上面的，再执行下面的，所以碰到第一个大于p的就是答案

上面好像没有利用二叉搜索树的特点

```cpp

class Solution {
public:
    TreeNode* inorderSuccessor(TreeNode* root, TreeNode* p) {
        return dfs(root,p,NULL, NULL);
    }

    TreeNode* dfs(TreeNode* root, TreeNode* p,
                TreeNode * parent, TreeNode * grandParent) {
        if (root == NULL) return NULL;
        if (root->val < p->val) {
            if (parent != NULL)
                grandParent = parent;
            return dfs(root->right, p, NULL,grandParent);
        } else if (root->val > p->val) {
            grandParent = parent;
            return dfs(root->left, p, root, grandParent);
        } else {
            if (root->right == NULL) {
                return parent == NULL ? grandParent : parent;
            }
            root = root->right;
            while(root->left != NULL) {
                root = root->left;
            }
            return root;
        }
        return root;
    }
};
```
代码的思想：
1. p节点的下一个节点在哪里：
    - 右节点的最左节点： 上面循环代码就是这个逻辑；
    - 祖父节点，还要是一定条件的祖父节点
    1. root->val < p->val 时候，需要向右走
        1. 父节点为null 【p 的下一个节点大于p，root 小于 】
        2. 祖父节点：right 之前的父节点,作为祖父节点
            - 就像下面，记录x节点

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/2020100520494615.png)

    2. root->val > p->val 时候，需要向做走
        1. 父节点: root 【p 的下一个节点大于p 】
        2. 后面就是很容易明白的了

其实还是直接递归牛逼

# 3.参考
1. [leetcode题解]()
