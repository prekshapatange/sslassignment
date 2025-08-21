#include <stdio.h>

void cal(double a,double b,char operator){
	if(operator== '+'){
		printf("result is %.2f: ",a+b);
		
	}
	else if(operator == '-'){
		printf("result is %.2f: ",a-b);
		
	}
	else if(operator == '/'){
		if(b!=0){
		printf("result is %.2f: ",a/b);
		}
		else{
			printf("enter a appropriate value for b except '0'\n");
	}
	}
	else if(operator=='*'){
		printf("result is %.2f: ",a*b);
	}
	else{
		printf("error:the operator is invalid");
	}
}
int main(){
	double a;
	double b;
	char optr;
	printf("enter the first operand:\n");
	scanf("%lf",&a);
	printf("enter the second operand:\n");
	scanf("%lf",&b);
	  while ((getchar()) != '\n');
	printf("enter an operator for calculation('+','-','*','/')\n");
	scanf("%c",&optr);
	cal(a,b,optr);
	return 0;
}
