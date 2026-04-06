// import 'dart:math' as math;

// // first, second
// typedef HiPair = ({Hi a, Hi b});
// // pair, difference (difference between heights or y)
// typedef HiPairWithDiffPair = ({HiPair p, int d});

// class Solution {
//   HiPair? current;
//   final hiDiffList = <HiPairWithDiffPair>[];

//   int maxArea(List<int> height) {
//     // compare for each index with index+1
//     for (int i = 0; i < height.length - 2; i++) {
//       final a = height[i];
//       final b = height[i + 1];

//       final pair = (a: Hi(v: a, i: i), b: Hi(v: b, i: i + 1));

//       if (i == 0) {
//         current = pair;
//         pushInHiDiffMap(pair);
//       } else {}
//     }
//   }

//   void pushInHiDiffMap(HiPair pair) => hiDiffList.add((d: pair.a.difference(pair.b), p: pair));
// }

// class Hi {
//   /// Stands for value
//   int v;

//   /// Stands for index
//   int i;

//   Hi({required this.v, required this.i});

//   int difference(Hi b) => (b.i - i).abs();
// }

// int area(Hi a, Hi b) => math.min(a.v, b.v) * a.difference(b);
