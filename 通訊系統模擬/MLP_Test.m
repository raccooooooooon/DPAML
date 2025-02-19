function MLP_Test
%% TRAIN MULTI-LAYER PERCEPTRON MODEL
clear all;clc;
% Load dataset and define features
dataset = 'Fashion_MNIST';      % Choose between MNIST and Fashion_MNIST
data = load_data(strcat(dataset,'.mat'));
% Parse the data from the dataset
% Training Data
X = data.training.input;
Y = data.training.output;
% Test Data
X_test = data.test.input;
Y_test = data.test.output;
% Validation Data
X_val = data.validation.input;
Y_val = data.validation.output;
% define input and output features
n_features = data.input_count;
n_output_features = data.output_count;
n_data = data.training_count;   % Number of samples in training set
n_test_data = data.test.count;  % Number of samples in test set
% Construct MLP architecture
network = MLPNet();
%%%%%%% Question 1. Design your own network%%%%%%%%%%%
                                                 % You can find the AddInputLayer, AddHiddenLayer,and AddOutputLayer functions in the 86-th line in the MLPNet.m file.
                                                 % Use network.________Layer('_____',false) to call the functions
                                                 % You have to determine which activation function to use for the AddHiddenLayer and AddOutputLayer functions.                                                 
                                                 % Noted that the N_n equals to 256.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
network.AddInputLayer(n_features,false);
network.AddHiddenLayer(256,'tanh',false);
network.AddHiddenLayer(256,'relu',false);
network.AddHiddenLayer(256,'relu',false);
network.AddOutputLayer(n_output_features,'softmax',false)


network.NetParams('rate',0.0005,'momentum','adam','lossfun','crossentropy',...
    'regularization','L2');
network.trainable = true;
network.Summary();
% Training parameters
acc = 0;                        % pre-allocate training accuracy
n_batch = 128;                  % Size of the minibatch
max_epoch = 40;                 % Maximum number of epochs
max_batch_idx = floor(n_data/n_batch);          % Maximum batch index
max_num_batches = max_batch_idx.*max_epoch;     % Maximum number of batches
% Pre-allocate for epoch and error vectors (for max iteration)
epoch = zeros(1,max_num_batches-1);
d_loss = epoch;
ce_test = zeros(max_epoch,1);
ce_train = zeros(max_epoch,1);
ce_val = zeros(max_epoch,1);
% Initialize iterator and timer
batch_idx = 1;      % Index to keep track of minibatches
epoch_idx = 1;      % Index to keep track of epochs
target_accuracy = 98; % Desired classification accuracy
while ((epoch(batch_idx)<max_epoch)&&(acc<target_accuracy))
    
    % Compute current epoch
    epoch(batch_idx+1) = batch_idx*n_batch/n_data;
    % Randomly sample data to create a minibatch
    rand_ind = randsample(n_data,n_batch);
    % Index into input and output data for minibatch
    X_batch = X(rand_ind,:);    % Sample Input layer
    Y_batch = Y(rand_ind,:);    % Sample Output layer
    
    % Train model
    d_loss(batch_idx+1) = network.training(X_batch,Y_batch)./n_batch;
    
    % Only compute error/classification metrics after each epoch
    if ~(mod(batch_idx,max_batch_idx))
        % Compute error metrics for training, test, and validation set
        [~,ce_train(epoch_idx),~]=network.NetworkError(X,Y,'classification');
        [~,ce_val(epoch_idx),~]=network.NetworkError(X_val,Y_val,'classification');
        tic;
        [~,ce_test(epoch_idx),~]=network.NetworkError(X_test,Y_test,'classification');
        eval_time = toc;
        fprintf('\n-----------End of Epoch %i------------\n', epoch_idx);
        fprintf('Loss function: %f \n',d_loss(batch_idx+1));
        fprintf('Test Set Accuracy: %f Training Set Accuracy: %f \n',1-ce_test(epoch_idx),1-ce_train(epoch_idx));
        fprintf('Test Set Evaluation Time: %f s\n\n',eval_time);
        acc = (1-ce_test(epoch_idx));
        epoch_idx = epoch_idx+1;    % Update epoch index
    end
    % Update batch index
    batch_idx = batch_idx+1;
end
% Remove trailing zeros if training met target accuracy before maximum
% number of epochs
ce_test = ce_test(1:(epoch_idx-1));
ce_train = ce_train(1:(epoch_idx-1));
ce_val = ce_val(1:(epoch_idx-1));
% Plot classification results
figure(1)
plot(ce_test);hold on;
plot(ce_train);hold on;
plot(ce_val);hold off;
grid on;
xlabel('Epoch');
ylabel('Classification Error');
legend('Test Set','Training Set','Validation Set');
%% TEST MNIST AND FASHION_MNIST
% Description: This script randomly samples 32 input features from the test
% space and runs them through the (previously trained) network to predict
% the output classification. The results are plotted.
figure(2)
for i = 1:32
    
    % Randomly sample the test space
    sample_ind = randsample(n_test_data,1);
	X_sample = X_test(sample_ind,:);
    Y_sample_act = Y_test(sample_ind,:);
    Y_sample_pred = network.test(X_sample);
        
    % Reshape input features to reconstruct image
    X_new = reshape(X_sample(1:end),[28,28]);
    set(gcf,'Position',[20 20 1600 800]);
    subplot(4,8,i)
    imshow(imcomplement(X_new),'InitialMagnification','fit');
    box on;
    
    % Extract predicted and actual labels
    [max_val,label] = max(Y_sample_pred);
    [~,label_act] = max(Y_sample_act);
    
    switch dataset
        case 'MNIST'
            y_act_string = num2str(label_act);
            y_pred_string = num2str(label);
            
        case 'Fashion_MNIST'
                fashion_string = {'trouser','pullover','dress','coat','sandal','shirt','sneaker','bag','boot','tshirt'};
                y_act_string = fashion_string{label_act};
                y_pred_string = fashion_string{label};
    end
    
    % Compare predicted with actual
    if(label==label_act)
        text(3,3,'O','Color','g','FontSize',18);
    else
        text(3,3,'X','Color','r','FontSize',18);
    end
    % Print prediction, probability, and actual label to title
    title({strcat('$$y$$: ',y_act_string);strcat('$$\hat{y}$$: ',y_pred_string,'(',num2str(max_val),')')} );
end
end