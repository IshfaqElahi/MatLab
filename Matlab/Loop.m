%Exp-9[For loop]

N=input("Give me value of N:");
sum=0;
for i=1:1:N
    if mod(i,2)==0
        i=i*(-1);
    end
    sum=sum+i;
end
disp(['Sum is[for9]: ', num2str(sum)]);

%Exp-9[While loop]
N = input("Give me value of N: ");
sum = 0;
i = 1; 
while i <= N
    if mod(i, 2) == 0
        i = i * (-1);
    end
    sum = sum + i;
    i = abs(i) + 1;
end
disp(['Sum is[while9]: ', num2str(sum)]):