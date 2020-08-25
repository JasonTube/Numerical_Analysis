function df = richardson(f,x0,h,N)
%中心差分+Richarson外推，N为外推层数,第一层为中心差分
df_tmp = zeros(1,N);
for i = 1:N
    df_tmp(i) = central(f,x0,2*h*0.5^i);
end
%disp("Richarson外推过程：")
%disp(df_tmp)
for i = 1:N
    j = N-i;
    df_tmp(1:j) = (df_tmp(2:j+1)*4^i - df_tmp(1:j)) / (4^i-1);
    %disp(df_tmp(1:j))
end
df = df_tmp(1);
end