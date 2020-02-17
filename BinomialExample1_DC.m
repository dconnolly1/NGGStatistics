% Exercise 1

% Question 1
% Exercise 1: Assume that there are 10 quanta available in a nerve 
% terminal, and for a given release event each is released with a 
% probability of 0.2. For one such event, what is the probability 
% that 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, or 10 quanta will be released?
function prob = quantprob(p,n,k)
    prob = factorial(n)/((factorial(k))*(factorial(n-k)))*p^k*((1-p)^(n-k))
end

p = 0.2; %probability of release
n = 10;   %number of quanta that can be released
N = 1000;     % number of "simulations"
outcomes = binornd(n,p,N,1);




% Make histogram of all possible outcomes
edges = -0.5:10.5;
counts = histcounts(outcomes, edges);

% Show a bar plot of the simulated bionimal distribution
clf;
xs = edges(1:end-1)+diff(edges)/2;
bar(xs, counts);
title(sprintf('Histogram of binomial distribution, n=%d, p=%.2f, N=%d simulations', ...
   n,p,N));
xlabel(sprintf('Number of successes in %d tries', n));
ylabel('Count');

% Normalize it to make it a pdf. Here counts (the x-axis of the histogram)
%  is a DISCRETE variable, so we just have to add up the values
bar(xs, counts./sum(counts));
title(sprintf('PDF of binomial distribution, n=%d, p=%.2f, N=%d simulations', ...
   n,p,N));
xlabel(sprintf('Number of successes in %d tries', n));
ylabel('Probability');