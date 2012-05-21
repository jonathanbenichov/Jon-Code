function [max_r,lag_of_best_corr,r]=crosscorrelate(a,b);

%crosscorrelate: crosscorrelates vectors 'a' and 'b'; 
%  returnes:
    %peak r ('max_r');
    %lags ('lag_of_best_corr');
    %r (vector r);


ser_2=a;
ser_3=b;

delay_record=1;

    delay=0;
    don_sum=0;
    denom_1_sum=0;
    denom_2_sum=0;
    
    index=1;
for delay=-length(ser_2)./4+2:length(ser_2)./4-2; 
    delay=round(delay);
        for i=1:length(ser_2)-2;
             j=i-delay;
             if j>=1&j<length(ser_2)-2;
                don(i)=((ser_2(i)-mean(ser_2))*(ser_3(j)-mean(ser_3)));
                denom_1(i)=(ser_2(i)-mean(ser_2))^2;
                denom_2(i)=(ser_3(j)-mean(ser_3))^2;
    
                don_sum=sum([don_sum don(i)]);
                denom_1_sum=sum([denom_1_sum denom_1(i)]);
                denom_2_sum=sum([denom_2_sum denom_2(i)]);
             end
        end
r(index)=don_sum./sqrt(denom_1_sum.*denom_2_sum);
lag(index)=delay;
don_sum=0;
denom_1_sum=0;
denom_2_sum=0;
index=index+1;
end


[max_r,best_corr_index]=max(r);
lag_of_best_corr=lag(best_corr_index);
    