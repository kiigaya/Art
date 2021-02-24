# Art

BOLDs.mat

BOLDs{subject, rating}, subject = 1,2,3,4,5,6, raitng 1,2,3,4 (in the task it's actually 0,1,2,3)
Inside each {subject, rating}, there's a matrix containing changes in BOLD signals in value ROI: trial x timecourse.
The timecourse is upsampled at every 0.0112 s, where TR=1.12s. See supplementary figure 3.

Feature_breakdown_to_share.m

A sample code to compute feature breakdown at each ROI using first-level results. Tested on Matlab2018b and SPM12. 


