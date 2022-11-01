# Face-Recognition using MATLAB

## Overview

Face Recognition is a task that is trivial to humans under di↵erent lighting conditions, obstructions such as accessories, however, it has been a challenging task for a computer until the development of various face recognition techniques such as template matching and neural networks specifically CNNs. The current study employs three face recognition methods; Template matching, AlexNet and GoogLeNet. Image processing and augmentation was implemented and results showed that AlexNet outperformed the other methods. GoogLeNet did not produce robust results possibly due to the lack of large training dataset and the image quality which have been discussed. The paper provides a comparison and evaluation of the different recognition methods based on a relatively small face dataset.

## Dataset

A face database was provided with a total of 100 faces which contains multiple images from different subjects. The images were of the same size 600 x 600 in RGB channels. The training dataset consisted of one image per subject as the template and the test dataset had a total of 1344 images which were captured in different poses and lighting conditions. The training images on the dataset consisted of a single image captured in a certain pose and lighting of a subject corresponding to the several other poses in the test folder. The folders were part of the FaceDatabase directory. An evaluation code was used to test the accuracy of the algorithms. The true face IDs for the testing of the subjects was given in a MATLAB matrix and was loaded into the evaluation code. The aim of the program was to design two additional algorithms that would help classify the data. A baseline method involving cross correlation-based template matching was provided which had a baseline accuracy of approximately 25 percent.

## Algorithms

All programming was conducted on MATLAB and additional toolboxes for CNNs such as the deep learning toolbox and others were installed through MathWorks. Three types of algorithms were implemented. The baseline measure that was performed was based on a template matching recognition method. AlexNet was the second method that was implemented which utilised the Deep Learning Toolbox and lastly GoogLeNet was another CNN that was used to test for face recognition.
