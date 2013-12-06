% PLA of  Can't Linear Separable

% cnt is the number of update
% w is the w when iterate TIMES times

function [ret w] = PLAUnLS(X, y, w, lambda, TIMES)
	m= size(X,1);
	ret= 0;			% number of Update
	for times= 1:TIMES
		for i=1:m
			if(sign(X(i,:)*w)~= y(i))
				w= w+ lambda*y(i)*X(i,:)';
				ret+= 1;
			end
		end
	end
end