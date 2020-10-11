---
layout: mypost
title: leetcode-剑指Offer35-复杂链表的复制
categories: [中等, 链表]
---
# 1.题目
请实现 copyRandomList 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 next 指针指向下一个节点，还有一个 random 指针指向链表中的任意节点或者 null。

![](https://img-blog.csdnimg.cn/20201011161000497.png)


```
来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

```
# 2.方案
**理解题意**
1. 复制链表，好像很简单的样子
2. 给的例子很奇怪： random的是位置，但是代码中是Node节点，实际上按照节点Node来解题
3. 节点可以存在重复，如果根据value -->Node 复杂是不行的
**思路**
1. 直接复制
    - 复制自身节点
    - 链接到random节点
        1. random节点是随机的，可能会想到map绑定

下面代码不适合存在重复节点的情况
```cpp

class Solution {
public:
    Node* copyRandomList(Node* head) {
        // value -- node 的映射
        unordered_map<int, Node*> int2node;
        // value -- random 的映射
        unordered_map<int, int> key2val;
        Node * cur = head;
        Node * dumpy = new Node(0);
        Node * p = dumpy;

        while(cur != NULL) {
            int val = INT_MAX;
            if (cur->random != NULL) {
                val = cur->random->val;
            }
            key2val[cur->val] = {val};

            Node * node = new Node(cur->val);
            p->next = node;

            int2node[cur->val] = node;
            p = p->next;
            cur = cur->next;
        }
        Node * q = dumpy->next;
        while(q!=NULL) {
            auto m = key2val[q->val];

            if (m == INT_MAX) {
                q->random = NULL;
            } else {
                q->random = int2node[m];
            }

            q = q->next;
        }
        return dumpy->next;

    }
};

```

参考题解：
1. 建立old到new节点的映射，这里使用map存储
2. 链接节点+链接random节点
```cpp

class Solution {
public:
    Node* copyRandomList(Node* head) {
        unordered_map<Node*, Node*> old2new;

        Node * cur = head;
        Node * dumpy = new Node(0);
        Node * p = dumpy;
        // 复制当前节点
        while(cur != NULL) {
            Node * node = new Node(cur->val);
            old2new[cur] = node;
            cur = cur->next;
        }

        cur = head;
        while(cur != NULL) {
            // 链接上next节点
            if (cur->next != NULL) {
                old2new[cur]->next = old2new[cur->next];
            } else {
                old2new[cur]->next = NULL;
            }
            // 链接上random
            if (cur->random != NULL) {
                old2new[cur]->random = old2new[cur->random];
            } else {
                old2new[cur]->random = NULL;
            }
            cur = cur->next;
        }
        return old2new[head];
    }
};
```

2. 深度copy
    - 思想很好：
        - 定义map标记旧节点到新节点的映射
```cpp
unordered_map<Node*, Node*> old2new;
Node* copyRandomList(Node* head) {
    if (head == NULL) return NULL;
    if (old2new.find(head) != old2new.end())
        return old2new[head];
    Node * newHead = new Node(head->val);
    old2new[head] = newHead;
    newHead->next = copyRandomList(head->next);
    newHead->random = copyRandomList(head->random);
    return newHead;
}
```


# 3.参考
1. [leetcode题解](https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/solution/tong-guo-hashmaplai-shi-xian-by-try-62/)
2. [参考2](https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof/solution/lian-biao-de-shen-kao-bei-by-z1m/)
