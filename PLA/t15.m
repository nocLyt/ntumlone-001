%{
	15T  45
	16T  40.4
	17T  40.1

%}

data= load('1_15.txt');
m= size(data,1);		% number of training set
X= data(:,1:4);			% Training data
y= data(:,5:5);	
X= [ones(m,1) X];
n= size(X,2);			% number of features
w= zeros(n,1);	

%%   Naive Cycle

%{		
[r w]= PLA(X,y,w,1)
%}



%% Random Cycle
%{
cnt= 2000;
sum= 0;
tmpX= zeros(m,n);
tmpy= zeros(m,1);
for times= 1:cnt
	% Make a random permutation
	[tmpX tmpy]= randomPer(X,y);
	% Do PLA
	[r w]= PLA(tmpX, tmpy, zeros(n,1), 0.5);
	sum+= r;
end

fprintf('sum= %d  %f\n', sum, sum/cnt);
%}