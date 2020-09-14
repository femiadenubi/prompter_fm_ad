import 'package:prompter_fm_ad/src/models/option.dart';
import 'package:prompter_fm_ad/prompter_fm_ad.dart';

void main() {
  final options = [
    "What is your best book",
    "What is your best movie",
    "What is your best country"
  ].map((element) => Option(label: element, value: element.length)).toList();

  final yesOrNoQuestion = "Do you like Dart?";

  final prompter = Prompter();

  final colorCode = prompter.askMultipleChoiceQuestion("What you fancy ?", options);  

  final userResponse = prompter.askTrueOrFalseQuestion(yesOrNoQuestion);

  print("User selected the color code $colorCode");

  print("User said $userResponse to the question $yesOrNoQuestion");
}
