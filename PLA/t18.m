ST= cputime;

data= load('1_18_train.dat.txt');
m= size(data,1);		% number of training set
X= [ones(m,1) data(:,1:4)];
y= data(:,5);


data= load('1_18_test.dat.txt');
testm= size(data,1); 	% number of test set
testX= [ones(testm,1) data(:,1:4)];
testy= data(:,5);

n= size(X,2);			% number of features	

%% Random Cycle
cnt= 1;		% number of cycle
sum= 0;		% sum of test error
for times= 1:cnt
	% Make a random permutation
	[tmpX tmpy]= randomPer(X,y);
	% Do Pocket
	wp= Pocket(tmpX,tmpy,1);	% wp is Wpocket

	% Cal Test Error
	sum+= PLATest(testX, testy, wp, 1);
end
sum= (cnt*testm-sum)/(cnt*testm)

% fprintf('sum= %d  %f\n', sum, sum/cnt);
ED= cputime - ST