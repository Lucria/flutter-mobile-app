enum ResultType {
  correct,
  higher,
  lower,
  invalidInput,
  noMoves
}

Map<ResultType, String> resultDict = <ResultType, String> {
  ResultType.correct: "Correct!",
  ResultType.higher: "Gotta guess lower next time!",
  ResultType.lower: "It's higher than your guess!",
  ResultType.invalidInput: "Invalid input. It's between 50 and 180!",
  ResultType.noMoves: "Oops! Out of moves!"
};

class Result {
  final ResultType resultType;
  late String message;

  Result(this.resultType) {
    message = resultDict[resultType]!;
  }
}

// Deprecated!
class Game {
  static const int min = 50;
  static const int max = 180;
  static const int totalMoves = 5;
  int _currentMove = 0;
  late int _guessedNumber;

  Game(int heartRate) {
    _guessedNumber = heartRate;
  }

  Result nextMove(int userInput) {
    //check whether user input is valid or not
    if (userInput < min || userInput > max) {
      return Result(ResultType.invalidInput);
    }
    //increment the current move and check if there is no move left
    _currentMove += 1;
    if (_currentMove > totalMoves) {
      return Result(ResultType.noMoves);
    }

    //compare user input with guessed number and provide hint if not matched
    if (userInput == _guessedNumber) {
      return Result(ResultType.correct);
    } else {
      if (userInput > _guessedNumber) {
        return Result(ResultType.higher);
      } else {
        return Result(ResultType.lower);
      }
    }
  }
}
