function teta = ar_1(S,p);
% S - оценка спектральной плотности исследуемого процесса;
% р - порядок аппроксимирующей модели авторегрессии;
% teta - найденные коэффициенты авторегрессии;

                  [m,n] = size(S); 
                      M = m*n;        
                      S = reshape(S,M,1);
                      U = zeros(p,p);   
                      b = zeros(p,1);                                
for  j=1:M;           f = pi*j/M;      
                      s = S(j,1);     
for l1=1:p;     b(l1,1) = b(l1,1)+s*cos(l1*f);
               s1(j,l1) = exp(-i*l1*f); 
for l2=1:p;    C(l1,l2) = cos((l1-l2)*f);
end; 
end;       
                      U = U+C*s;
end;            
                   teta = b'/(U+0.0001*eye(p));
                      
  