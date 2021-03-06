trainning  = mat1(1:302,:);
testing  = mat1 (303:392,:);
trainningmse = [];
testingmse = [];
for features = 1:7
    subplot(3,3,features);
    xlabel(names(features));
    ylabel('MPG');
    x = 0:0.01:max(mat1(:,features));
    plot(mat1(303:392,features),mpg(303:392),'+','color','k');
    hold on;
    
    m0 = ones(302,1);
    m1 = [m0, trainning(:,features).^1];
    m2 = [m1,trainning(:,features).^2];
    m3 = [m2,trainning(:,features).^3];
    m4 = [m3,trainning(:,features).^4];
    w0 = ECS171Q3(m0,mpg);
    w1 = ECS171Q3(m1,mpg);
    w2 = ECS171Q3(m2,mpg);
    w3 = ECS171Q3(m3,mpg);
    w4 = ECS171Q3(m4,mpg);
    tmp = [sum((mpg(1:302)-m0*w0).^2)/90;sum((mpg(1:302)-m1*w1).^2)/90;sum((mpg(1:302)-m2*w2).^2)/90;sum((mpg(1:302)-m3*w3).^2)/90;sum((mpg(1:302)-m4*w4).^2)/90];
    trainningmse = [trainningmse,tmp];
    y0 = w0+x*0;
    plot(x,y0);
    ylim([0,100]);
    hold on;
    y1 = w1(1)+w1(2)*x;
    plot(x,y1);
    ylim([0,100]);
    hold on;
    y2 = w2(1)+w2(2)*x+w2(3)*(x.^2);
    plot(x,y2);
    ylim([0,100]);
    hold on;
    y3 = w3(1)+w3(2)*x+w3(3)*(x.^2)+w3(4)*(x.^3);
    plot(x,y3);
    ylim([0,100]);
    hold on;
    y4 = w4(1)+w4(2)*x+w4(3)*(x.^2)+w4(4)*(x.^3)+w4(5)*(x.^4);
    plot(x,y4);
    ylim([0,100]);
    xlabel(names(features));
    ylabel('MPG');
    tm0 = ones(90,1);
    tm1 = [tm0, testing(:,features).^1];
    tm2 = [tm1,testing(:,features).^2];
    tm3 = [tm2,testing(:,features).^3];
    tm4 = [tm3,testing(:,features).^4];
    tmp = [sum((mpg(303:392)-tm0*w0).^2)/90;sum((mpg(303:392)-tm1*w1).^2)/90;sum((mpg(303:392)-tm2*w2).^2)/90;sum((mpg(303:392)-tm3*w3).^2)/90;sum((mpg(303:392)-tm4*w4).^2)/90];
    testingmse = [testingmse,tmp];
    q4trainningmse = trainningmse;
    q4testingmse = testingmse;
end;

clearvars m0 m1 m2 m3 m4 x y0 y1 y2 y3 y4 tm0 tm1 tm2 tm3 tm4 tmp w1 w2 w3 w4 w0 trainning testing features allmse testingmse trainningmse