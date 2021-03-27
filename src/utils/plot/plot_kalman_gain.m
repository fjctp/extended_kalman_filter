function plot_kalman_gain(logsout)

kalman_gain = logsout.get('K').Values;

nRow = 3;
nCol = 3;

figure;
for iRow = 1:nRow
    for iCol = 1:nCol
        index = (iRow-1)*3+iCol;
        subplot(nRow, nCol, index);
        plot(kalman_gain.Time, squeeze(kalman_gain.Data(iRow,iCol,:)));
    end
end

end