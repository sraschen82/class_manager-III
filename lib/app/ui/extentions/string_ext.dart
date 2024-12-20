extension StringExt on String {
  removeNull() => replaceAll('null', '');

  String centralized(int size) {
    List<String> lines = this.split('\n');

    List<String> centralized = lines.map((linha) {
      int espacosEsquerda = ((size - linha.length) / 2).floor();
      int espacosDireita = size - linha.length - espacosEsquerda;
      return ' ' * espacosEsquerda + linha + ' ' * espacosDireita;
    }).toList();
    return centralized.join('\n');
  }
}

String centralizarLinhas(String texto, int largura) {
  List<String> linhas = texto.split('\n');
  List<String> linhasCentralizadas = linhas.map((linha) {
    int espacosEsquerda = ((largura - linha.length) / 2).floor();
    int espacosDireita = largura - linha.length - espacosEsquerda;
    return ' ' * espacosEsquerda + linha + ' ' * espacosDireita;
  }).toList();
  return linhasCentralizadas.join('\n');
}
