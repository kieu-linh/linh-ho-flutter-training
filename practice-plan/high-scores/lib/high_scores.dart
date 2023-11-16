class HighScores {
  // Put your code here
  List<int> scores;
  HighScores(this.scores);
  int latest() => scores.last;
  int personalBest() {
    int max = 0;
    for (int i = 0; i < scores.length; i++) {
      if (scores[i] > max) {
        max = scores[i];
      }
    }
    return max;
  }

  int personalTopThree() {
    List<int> topThree = [];
    scores.sort();
    scores = scores.reversed.toList();
    if (scores.length < 3) {
      return scores[0];
    }
    for (int i = 0; i < 3; i++) {
      topThree.add(scores[i]);
    }
    print(topThree);

    return topThree[2];
  }
}
//test
void main() {
  HighScores scores =
      HighScores([10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]);
  print(scores.personalTopThree());
}
