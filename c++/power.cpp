long long power(long long a,long long e,long long mod){
	long long ret=1LL;
	while(e){
		if(e&1){
			ret*=a;
			ret%=mod;
		}
		a*=a;
		a%=mod;
		e=e>>1;
	}
return ret;
}