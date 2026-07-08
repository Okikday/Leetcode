// class Solution {
//   List<List<int>> allPathsSourceTarget(List<List<int>> graph) {
//     if (graph.isEmpty) return const [];
//     /// -------------0--------,--------1--------
//     /// ------------[0, 1, 2]-, -------[1, 2, 3]-----
//     final paths = <List<List<int>>>[];
//     final consultMap = <int, List<int>>{};

//     for (int i = 0; i < graph.length; i++) {
//       final next = graph[i];
//       for(final j in next){
//         if(consultMap.containsKey(j)){
//           consultMap
//         }

//       }

//     }
//   }
// }

// // class Node {
// //   final int val;
// //   final List<Node> nodes;
// //   const Node(this.val, [this.nodes = const []]);

// //   static Node? toNode(List<List<int>> graph) {
// //     Node? startNode = null;
// //     for (int g = 0; g < graph.length; g++) {
// //       final curr = graph[g];
// //       startNode = Node(g, curr);
// //     }
// //     return startNode;
// //   }
// // }
