clear all
clc
close all

% Example adjacency matrices (commented out for now)
% A= [0 0 1 2 
%     0 0 0 -9 
%     0 1 0 0
%     0 0 0 0];
% A=[  0     10     0     30 100    
%      10     0     50     0  0   
%      0     50     0     20   10 
%      30     0     20    0 60
%      100 0 10 60 0]; 

% Define the edges of the graph and the cost of the graph
s=[1 1 1 2 3 4 4 4 5 5 5 6 6 6 7 8 8 8 9 9];
t=[2 4 5 3 2 4 5 7 2 6 8 2 3 8 8 4 6 7 6 8];
weights = [10 2 1 -3 4 4 0 6 8 7 1 2 8 1 2 -9 2 5 7 6];

% Create a sparse matrix for the grap
a=sparse(s,t,weights,9,9);
A=full(a); %Convert the sparse matrixx to full matrix form

%Define the name of the nodes
names={'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i'};
%Create a directed graph with the defined edges and node names
bb=digraph(s,t,weights,names);

%Plot the graph
sss=plot(bb,'EdgeLabel',bb.Edges.Weight);
camroll(-270)
set(gca,'XDir','reverse')
axis off

% Get the number of nodes and edges
N=numel(bb.Nodes); %number of nodes
M=numel(bb.Edges); % number of edges

% Define the starting point for the algorithm
startingpoint=1;


%% Dijkstra Algorithm

% initialize the cost matrix
for i=1:N
    for j=1:N
        if A(i,j)==0
            cost(i,j)= Inf;
            cost(4,5)=0; % special case for node 'e'
        else
            cost(i,j)=A(i,j);
        end
    end
end

% Initialize distance, Predecessor and the visited arrays
for n=1:N
    dist(n)= cost(startingpoint,n);
    pred(n)= startingpoint;
    visited(n)=0;
end

dist(startingpoint)=0; % Distance to the starting point is 0
visited(startingpoint)=1; % Mark the starting point as visited
count=1; % initialize the count of the visited nodes

% Main loop for Dijkstra's algorithm
while count < N-1
    mindist= Inf;
    % Find the next node with the smallest distance
    for m=1:N
        if (dist(m) <= mindist) && (visited(m) == 0) 
           mindist= dist(m);
           nextnode= m;
        end
    end
    
    visited(nextnode)=1; % Mark the next node as visited
    
    % Update the distances to the neighboring nodes
    for k=1:N
        if visited(k) ==  0
            if (mindist + cost(nextnode,k)) < dist(k) % alfabetik olmasý için küçük eþittir kullandýk. non-alfabetik için küçük iþareti kullanýrýz.
                dist(k)= mindist+ cost(nextnode,k);
                pred(k)= nextnode; 
            end
        end
    end
    count=count+1;             
              
end

% Output the results
for u=1:N
    if u ~= startingpoint
        if dist(u) ~= Inf
            fprintf('The cost from node %c to node %c is %d\n', names{startingpoint},names{u}, dist(u))
            fprintf('The path is: %c', names{u})
        else 
            fprintf('There is no path to node %c\n', names{u})
        end
        j=u;
        
        % Trace the path from the starting point to the current node
        if dist(u) ~= Inf
            while 1
                j= pred(j);
                fprintf('<-%c',names{j})
                if j == startingpoint
                    break;
                end
            end
        end
    end
    fprintf('\n')
end

 
 