% return a random permutation from X
% direction is Row.

function [tmpX, tmpy] = randomPer(X,y)
	m= size(X,1);
	tmpX= zeros(size(X));
	tmpy= zeros(size(y));
	rand('state', 100*clock);
	MAP= randperm(m);
	for k=1:m
		tmpX(k,:)= X(MAP(k),:);
		tmpy(k)= y(MAP(k));
	end
end