---
title: KMP算法
---

先存代码以后填坑



```c++
#include <bits/stdc++.h>
using namespace std;


void getNEXT(const string &s,int *NEXT) //改进后
{
    NEXT[0] = -1;
    int j = 0,k = -1;
    while(j < s.size()-1)
    {

        if (k == -1 || s[j] == s[k])
        {

            if  (s[++j] == s[++k])
                NEXT[j] = NEXT[k];
            else
                NEXT[j] = k;
        }
        else
            k = NEXT[k];
    }
}

void getnext(const string &s,int *next) //未改进
{
    next[0] = -1;
    int j = 0,k = -1;
    while (j < s.size()-1)
    {
        if (k == -1 || s[j] == s[k])
            next[++j]=++k;
        else
            k = next[k];
    }
}




int KMP(string &ob,string &pat)  //返回第一次匹配成功的角标
{
    int obsize=ob.size();
    int patsize=pat.size();
    int *next=new int[patsize];
    getnext(pat,next);
    int i=0,j=0;
    while(i<obsize&&j<patsize&&obsize-i>=patsize-j)
    {
        if(j==-1 || ob[i]==pat[j])
        {i++;j++;}
        else
        {j=next[j];}
    }
    delete []next;
    if(j==patsize)
    return i-j;
    else
    return -1;
}
int main()
{
    while(true){
    string s;
    cin >> s;
    int *NEXT=new int[s.size()];
    int *next=new int[s.size()];
    getNEXT(s,NEXT);
    getnext(s,next);
    for(int i=0;i<s.size();i++)
    cout<<next[i]<<' ';
    cout<<endl;
    for(int i=0;i<s.size();i++)
    cout<<NEXT[i]<<' ';
    cout<<endl;
    string ss;
    cin>>ss;
    cout<<KMP(ss,s)<<endl;
    }
    system("pause");
    return 0;
}



//abcaabbabcabaacbacba
```

