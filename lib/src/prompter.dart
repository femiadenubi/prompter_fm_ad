import 'package:prompter_fm_ad/src/models/option.dart';
import 'package:prompter_fm_ad/src/models/terminal.dart';

final _terminal = const Terminal();

class Prompter {
  askMultipleChoiceQuestion(String prompt, List<Option> options) {
    final input = _ask(prompt, options);

    try {
      return options[int.parse(input) - 1].value;
    } catch (err) {
      return askMultipleChoiceQuestion(prompt, options);
    }
  }

  String askTrueOrFalseQuestion(String prompt) {
    final fullPrompt = "$prompt (y/n)";
    final response = _ask(fullPrompt, []);

    if (response.toLowerCase().startsWith("y")) {
      return "Yes";
    } else if (response.toLowerCase().startsWith("n")) {
      return "No";
    } else {
      return askTrueOrFalseQuestion(prompt);
    }
  }

  String _ask(String prompt, List<Option> options) {
    _terminal.clearScreen();
    _terminal.printPrompt(prompt);
    _terminal.printOptions(options);

    return _terminal.collectInput();
  }
}
