---
layout: mypost
title: tensorflow-api-reduce_sum
categories: [小技巧]
---
# 简介
reduce_sum() 用于计算张量tensor沿着某一维度的和，可以在求和后降维。
```
tf.reduce_sum(
    input_tensor,
    axis=None,
    keepdims=None,
    name=None,
    reduction_indices=None,
    keep_dims=None)
```
input_tensor：待求和的tensor;
axis：指定的维，如果不指定，则计算所有元素的总和;
keepdims：是否保持原有张量的维度，设置为True，结果保持输入tensor的形状，设置为False，结果会降低维度，如果不传入这个参数，则系统默认为False;
name：操作的名称;
reduction_indices：在以前版本中用来指定轴，已弃用;
keep_dims：在以前版本中用来设置是否保持原张量的维度，已弃用;



# 举例




# 参考
1. https://www.jianshu.com/p/30b40b504bae
