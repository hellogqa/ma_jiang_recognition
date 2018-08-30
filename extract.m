function dst = extract(src)
% EXTRACT 提取麻将图案

[y, x] = size(src); 
V_y = zeros(y, 1); 
for i = 1:y
    for j = 1:x
       if src(i,j) == 1
           V_y(i,1) = V_y(i,1) + 1; 
       end
    end
end
PY1 = 1; 
while (V_y(PY1,1)<20) && (PY1<y)
    PY1 = PY1 + 1; 
end
PY2 = y;
while (V_y(PY2,1)<20) && (PY2>PY1)
    PY2 = PY2 - 1; 
end
V_x = zeros(1, x); 
for  j = 1:x
    for i = 1:y
       if src(i,j) == 1
           V_x(1,j) = V_x(1,j) + 1; 
       end
    end
end
PX1 = 1;
while (V_x(1,PX1)<20) && (PX1<x)
    PX1 = PX1 + 1; 
end
PX2 = x;
while (V_x(1,PX2)<20) && (PX2>PX1)
    PX2 = PX2 - 1; 
end
temp = src(PY1:PY2, PX1:PX2); 
dst = imresize(temp, [160, 120]);

