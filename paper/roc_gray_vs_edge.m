[AUCt a a a a a a senst spect a] = rocplot(scores_total, classes, 0);
[AUCg a a a a a a sensg specg a] = rocplot(scores_gray, classes, 0);
[AUCe a a a a a a sense spece a] = rocplot(scores_edge, classes, 0);

plot(1-spect, senst, 'g-');
hold on;
plot(1-specg, sensg, 'b*-');
plot(1-spece, sense, 'ro-');
title('Grayscale vs. Edge ROC curves');
xlabel('False positive rate')
ylabel('True positive rate');
legend('Total', 'Positive', 'Negative', 4);