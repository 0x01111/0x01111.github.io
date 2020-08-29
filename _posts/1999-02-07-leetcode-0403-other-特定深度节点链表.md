---
layout: mypost
title: leetcode-0403-other-特定深度节点链表
categories: [中等, 二叉树, bfs]
---
# 1.题目

给定一棵二叉树，设计一个算法，创建含有某一深度上所有节点的链表（比如，若一棵树的深度为 D，则会创建出 D 个链表）。返回一个包含所有深度的链表的数组。
 
```
示例：

输入：[1,2,3,4,5,null,7,8]

        1
       /  \
      2    3
     / \    \
    4   5    7
   /
  8

输出：[[1],[2,3],[4,5,7],[8]]

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/list-of-depth-lcci
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
```
# 2.方案
**理解题意**
1. 每层的二叉树节点转为一个链表
2. 直接层次遍历

**思路**
1. 直接层次遍历

**方案**

```cpp

class Solution {
public:
    vector<ListNode*> listOfDepth(TreeNode* tree) {
        vector<ListNode*> result;
        if (tree == NULL) return result;
        queue<TreeNode*> que;
        que.push(tree);
        while(!que.empty()) {
            int size = que.size();
            ListNode * head = new ListNode(-1);
            ListNode * cur = head;
            for (int i = 0; i < size; ++i) {
                TreeNode* node = que.front();
                cur->next = new ListNode(node->val);
                cur = cur->next;
                que.pop();
                if (node->left != NULL) que.push(node->left);
                if (node->right != NULL) que.push(node->right);
            }
            result.push_back(head->next);
        }
        return result;
    }
};
```

**茴香豆的茴四种写法**
```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    vector<ListNode*> listOfDepth(TreeNode* tree) {
        vector<ListNode*> result;
        if (tree == NULL) return result;
        queue<TreeNode*> que;
        que.push(tree);
        que.push(NULL);
        while(!que.empty()) {

            ListNode * head = new ListNode(-1);
            ListNode * cur = head;
            while(que.front() != NULL) {
                TreeNode* node = que.front();
                cur->next = new ListNode(node->val);
                cur = cur->next;
                que.pop();
                if (node->left != NULL) que.push(node->left);
                if (node->right != NULL) que.push(node->right);
            }
            result.push_back(head->next);
            que.pop();
            if (que.empty()) break;
            que.push(NULL);
        }
        return result;
    }
};
```
# 3.参考
1. [leetcode题解]()
