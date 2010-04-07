function [] = plot_error_correlation(gp_errors, ep_errors, gn_errors, en_errors, tlt, file)
	plot(gn_errors,en_errors,'+r');
	hold on;
	plot(gp_errors,ep_errors,'ob');
	xlabel('grayscale error');
	ylabel('edge error');
	title(tlt);
	legend('Negative Samples', 'Positive Samples','Location','SouthEast');
	[a,b,c,fmt,d,e,f] = regexp(file, '\w{3}$');
	print(file, sprintf('-d%s',fmt{1}));
end