train = auto(1:300,:);
test = auto(301:392,:);

errorCake = zeros(22,7);
figure

for i = 2:length(train(1,:))
	subplot(3,3,i-1);
	xlabel(vnames(i));
	plot(test(:,i),test(:,1),'b.');
	
	Xv = sort(test(:,i));
	for n = 0:10
		hold all;

		[weights,errorCake(2*n+1,i-1)] = regrets(train(:,i),n,train(:,1));
		
		% get the nth degree polynomial of ith feature
		testcount = length(test(:,1));
		polyn = ones(testcount,n+1);
		for term = 0:n
			polyn(:,term+1) = test(:,i).^term;
		end
			
		for ii = 1:testcount
			errorCake(2*n+2,i-1) = errorCake(2*n+2,i-1) + (test(ii,1) - (polyn(ii,:) * weights)) ^ 2;
		end
		
		p = fliplr(transpose(weights));
		Yv = polyval(p,Xv);
		
		axis([min(test(:,i))-2,max(test(:,i))+2,min(test(:,1)),max(test(:,1))]);
		plot(Xv,Yv);
	end
	
	hold off
end
