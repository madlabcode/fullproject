import 'package:math_expressions/math_expressions.dart';

String evaluation(String s) {
  Parser p = Parser();

  Expression exp = p.parse(s);

  double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
  if (eval - eval.toInt() == 0) {
    return eval.toInt().toString();
  }
  print(eval);
  return eval.toStringAsFixed(3);
}