%% Simple Test the neural network for wine classification problem
%  Pattern Recognition Purpose inbuilt problem

%simple loading dataset

 input_img();    % All Training is performed in this function...
% Loading nn_training Matrix for T, Tar...
 load nn_train;


 x = double(T);
 t = double(Tar);
 %t = ind2vec(t);
%[x, t] = wine_dataset;  % wine dataset load for classification

%testing size of input and target matrix

disp(size(x));      % 13 Rows and 178 Columns
disp(size(t));      % 3 Rows  and 178 Columns


net = patternnet(10);  % Passing Hidden layers as argument

% Now viewing a net without assigning input and target matrices
view(net);


% train takes a network NET, input data x
% and target data t and returns the network after training it, and a
% a training record TR in the form of structure.

[net, tr] = train(net, x, t);
nntraintool;

% ploting the performance of neural network, this can be plotted
% using nntraintool.

figure, plotperform(tr);

testX = x(:, tr.testInd);
testT = t(:, tr.testInd);

testY = net(testX);
testIndices = vec2ind(testY);
figure, plotconfusion(testT, testY);


% Evaluating Performance of each individual plot
[c, cm] = confusion(testT, testY);
fprintf('Percentage of Correct Classification: %f%%\n', 100*(1-c));
fprintf('Percentage of Incorrect Classification: %f%%\n', (100*c));
disp(c);

