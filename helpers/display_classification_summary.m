function [] = display_classification_summary(k,threshold,tp,fn,tn,fp,auc)

disp('SUMMARY');
disp(sprintf('  k = %d', k));
disp(sprintf('  threshold = %d', threshold));
disp(sprintf('  auc = %.4f', auc));
disp('Positive');
disp(sprintf('  TP: %.4f (%4d/%4d)', tp/(tp+fn), tp, tp+fn));
disp(sprintf('  FN: %.4f (%4d/%4d)', fn/(tp+fn), fn, tp+fn));
disp('Negative');
disp(sprintf('  TN: %.4f (%4d/%4d)', tn/(tn+fp), tn, tn+fp));
disp(sprintf('  FP: %.4f (%4d/%4d)', fp/(tn+fp), fp, tn+fp));

end