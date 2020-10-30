#include<stdio.h>

int main()
{
    int num, fnum, rnum, temp;
    rnum = 0;
    printf("Enter the Number Which You Want to Check is Palindrome Number or Not : ");
    scanf("%d",&fnum);
    num = fnum;
    while(fnum!=0)
    {
        temp = fnum%10;
        rnum = rnum*10 + temp;
        fnum = fnum/10;
    }
    printf("The Reverse of %d is %d.\n",num,rnum);

    if(num == rnum)
        printf("%d is Palindrome Number.",num);
    else
        printf("%d is Not a Palindrome Number.",num);
}
