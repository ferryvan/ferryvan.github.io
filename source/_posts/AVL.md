---
title: AVL
date: 2019-05-08 22:38:44
---

# AVL

这两天写了个自平衡树,使用子树高度作为判定失衡的依据

贴下代码

```c++
#include<bits/stdc++.h>
#include<windows.h>
using namespace std;

struct node
{
	int key;
	node *left, *right;
    int height;
	node(int Key, node *Left = NULL, node *Right = NULL) :key(Key), left(Left), right(Right),height(1) {}
};

int height(node* root)
{
    return root==NULL?0:root->height;
}

void LL(node* &root)
{
    node *p=root,*q=root->left;
    root=q;
    p->left=q->right;
    q->right=p;
    p->height=max(height(p->left),height(p->right))+1;
    q->height=max(height(q->left),height(q->right))+1;
}

void RR(node* &root)
{
    node *p=root,*q=root->right;
    root=q;
    p->right=q->left;
    q->left=p;
    p->height=max(height(p->left),height(p->right))+1;
    q->height=max(height(q->left),height(q->right))+1;
}

void LR(node* &root)
{
    RR(root->left);
    LL(root);
}

void RL(node* &root)
{
    LL(root->right);
    RR(root);
}

void insert(node* &root, int key)
{
    if(root==NULL) 
    {
        root=new node(key);
        return;
    }
    else if(key > root->key)
    {
        insert(root->right,key);
        if(height(root->right)-height(root->left)==2)
        {
            if(key > root->right->key)
                RR(root);
            else
                RL(root);
        }
    }
    else if(key < root->key)
    {
        insert(root->left,key);
        if(height(root->left)-height(root->right)==2)
        {
            if(key < root->left->key)
                LL(root);
            else
                LR(root);
        }
    }
    root->height=max(height(root->left),height(root->right))+1;
    return;
}


//remove代码有待考量
void remove(node *&root,int key)
{
    if(root==NULL)  return;
    else if(key > root->key)
    {
        remove(root->right,key);
        root->height=max(height(root->left),height(root->right))+1;
        if(height(root->left)-height(root->right)==2)
        {
            node *l =  root->left;
            if (height(l->left) > height(l->right))
                LL(root);
            else
                LR(root);
        }
    }
    else if(key < root->key)
    {
        remove(root->left,key);
        root->height=max(height(root->left),height(root->right))+1;
        if(height(root->right)-height(root->left)==2)
        {
            node *r =  root->right;
            if (height(r->right) > height(r->left))
                RR(root);
            else
                RL(root);
        }
    }
    else
    {
        if(root->left!=NULL && root->right!=NULL)
        {
            if(height(root->left) > height(root->right))
            {
                node *p=root->left;
                while(p->left!=NULL || p->right!=NULL)
                {
                    if(p->right!=NULL)  p=p->right;
                    else p=p->left;
                }
                //寻找左子树最大
                int temp=root->key;
                root->key=p->key;
                p->key=temp;
                //交换两个节点
                remove(root->left,key);
                root->height=max(height(root->left),height(root->right))+1;
            }
            else
            {
                node *p=root->right;
                while(p->left!=NULL || p->right!=NULL)
                {
                    if(p->left!=NULL)  p=p->left;
                    else p=p->right;
                }
                //寻找右子树最小
                int temp=root->key;
                root->key=p->key;
                p->key=temp;
                //交换两个节点
                remove(root->right,key);
                root->height=max(height(root->left),height(root->right))+1;
            }
        }
        else 
        {
            node *p=root;
            root = (root->left==NULL)?root->right : root->left;
            delete(p);
        }
    }
}

void BSTmiddle(node *&root)
{
    if(root==NULL) return;
    BSTmiddle(root->left);
    cout<<root->key<<" ";
    BSTmiddle(root->right);
}

void middle(node *&root,int x)
{
    if(root==NULL) return;
    middle(root->left,x+1);
    for(int i=0;i<x;i++)
        cout<<"\t";
    cout<<root->key<<endl;
    middle(root->right,x+1);
}

int main()
{
    node *root=NULL;
    for(int i=0;i<37;i++)
    {
        int x;
        //cin>>x;
        insert(root,i);
        //system("pause");
        middle(root,0);
        cout<<endl;
        cout<<"height: "<<height(root)<<endl;
    }
    while(true)
    {
        int x;
        cin>>x;
        remove(root,x);
        //system("pause");
        middle(root,0);
        cout<<endl;
        cout<<"height: "<<height(root)<<endl;
    }
    return 0;
}


```

参考博客:	[AVL树(二)之 C++的实现](https://www.cnblogs.com/skywang12345/p/3577360.html)

