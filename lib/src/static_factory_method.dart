// Static Factory Pattern 

class GeradorInAleatorio {
  final int min;
  final int max;

  GeradorInAleatorio(this.min, this.max);

  // Static Factory Pattern
  // Form that Dart provides 
  factory GeradorInAleatorio.entre(int min, int max) {
    return GeradorInAleatorio(min, max);
  }
  
  // Static Factory Pattern 
  // Form used in other linquagens
  static GeradorInAleatorio geradorInAleatorio_entre(int min, int max){
    return GeradorInAleatorio(min, max);
  }
}

