%Exp-8[For loop]


N=input("Give me value of N:");
sum=0;
for i=1:1:N
    
    sum=sum+(i^2);
end

disp(['Sum is:[for8] ', num2str(sum)]);



%Exp-8[While loop]
N = input("Give me value of N: ");
sum = 0;
i = 1;

while i <= N
    sum = sum + (i^2);
    i = i + 1;
end

disp(['Sum is: [while8]', num2str(sum)]);