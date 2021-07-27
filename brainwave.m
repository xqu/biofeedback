% visualize brainwaves, noise and unknown data are marked

for session = 1:6
    data = dlmread("rwt/raw/7_rwt_s"+session+".txt");
    data = data(1:3000, 2:21);

    F=figure;
    sgtitle("subject 1 session "+session)
    set(gcf,'color','w');
    nodes = ["TP9","AF7","AF8","TP10"];

    b=subplot(5,1,2);
    plot(data(:,5),'-b')
    set(gca,'xtick',[]);
    set(subplot(5,1,2),'Color',[0 0 1 0.05])
    hold on
    plot(data(:,6)+2.3,'-b')
    plot(data(:,7)+3.3,'-b')
    plot(data(:,8)+4.1,'-b')
    for l = 0:600:2400
        xline(l,'--b')
    end
    y=ylim;
    I=[];
    for i=1:4
        I=[I,y(1)+i/5*(y(2)-y(1))];
    end
    yticks(I)
    yticklabels(nodes)
    text(-450,(y(1)+y(2))/2,"beta\newline13-32HZ",'Color',[0 0 1 0.05])
    set(gca, 'Position', [.15 0.58 0.8 0.16])

    a=subplot(5,1,1);
    plot(data(:,13),'-r')
    hold on
    plot(data(:,14)+3,'-r')
    plot(data(:,15)+5,'-r')
    plot(data(:,16)+7.5,'-r')
    set(gca,'xtick',[]);
    for l = 0:600:2400
        xline(l,'--r')
    end
    set(subplot(5,1,1),'Color',[1 0 0 0.05])
    y=ylim;
    I=[];
    for i=1:4
        I=[I,y(1)+i/5*(y(2)-y(1))];
    end
    yticks(I)
    yticklabels(nodes)
    text(-450,(y(1)+y(2))/2,"gamma\newline32-100HZ",'Color',[1 0 0 0.05])
    set(gca, 'Position', [0.15 0.74 0.8 0.16])

    d=subplot(5,1,4);
    plot(data(:,17),'-m')
    set(gca,'xtick',[]);
    set(subplot(5,1,4),'Color',[1 0 1 0.05])
    hold on
    plot(data(:,18)+1.4,'-m')
    plot(data(:,19)+2.5,'-m')
    plot(data(:,20)+3.5,'-m')
    for l = 0:600:2400
        xline(l,'--m')
    end
    y=ylim;
    I=[];
    for i=1:4
        I=[I,y(1)+i/5*(y(2)-y(1))];
    end
    yticks(I)
    yticklabels(nodes)
    text(-450,(y(1)+y(2))/2,"theta\newline4-8HZ",'Color',[1 0 1 0.05])
    set(gca, 'Position', [.15 0.26 0.8 0.16])

    c=subplot(5,1,3);
    plot(data(:,1),'-c')
    set(gca,'xtick',[]);
    set(subplot(5,1,3),'Color',[0 1 1 0.05])
    hold on
    plot(data(:,2)+2.8,'-c')
    plot(data(:,3)+4.8,'-c')
    plot(data(:,4)+6.3,'-c')
    for l = 0:600:2400
        xline(l,'--c')
    end
    y=ylim;
    I=[];
    for i=1:4
        I=[I,y(1)+i/5*(y(2)-y(1))];
    end
    yticks(I)
    yticklabels(nodes)
    text(-450,(y(1)+y(2))/2,"alpha\newline8-13HZ",'Color',[0 1 1 0.05])
    set(gca, 'Position', [.15 0.42 0.8 0.16])

    e=subplot(5,1,5);
    plot(data(:,9),'-g')
    set(gca,'xtick',[]);
    set(subplot(5,1,5),'Color',[0 1 0 0.05])
    hold on
    plot(data(:,10)+1.3,'-g')
    plot(data(:,11)+2.3,'-g')
    plot(data(:,12)+2.8,'-g')
    for l = 0:600:2400
        xline(l,'--g')
    end
    y=ylim;
    I=[];
    for i=1:4
        I=[I,y(1)+i/5*(y(2)-y(1))];
    end
    yticks(I)
    yticklabels(nodes)
    text(-450,(y(1)+y(2))/2,"delta\newline0.5-4HZ",'Color',[0 1 0 0.05])
    set(gca, 'Position', [.15 0.1 0.8 0.16])

    xticks([600 1200 1800 2400 3000])
    xticklabels([1,2,3,4,5])
    xlabel("minutes")
    % set(F, 'PaperPositionMode', 'auto')
    % set(gcf, 'InvertHardCopy', 'off'); % setting 'grid color reset' off
    % set(gcf, 'Color', [1 1 1]); %setting figure window background color back to white
    %saveas(F,strcat("subject"+subject_id+"_session"+session+"_bandgraph.png"));

    nF = table2array(readtable(strcat("rwt/noise/rwt_subject_1_session_",string(session),".csv")));
    nInd = find(nF(:,1)==0);
    noise = [];
    l=nInd(1);
    cur=nInd(1);
    for i=2:size(nInd,1)
     if nInd(i)~=cur+1
         noise=[noise;[l,nInd(i-1)]];
         l=nInd(i);
     end
     cur=nInd(i);
    end
    noise=[noise;[l,nInd(i)]];
    
    uF = table2array(readtable("rwt/unknown/data_remain1"));
    uF = uF(session*3000-2999:session*3000,:);
    uInd = find(uF(:,1)==0);
    unknown = [];
    l=uInd(1);
    cur=uInd(1);
    for i=2:size(uInd,1)
     if uInd(i)~=cur+1
         unknown=[unknown;[l,uInd(i-1)]];
         l=uInd(i);
     end
     cur=uInd(i);
    end
    unknown=[unknown;[l,uInd(i)]];

    p = [a,b,c,d,e];
    for i=1:size(unknown,1)
        x1 = unknown(i,1);
        x2 = unknown(i,2);
        for j=1:5
            axes(p(j));
            y=ylim;
            y1 = y(1);
            y2 = y(2);
            p1=patch([x1,x2,x2,x1,],[y1,y1,y2,y2],[0.9290 0.6940 0.1250],'FaceAlpha', 0.2,'EdgeColor','none');
            hold on
        end
    end
    for i=1:size(noise,1)
        x1 = noise(i,1);
        x2 = noise(i,2);
        for j=1:5
            axes(p(j));
            y=ylim;
            y1 = y(1);
            y2 = y(2);
            p2=patch([x1,x2,x2,x1,],[y1,y1,y2,y2],[0.8500 0.3250 0.0980],'FaceAlpha', 0.4,'EdgeColor','none');
            hold on
        end
    end
    legend([p1,p2],[strcat("unknown(",string(round(size(uInd,1)/30,2)),"%)"),strcat("noise(",string(size(nInd,1)/30),"%)")],'Color','w')
end
