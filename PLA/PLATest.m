% return the Right number 

function [ret] = PLATest(X, y, w, lambda)
	m= size(X,1);
	ret= 0;
	for i=1:m
		if( sign(X(i,:)*w) == y(i))
			ret++;
		end
	end
end