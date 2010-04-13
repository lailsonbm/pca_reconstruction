function [] = plot_error_correlation(xp_errors, yp_errors, xn_errors, yn_errors, tlt, xlbl, ylbl, file)
	plot(xn_errors,yn_errors,'or');
	hold on;
	h = plot(xp_errors,yp_errors,'+b');
	xlabel(xlbl);
	ylabel(ylbl);
	title(tlt);
	legend('Negative Samples', 'Positive Samples','Location','SouthEast');
	[a,b,c,fmt,d,e,f] = regexp(file, '\w{3}$');
	print(file, sprintf('-d%s',fmt{1}));
	saveas(h, sprintf('%s.fig', file), 'fig');
end