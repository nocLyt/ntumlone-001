% Do Pocket 
% Only tmpw is better than w, Then update w.
% 50Times
% 

% we should update nt_w when misclassifer
% w is the best anwser in all of (nt_w)

function [w]= Pocket(X, y, lambda)
	TIMES= 100;					% iterate  times
	[m n]= size(X);
	w= zeros(n,1);
	rw= PLATest(X,y,w,lambda);
	nt_w= w;
	nt_rw= rw;
	% do

	it= 0;
	while(1)
		% random choose  X(i)
		i= unidrnd(m);

		% Do Pocket
		if(sign(X(i,:)*nt_w) ~= y(i))
			nt_w= nt_w+ lambda*y(i)*X(i,:)';
			nt_rw= PLATest(X,y,nt_w,lambda);
			if(nt_rw>rw)
				w= nt_w;
				rw= nt_rw;
			end

		it+= 1;

		if(it>= TIMES)	
			break;
		end
	end

end
