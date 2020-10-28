filename = 'ELE725_lab1.wav';
info = audioinfo(filename)
DownSample(filename, 'down2.wav', 2, 1);
DownSample(filename, 'down4.wav', 4, 1);
DownSample(filename, 'down8.wav', 8, 1);

graphsig(filename);
graphsig('down2.wav');
graphsig('down4.wav');
graphsig('down8.wav');

graphsig('recovereddown2.wav');
graphsig('recovereddown4.wav');
graphsig('recovereddown8.wav');
error = UniformQuant(filename, 'quan2.wav', 2);
error1 = MulawQuant(filename, 'Muquan2.wav', 2,100);
error = UniformQuant(filename, 'quan4.wav', 4);
error1 = MulawQuant(filename, 'Muquan4.wav', 4,100);
error = UniformQuant(filename, 'quan8.wav', 8);
error1 = MulawQuant(filename, 'Muquan8.wav', 8,100);

total = error(: , 1) + error(: , 2);
total1 = error1(: , 1) + error1(: , 2);
plot (  total(1:200 , 1));
hold on;
plot (total1(1: 200, 1));
xlabel('Sample Number');
ylabel('Error Magnitude');
title('Sample Number vs Error Magnitude')
legend('Uniform Error', 'Mulaw Error')
hold off