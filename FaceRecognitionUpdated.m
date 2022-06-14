function  outputLabel=FaceRecognitionUpdated(trainPath, testPath)
%%   A simple face reconition method using cross-correlation based tmplate matching.
%    trainPath - '/Users/shambokarar/Downloads/Face Recognition/FaceDatabase/Train/'
%    testPath  - '/Users/shambokarar/Downloads/Face Recognition/FaceDatabase/Test/'
%    outputLabel - predicted face label for all tested images 

%% Retrieve training images and labels
nRed=4; % for windows it is the 3, Mac maybe 4. 
folderNames=dir(trainPath);
trainImgSet=zeros(600,600,3,length(folderNames)-nRed+1); % all images are 3 channels with size of 600x600
labelImgSet=folderNames(nRed:end,:); % the folder names are the labels
for i=nRed:length(folderNames)
    imgName=dir([trainPath, folderNames(i,:).name,'/*.jpg']);
    trainImgSet(:,:,:,i-nRed+1)= imread([trainPath, folderNames(i,:).name, '/', imgName.name]);
end

%% Prepare the training image: Here we simply use the gray-scale values as template matching. 
% You should implement your own feature extraction/description method here
trainTmpSet=zeros(600*600,size(trainImgSet,4)); % use 600x600 feature vector 
for i=1:size(trainImgSet,4)
    tmpI= rgb2gray(uint8(trainImgSet(:,:,:,i)));
    tmpI=double(tmpI(:))/255'; % normalise the intensity to 0-1& store the feature vector
    trainTmpSet(:,i)=(tmpI-mean(tmpI))/std(tmpI); % Use zero-mean normalisation. This is not neccessary if you use other gradient-based feature descriptor
end

%% Face recognition for the test images
testImgNames=dir([testPath,'*.jpg']);
outputLabel=[];
for i=1:size(testImgNames,1)
    testImg=imread([testPath, testImgNames(i,:).name]);
    %perform the same pre-process as the train images
    tmpI= rgb2gray(uint8(testImg));
    tmpI=double(tmpI(:))/255';                % normalise the intensity to 0-1& store the feature vector
    tmpI=(tmpI-mean(tmpI))/std(tmpI); 
    ccValue=trainTmpSet'*tmpI;                % perform dot product (cross correlationwith all the training images, and
    labelIndx=find(ccValue==max(ccValue));    % retrieve the label that correspondes to the largest value. 
    outputLabel=[outputLabel;labelImgSet(labelIndx(1),:).name];   % store the outputLabels for each of the test image
end