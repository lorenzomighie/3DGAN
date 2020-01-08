function shape = load_off(filename)

shape = [];

f = fopen(filename, 'rt');

n = '';
while isempty(n)
    fgetl(f);
    n = sscanf(fgetl(f), '%d %d %d');
end

nv = n(1);
nt = n(2);
data = fscanf(f, '%f');

if length(data) == nv*3+nt*4
    data(3*nv+1:4:end)=[];
elseif length(data) ~= nv*3+nt*3
    fclose(f);
    error('load_off(): The mesh seems to be composed of non-triangular faces.');
end

shape.faces = reshape(data(end-3*nt+1:end), [3 nt])';
data = data(1:end-3*nt);
data = reshape(data, [length(data)/nv nv]);
shape.vertices = data';

fclose(f);

if min(min(shape.faces))==0
    shape.faces = 1+shape.faces;
end

shape.n = size(shape.vertices,1);
shape.m = size(shape.faces,1);

end