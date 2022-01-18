clc
clear 
close all

% initializing

w=zeros(26,1);

% attributing patterns & targets

p1=[1;-1;-1;-1;1;-1;1;-1;1;-1;-1;-1;1;-1;-1;-1;1;-1;1;-1;1;-1;-1;-1;1;1]; %pattern of X
p2=[-1;1;1;1;-1;1;-1;-1;-1;1;1;-1;-1;-1;1;1;-1;-1;-1;1;-1;1;1;1;-1;1];    %pattern of O
t1=ones(26,1); %target of X
t2=-t1;        %target of O
p=[p1,p2];
t=[t1,t2];

% updting weights

for i=1:2
    deltaw=p(:,i).*t(:,i);
    w=w+deltaw;
end

% testing

xtest=input('Enter your pattern: ');

ytest=sum(xtest'*w);

if ytest>=0
    a=zeros(5,5);
        for j=1:25
            a(j)=xtest(j);
            if a(j)==p1(j)  
                if a(j)==1
                    a(j)='#';
                else
                    a(j)='.';
                end
            else
            if a(j)==1
                a(j)='@';
            elseif a(j)==-1
                a(j)='o';
            else 
                a(j)='-';
            end
            end
        end
    disp(' ');disp('your input:');
    disp(' ');disp(char(a'));
    disp(' '); disp('NN output is " X "');
    
X=['#...#';'.#.#.';'..#..';'.#.#.';'#...#'];
disp(' '); disp('correct X :');
disp(' '); disp(X)  

else
    
a=zeros(5,5);
        for j=1:25
            a(j)=xtest(j);
            if a(j)==p2(j)  
                if a(j)==1
                    a(j)='#';
                else
                    a(j)='.';
                end
            else
            if a(j)==1
                a(j)='@';
            elseif a(j)==-1
                a(j)='o';
            else 
                a(j)='-';
            end
            end
        end
    disp(' ');disp('your input:');
    disp(' ');disp(char(a'));    
    disp(' '); disp('NN output is " O "');

O=['.###.';'#...#';'#...#';'#...#';'.###.'];
disp(' '); disp('correct O :');   
disp(' '); disp(O)

end
