---
layout: mypost
title: tensorflow-api-reduce_sum
categories: [tensorflow]
---
# 简介
reduce_sum() 用于计算张量tensor沿着某一维度的和，可以在求和后降维。
```cpp
tf.reduce_sum(
    input_tensor,
    axis=None,
    keepdims=None,
    name=None,
    reduction_indices=None,
    keep_dims=None)
```
- 此函数计算一个张量的各个维度上元素的总和.
- 函数中的input_tensor是按照axis中已经给定的维度来减少的；
- 除非 keep_dims 是true,否则张量的秩将在axis的每个条目中减少1；
- 如果keep_dims为true,则减小的维度将保留为长度1.
- 如果axis没有条目,则缩小所有维度,并返回具有单个元素的张量.

参数：
- input_tensor：要减少的张量.应该有数字类型.
- axis：要减小的尺寸.如果为None(默认),则缩小所有尺寸.必须在范围[-rank(input_tensor), rank(input_tensor))内.
- keep_dims：如果为true,则保留长度为1的缩小尺寸.
- name：操作的名称(可选).
- reduction_indices：axis的废弃的名称.

返回：
- 该函数返回减少的张量.
- numpy兼容性,相当于np.sum

关于axis：维度是用来索引一个多维数组中某个具体数所需要最少的坐标数量。

1. 0维，又称0维张量，数字，标量：1
2. 1维，又称1维张量，数组，vector：[1, 2, 3]
3. 2维，又称2维张量，矩阵，二维数组：[[1,2], [3,4]]
4. 3维，又称3维张量，立方（cube），三维数组：[ [[1,2], [3,4]], [[5,6], [7,8]] ]
5. n维：你应该get到点了吧~

# 举例
![](reduce-sum-01.png)


# 参考
1. w3c:https://www.w3cschool.cn/tensorflow_python/tensorflow_python-5y4d2i2n.html
2. https://www.jianshu.com/p/30b40b504bae
