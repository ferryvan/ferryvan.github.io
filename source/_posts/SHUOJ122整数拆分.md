---
title: 整数拆分

---

### SHUOJ122整数拆分

​	直接贴代码

```c++
#include<bits/stdc++.h>
using namespace std;
const int Max=121;
int dp[Max][Max]={0};
int main()
{
    for(int i=1;i<=120;++i)
    for(int j=1;j<=i;++j)
    {
        if(i==1||j==1)
            dp[i][j]=1;
        else
        {
            if(i==j)
                dp[i][j]=1+dp[i][j-1];
			else if((i-j)<j)
				dp[i][j]=dp[i-j][i-j]+dp[i][j-1];
			else
				dp[i][j]=dp[i-j][j]+dp[i][j-1];
        }
        
    }
    int n;
    while(scanf("%d",&n)!=EOF)
        printf("%d\n",dp[n][n]);
    return 0;
}
```

