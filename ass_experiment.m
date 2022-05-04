fprintf("Intelligent Systems Project by Axel Lim 20015790\n");

fprintf("Importing Datasets... \n");

%%Import the training worksheet from the dataset
trainingSet = ass_import("ass_processed","TrainingSet");

%%Import the testing worksheet from the dataset
testSet = ass_import("ass_processed","TestSet",[2, 16000]);

fprintf("Import Done! \n");


fprintf("Training Models... \n");

%% train the model and time it
tic
[trainedTree, validationAcc_tree] = ass_traintree(trainingSet);
timed = toc;
fprintf("Tree Training Done: %f seconds\n", timed);
tic
[trainedLog, validationAcc_log] = ass_trainlog(trainingSet);
timed = toc;
fprintf("Logistic Training Done: %f seconds\n", timed);
tic
[trainedsvm, validationAcc_svm] = ass_trainsvm(trainingSet);
timed = toc;
fprintf("SVM Training Done: %f seconds\n", timed);
tic
[trainedBoosted, validationAcc_boosted] = ass_trainboosted(trainingSet);
timed = toc;
fprintf("Boosted Tree Training Done: %f seconds\n", timed);

%% display the training validation accuracy
fprintf("Validation Accuracy for Decision Tree: %2f \n", validationAcc_tree);
fprintf("Validation Accuracy for Logistic Regression: %2f \n", validationAcc_log);
fprintf("Validation Accuracy for Support Vector Machines: %2f \n", validationAcc_svm);
fprintf("Validation Accuracy for Boosted Decision Trees: %2f \n", validationAcc_boosted);

fprintf("Training Done! \n");

%% test data
fprintf("Testing... \n");

source = testSet(:,"HeartDisease");
tic
fprintf("Accuracy on test data for Tree = %f , done in %f seconds\n", ass_testAcc(trainedTree.predictFcn(testSet),source), toc);
tic
fprintf("Accuracy on test data for Logistics = %f , done in %f seconds\n", ass_testAcc(trainedLog.predictFcn(testSet),source), toc);
tic
fprintf("Accuracy on test data for SVM = %f , done in %f seconds\n", ass_testAcc(trainedsvm.predictFcn(testSet),source), toc);
tic
fprintf("Accuracy on test data for Boosted Trees = %f , done in %f seconds\n", ass_testAcc(trainedBoosted.predictFcn(testSet),source), toc);

fprintf("Testing Done! \n");