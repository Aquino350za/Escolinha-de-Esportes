import 'mensalidade.dart';

abstract class Plano {
  final int idPlano;
  String nome;
  double valor;
  int duracaoMeses;
  int diaVencimento;
  String? descricao; 
  final List<Mensalidade> _mensalidadesGeradas = []; 

  Plano({
    required this.idPlano,
    required this.nome,
    required this.valor,
    required this.duracaoMeses,
    required this.diaVencimento,
    this.descricao,
  });

  List<Mensalidade> get mensalidadesGeradas => _mensalidadesGeradas;

  void adicionarMensalidade(Mensalidade mensalidade) {
    _mensalidadesGeradas.add(mensalidade);
  }

  double calcularValorFinal();

  @override
  String toString() {
    return 'Plano [ID: $idPlano, Nome: $nome, '
        'Valor Base: R\$ ${valor.toStringAsFixed(2)}, '
        'Duração: $duracaoMeses mês(es), '
        'Cobranças Geradas: ${_mensalidadesGeradas.length}]';
  }
}

class Mensal extends Plano {
  double taxaAdesao;

  Mensal({
    required super.idPlano,
    required super.nome,
    required super.valor,
    required super.duracaoMeses,
    required super.diaVencimento,
    super.descricao,
    required this.taxaAdesao,
  });

  @override
  double calcularValorFinal() {
    return valor + taxaAdesao;
  }
}

class Trimestral extends Plano {
  double descontoTrimestral;

  Trimestral({
    required super.idPlano,
    required super.nome,
    required super.valor,
    required super.duracaoMeses,
    required super.diaVencimento,
    super.descricao,
    required this.descontoTrimestral,
  });

  @override
  double calcularValorFinal() {
    return valor * (1 - (descontoTrimestral / 100.0));
  }
}

class Anual extends Plano {
  double descontoAnual;

  Anual({
    required super.idPlano,
    required super.nome,
    required super.valor,
    required super.duracaoMeses,
    required super.diaVencimento,
    super.descricao,
    required this.descontoAnual,
  });

  @override
  double calcularValorFinal() {
    return valor * (1 - (descontoAnual / 100.0));
  }
}