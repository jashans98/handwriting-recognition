function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% run each input individually; don't think there's another way right now

% TODO: see if we can chuck out this for loop an get a vectorized implementation

% insert the ones into X for the biased neuron
X = [ones(m, 1) X];

% for each input...
for i = 1:m
  % get the input layer parameters as a vector
  a1 = (X(i, :))';
  
  % calculate the activation of the first hidden layer as a vector
  a2 = sigmoid(Theta1 * a1);
  
  % add the biased parameter into a2;
  a2 = [1; a2];
  
  % calculate the hypothesis of the output layer
  a3 = sigmoid(Theta2 * a2);
  
  % get the index of the maximum value and place it in p
  [val index] = max(a3);
  
  p(i) = index;
end



% =========================================================================


end
