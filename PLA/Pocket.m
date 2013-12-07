% Do Pocket 
% Only tmpw is better than w, Then update w.
% 50Times
% 

% Puzzle!!!   nt_w= nt_w+ lambda*y(i)*X(i,:)';

function [w]= Pocket(X, y, lambda)
	TIMES= 50;					% iterate  times
	[m n]= size(X);
	w= zeros(n,1);
	rw= PLATest(X,y,w,lambda);
	% do

	it= 0;
	while(1)
		nt_w= w;
		nt_rw= PLATest(X,y,nt_w,lambda);
		
		for i=1:m
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


		if(it>= TIMES)	
			break;
		end
	end
end


%{
function [w]= Pocket(X, y, lambda)
	TIMES= 5;					% iterate  times
	[m n]= size(X);
	w= zeros(n,1);
	rw= PLATest(X,y,w,lambda);
	% do

	it= 0;
	while(1)
		nt_w= w;
		nt_rw= PLATest(X,y,nt_w,lambda);
		it+= 1;
		
		for i=1:m
			if(sign(X(i,:)*nt_w) ~= y(i))
				nt_w= w+ lambda*y(i)*X(i,:)';
				nt_rw= PLATest(X,y,nt_w,lambda);

				if(nt_rw>rw)
					w= nt_w;
					rw= nt_rw;
				end

			end

		end

		it
		w
		if(it>= TIMES)	break;

	end
end
%}


%{
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
%}