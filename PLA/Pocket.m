% Do Pocket 
% Only tmpw is better than w, Then update w.
% 50Times
% 


function [w]= Pocket(X, y, lambda)
	TIMES= 50;					% iterate  times
	[m n]= size(X);
	w= zeros(n,1);
	% rw= PLATest(X,y,w,lambda);
	% fprintf('Init Right Rate: %f\n', rw/m);

	% do
	
	for times= 1:TIMES 			% iterate  times
		idx= [];		% stack
		for i= 1:m
			if(sign(X(i,:)*w) ~= y(i))
				idx= [idx i];
			end
		end
		% random choose X(id) from misclassfier
		rand('state', 100*clock);
		rList= randperm(size(idx,2));
		id= idx(rList(1));

		% random Update
		w= w+ lambda*y(id)*X(id,:)';
	end

	% rw= PLATest(X,y,w,lambda);
	% fprintf('Over Right Rate: %f\n', rw/m);

end