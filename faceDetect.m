% Read an Image
A = imread('TestImage\(1).jpg');
%figure, imshow(A);

%Get FaceDetecor Object

FaceDetector = vision.CascadeObjectDetector();

%Use Face Detector on image A and get the face

BBOX = step(FaceDetector, A);

%Annotate the face on the top of the face
B = insertObjectAnnotation(A, 'rectangle', BBOX, 'Face');
figure, imshow(B);
title('Detected Face');

