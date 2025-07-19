%%Newton's forward difference method
disp("Newton's forward method")
position=[0      5       10     15     20       25];
disp(position);
temperature=[ 600   570  530   480    420     350];
disp(temperature);
n=length(position);
f=zeros(n,n);
f(:,1)=position';
f(:,2)=temperature';
for j=3:n+1
    for i=1:n-j+2                    
        f(i,j)=f(i+1,j-1)-f(i,j-1);
    end
end
disp(f);
x=input("Enter any value of x: ");
p=(x-position(1))/5;
delta_f1=f(1,3);
delta2_f1=f(1,4);
delta3_f1=f(1,5);
delta4_f1=f(1,6);
temperature= (1/5)*((delta_f1 +(2*p-1)/2*delta2_f1)+(3*p^2-6*p+2/6*delta3_f1)+(4*p^3-18*p^2+22*p-6)/24*delta4_f1);

disp("Corresponding Temperature: ");
disp(temperature);
hold on;
%%Newton's backward difference method
disp("Newton's backward method");
pos=[0      5       10     15     20       25];
disp(pos);
temp=[ 600   570  530   480    420     350];
disp(temp);
n_1=length(pos);
u=zeros(n_1,n_1);
u(:,1)=pos';
u(:,2)=temp';
for j=3:n_1+1
    for i=j-1:n_1
        u(i,j)=u(i,j-1)-u(i-1,j-1);
    end
end
disp(u);
x_1=input("Enter any value of x: ");
b=(x_1-pos(6))/5;
delta_f1=u(6,3);
delta2_f1=u(6,4);
delta3_f1=u(6,5);
delta4_f1=u(6,6);
temp= (1/5)*((delta_f1 +(2*b+1)/2*delta2_f1)+(3*b^2+6*b+2/6*delta3_f1)+(4*b^3+18*b^2+22*b+6)/24*delta4_f1);
disp("Corresponding Temperature: ");
disp(temp);
x = [0, 5, 10, 15, 20, 25];  % Position in cm
T = [600, 570, 530, 480, 420, 350];  % Temperature in °C

% Calculate the temperature gradient (dT/dx) using differences
dT_dx = diff(T) ./ diff(x);  % Difference between consecutive temperatures divided by distance

% Plot the temperature gradient
figure;
plot(x(2:end), dT_dx,'-o','LineWidth', 2, 'MarkerSize', 6,'Color','r');
xlabel('Position (cm)', 'FontSize', 12);
ylabel('Temperature Gradient (dT/dx) (°C/cm)', 'FontSize', 12);
title('Temperature Gradient along Nuclear Fuel Rod', 'FontSize', 14);
grid on;