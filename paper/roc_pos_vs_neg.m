[AUCt a a a a a a senst spect a] = rocplot(scores_total, classes, 0);
[AUCp a a a a a a sensp specp a] = rocplot(scores_positive, classes, 0);
[AUCn a a a a a a sensn specn a] = rocplot(scores_negative, classes, 0);

plot(1-spect, senst, 'g-');
hold on;
plot(1-specp, sensp, 'b*-');
plot(1-specn, sensn, 'ro-');
title('Positive vs. Negative ROC curves');
xlabel('False positive rate')
ylabel('True positive rate');
legend('Total', 'Positive', 'Negative', 4);