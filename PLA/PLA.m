% PLA of  Naive Cycle

function [ret w] = PLA(X, y, w, lambda)
	m= size(X,1);
	ret= 0;			% number of Update
	while(1)
		cnt= 0;		% number of Misclassier
		for i=1:m
			if(sign(X(i,:)*w)~= y(i))
				w= w+ lambda*y(i)*X(i,:)';
				cnt+= 1;
			end
		end
		ret+= cnt;
		if(cnt==0)	
			break;
		end
	end
end