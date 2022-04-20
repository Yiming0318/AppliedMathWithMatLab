close all; clear all; clc
%%problem 1
A  = [-1/sqrt(2) 1 0 0 0 0 0 0 0 0 0 0 0
      -1/sqrt(2) 0 0 0 0 0 0 0 -1 0 0 0 0
      0 -1 1 0 0 0 0 0 0 -1/sqrt(2) 0 1/sqrt(2) 0
      0 0 0 0 0 0 0 0 0 -1/sqrt(2) -1 -1/sqrt(2) 0
      0 0 -1 1/sqrt(2) 0 0 0 0 0 0 0 0 0
      0 0 0 -1/sqrt(2) 0 0 0 0 0 0 0 0 -1
      0 0 0 -1/sqrt(2) -1 0 0 0 0 0 0 0 0
      0 0 0 0 1 -1 0 0 0 0 0 -1/sqrt(2) 0 
      0 0 0 0 0 0 0 0 0 0 0 1/sqrt(2) 1
      0 0 0 0 0 1 -1 0 0 0 0 0 0 
      0 0 0 0 0 0 0 0 0 0 1 0 0  
      0 0 0 0 0 0 1 -1 0 1/sqrt(2) 0 0 0 
      0 0 0 0 0 0 0 0 1 1/sqrt(2) 0 0 0];
  
  
  B = [0
      0
      0
      0
      0
      0
      0
      0
      10000
      0
      11500
      0
      15000];
  A1 = A \ B;
  %%problem 1 (a)
  save('A1.dat','A1','-ascii');
  %%problem 1 (b)
  A2 = max(abs(A1));
  save('A2.dat','A2','-ascii');
  %%problem1 (c) (d)
  x = 0;
  new = zeros(13,1);
  while max(abs(new)) <= 30000 
      x = x + 1;
      B(9,1) = 10000 + 100 * x;
      new = A \ B;
  end
  A3 = 10000 + x * 100;
  for i = 1 :13
    temp = new(i,1);
        if abs(temp) >= 30000
            A4 = i;
        end
  end
  save('A3.dat','A3','-ascii');
  save('A4.dat','A4','-ascii');
  
  %%problem2(a)
  A = [75 -20 -30
      -20 40 -15
      -30 -15 55];
  [L,U,P] = lu(A);
  A5 = U * L * P;
  save('A5.dat','A5','-ascii');
  
  %%problem2 (b)
  B = [25;30;5];
  y = L\(P*B);
  A6 = U\y;
  save('A6.dat','A6','-ascii');
  
  %%problem2 (c)
  A7 = zeros(1,100);
  for i = 1:100
      B = [50;0;i];
      [L,U,P] = lu(A);
      y = L \ (P*B);
      x = U \ y;
      A7(1,i) = x(2,1);
  end
  save('A7.dat','A7','-ascii');
  %%problem3 (a)?b)
  A = hilb(11);
  v = [1;1;1;1;1;1;1;1;1;1;1];
  b = A * v;
  x = A \ b;
  e = v - x;
  r = A * x - b;
  A8 = zeros(1,2);
  A8(1,1) = norm(e);
  A8(1,2) = norm(r);
  save('A8.dat','A8','-ascii');
  %%problem3 (c)
  [L,U,P] =  lu(A);
  y = L \ (P * b);
  x = U \ y;
  e = v - x;
  r = A * x - b;
  A9 = zeros(1,2);
  A9(1,1) = norm(e);
  A9(1,2) = norm(r);
  save('A9.dat','A9','-ascii');
  %%problem3 (d)
  x = inv(A) * b;
  A10 = zeros(1,2);
  e = v - x;
  r = A * x - b;
  A10(1,1) = norm(e);
  A10(1,2) = norm(r);
  save('A10.dat','A10','-ascii');
  
 
  
      
      
      
  
      
      
      