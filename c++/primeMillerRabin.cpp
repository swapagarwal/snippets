int modulo(int base,int exp,int mod)
{
	long long res=1,b=base;
	while(exp>0)
	{
		if((exp&1)==1)
			res=(res*b)%mod;
		exp=exp>>1;
		b=(b*b)%mod;
	}
	return res%mod;
}

long long mulmod(long long a ,long long b,long long c)
{
	long long res=0,y=a%c;
	while(b>0)
	{
		if((b&1)==1)
			res=(res+y)%c;
		y=(y<<1)%c;
		b=b>>1;
	}
	return res%c;
}

bool Miller(long long p,int iteration){
    if(p<2){
        return false;
    }
    if(p!=2 && p%2==0){
        return false;
    }
    long long s=p-1;
    while(s%2==0){
        s/=2;
    }
    for(int i=0;i<iteration;i++){
        long long a=rand()%(p-1)+1,temp=s;
        long long mod=modulo(a,temp,p);
        while(temp!=p-1&&mod!=1&&mod!=p-1){
            mod=mulmod(mod,mod,p);
            temp*=2;
        }
        if(mod!=p-1&&temp%2==0){
            return false;
        }
    }
return true;
}