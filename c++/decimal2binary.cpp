string DecToBin(int number)
{
    string result = "";
    do
    {
        if((number&1)==0)
            result+="0";
        else
            result+="1";
        number>>=1;
    }while(number);
    reverse(result.begin(),result.end());
    return result;
}