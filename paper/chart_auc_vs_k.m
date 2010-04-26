%weighted
plot([25 50 100 200 300 400],...
     [0.9989 0.9991 0.9990 0.9981 0.9970 0.9981], 'b*-');
hold on;

%non-weighted
plot([25 50 100 200 300 400],...
     [0.9984 0.9972 0.9948 0.9877 0.9826 0.9744], 'ro-');


     
xlabel('k');
ylabel('Area under the curve (AUC)');
legend('Weighted', 'Original', 3);
axis([0 400 0.97 1]);
title('AUC vs. k');