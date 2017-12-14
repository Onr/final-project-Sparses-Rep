function x = omp(CA, b, k)
% OMP Solve the sparse coding problem via OMP
%
% Solves the following problem:
%   min_x ||b - CAx||_2^2 s.t. ||x||_0 <= k
%
% The solution is returned in the vector x

% Initialize the vector x
x = zeros(size(CA,2),1);

% TODO: Implement the OMP algorithm
% Write your code here... x = ????;
rk  = b; 
Suport=[];
for curK = 1:k
    %choose the best atom
    tmpresultVec = CA'*rk;
    [~,bestAtomIndex] = max(abs(tmpresultVec));

    Suport = [Suport,bestAtomIndex];
    %calculat coffitions
    As = CA(:,Suport);
    xs = pinv(As)*b; %pseudo inverse  A*x=b
%     xs = As'*((As'*As)^-1)*b
    x(Suport) = xs;
    rk = b-CA*x;
%     if(rk<epsilon)
%         break;
%     end
        
end

end


