samp=4.*randn(1000,1);
sig=[0.001;0.1;0.2;0.9;1;2;3;5;10;20;100];
losig=log(sig);
LL=zeros(11,1);
D=zeros(11,1);
p=randsample(1000,750);

T=zeros(750,1);
S=zeros(250,1);
t=uint16(1);
s=uint16(1);

for i=1:1000
    if ismember(i,p)==1
        T(t)=samp(i);
        t=t+1;
    else
        S(s)=samp(i);
        s=s+1;
    end
end

for i=1:11
    prod=0;
    d_el=0;
    for j=1:250
        sum=0;
        for k=1:750
            sum=sum+exp(-((S(j)-T(k))^2)/(2*sig(i)*sig(i)));
        end
        pes=sum/(750*sig(i)*sqrt(2*pi));
        pac=exp(-((S(j)^2)/32))/(4*sqrt(2*pi));
        d_el=d_el+((pes-pac)^2);
        prod=prod+log(sum);
    end
    D(i)=d_el;
    LL(i)=prod-250*log(750)-250*log(sig(i))-125*log(2*pi);
end
Prin=['Max LL at sigma equal to : 1'];

disp(Prin)


plot(losig,LL);
title(sprintf('LL vs log sigma'));
fname=sprintf('LL_vs_log_sig.png');
saveas(gcf,fname);


figure;
plot(losig,D);
title(sprintf('D vs log sigma'));
fname=sprintf('D_vs_log_sig.png');
saveas(gcf,fname);






      