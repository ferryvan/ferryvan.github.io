---
title: Treap
date: 2019-1-4 02:39:47
---

# Treap

## #概述

Treap是一种码量极小的平衡二叉树，是一种结合二叉树和二叉堆的数据结构。

Treap通过不断的split和merge来维护平衡二叉树，两者相辅相成。

Treap树的每个节点都自带一个随机值，他们符合大根堆的性质。

## #split

split通过将原树分为L，R两颗树来实现分离，实现过程具体大概是沿着比目标值key大或者比它小的这一条线进行递归，将比它小的分支接入L,比它大的分支接入R。

```c++
void split(node *&t,int key,node *&l,node *&r)
{
    if(!t) l=r=NULL;
    else if(key < t->val) 
        split(t->l,key,l,t->l) , r=t;
    else 
        split(t->r,key,t->r,r) , l=t;
}//注意：此处如有重复，会把key值的节点分到左树l
```



## #merge

merge则是通过随机数的比较进行恢复大根堆，最终结果是一个Treap树，并且具有平衡二叉树的性质。

通过大根堆随机数来维护平衡，merge通过大根堆进行恢复，这两个函数是Treap的核心，都是平均logN的神仙算法。

```c++
void merge(node *&t,node *l,node *r)
{
    if(!l||!r) t=l?l:r;
    else if(l->prior>r->prior)
        merge(l->r,l->r,r) , t=l;
    else
        merge(r->l,l,r->l) , t=r;
}
```



## #insert&erase

一种Insert的思路是：将插入的节点看作一个树，先通过split把原树分成比它值大的一棵树和比它值小的一棵树，然后将插入节点merge到其中一颗树上，最后两棵树merge达到insert的作用，O(logN)

一种erase的思路是：将原树split成三颗树，其中一颗仅有要删除的节点一个节点，最后merge其余两颗树，O(logN)

```c++
void insert(node *&root,int val)
{
    node *L,*R;
    node *now=new node(val);
    split(root,val,L,R);
    merge(R,now,R);
    merge(root,L,R);
}

void erase(node *&root,int val)
{
    node *L,*R,*temp;
    split(root,val,L,R);
    split(L,val,L,temp);
    merge(root,L,R);
    delete[] temp;
}
```



## #代码存档

---
原核心代码：
```c++
void split (pitem t, int key, pitem & l, pitem & r) {
    if (!t)
        l = r = NULL;
    else if (key < t->key)
        split (t->l, key, l, t->l),  r = t;
    else
        split (t->r, key, t->r, r),  l = t;
}


void merge (pitem & t, pitem l, pitem r) {
    if (!l || !r)
        t = l ? l : r;
    else if (l->prior > r->prior)
        merge (l->r, l->r, r),  t = l;
    else
        merge (r->l, l, r->l),  t = r;
}
```



实践代码：

```c++
#include<bits/stdc++.h>
using namespace std;
struct node
{
    node *r,*l;
    int val,prior;
    node(int _val) :val(_val),r(NULL),l(NULL),prior(rand()){}
};

void split(node *&t,int key,node *&l,node *&r)
{
    if(!t) l=r=NULL;
    else if(key < t->val) 
        split(t->l,key,l,t->l) , r=t;
    else 
        split(t->r,key,t->r,r) , l=t;
}//注意：此处如有重复，会把key值的节点分到左树l

void merge(node *&t,node *l,node *r)
{
    if(!l||!r) t=l?l:r;
    else if(l->prior>r->prior)
        merge(l->r,l->r,r) , t=l;
    else
        merge(r->l,l,r->l) , t=r;
}

void insert(node *&root,int val)
{
    node *L,*R;
    node *now=new node(val);
    split(root,val,L,R);
    merge(R,now,R);
    merge(root,L,R);
}

void erase(node *&root,int val)
{
    node *L,*R,*temp;
    split(root,val,L,R);
    split(L,val,L,temp);
    merge(root,L,R);
    delete[] temp;
}

void midOrder(node *&root)
{
    if(!root) return;
    midOrder(root->l);
    cout<<root->val<<" ";
    midOrder(root->r);
}


int main()
{
    node *root=NULL;
    int T,x;
    cin>>T;
    while(T--)
    {
        cin>>x;
        insert(root,x);
    }
    midOrder(root);
    system("pause");
    return 0;
}

```



不多描述了，本人还没完全熟练

> [Treap代码存档 https://cp-algorithms.com/data_structures/treap.html](https://cp-algorithms.com/data_structures/treap.html)

