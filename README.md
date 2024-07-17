# DijkstraAlgorithm

This repository contains a MATLAB implementation of Dijkstra's algorithm, which finds the shortest paths from a starting node to all other nodes in a weighted directed graph. The graph is represented by adjacency matrices and plotted using MATLAB's built-in functions.

## Introduction
Dijkstra's algorithm is a popular algorithm for finding the shortest paths between nodes in a graph. This implementation uses MATLAB to define the graph, run the algorithm, and display the results. Note that Dijkstra's algorithm assumes all edge weights are non-negative.

## Code Explanation
The main script dijkstra_algorithm.m contains the following steps:

1. Graph Definition:

* Define the edges of the graph using vectors s, t, and weights.
* Create a sparse matrix representation of the graph and convert it to a full matrix.

2. Graph Plotting:

* Define the node names.
* Create and plot the directed graph with edge labels.

3. Dijkstra's Algorithm:

* Initialize the cost, distance, predecessor, and visited arrays.
* Implement the main loop of Dijkstra's algorithm to find the shortest paths.
* Output the results, including the cost and path for each node.

4. Handling Negative Weights:

* Check for negative edge weights at the beginning of the script.
* If negative weights are detected, print an error message and stop execution.

5. Special Cases:

* Handle special cases where the path does not exist.

## Example Output

The script outputs the shortest path and cost from the starting node to all other nodes. For example:

* The cost from node a to node b is 10
* The path is: b<-a
* The cost from node a to node c is 12
* The path is: c<-d<-a
...

## Handling Negative Weights
Dijkstra's algorithm cannot handle negative weights. If negative edge weights are detected, the script will print an error message and stop execution. If your graph contains negative weights, consider using the Bellman-Ford algorithm instead.
