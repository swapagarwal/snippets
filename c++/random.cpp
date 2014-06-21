#include <math.h>
#include <random>

///<summary>You would have to set the seed before using this function, obviously.</summary>
int random(int & p_low, int & p_high)
{
	if (p_low > p_high){
		int temp = p_low;
		p_low = p_high;
		p_high = temp;
	}
	return p_low + (std::rand() % (p_high - p_low + 1));
}
