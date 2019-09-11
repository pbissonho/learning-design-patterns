import 'package:design_patterns/src/behavioral/observer.dart';
import 'package:test/test.dart';

void main() {
  test("Observer", () {
    IncrementBloc bloc = IncrementBloc();
    ConsoleObservador observador = ConsoleObservador();

    bloc.addObserver(observador);

    bloc.increment();
    bloc.increment();
  });
}
