import 'aluno.dart';
import 'plano.dart';

class Mensalidade {
  final int idMensalidade;
  double valor;
  String dataVencimento;
  String? dataPagamento; 
  double desconto;
  Aluno? aluno; 
  Plano? plano; 
  String _status = 'Pendente'; 

  Mensalidade({
    required this.idMensalidade,
    required this.valor,
    required this.dataVencimento,
    this.dataPagamento,
    this.desconto = 0.0,
    this.aluno,
    this.plano,
  });

  String get status => _status;

  void aplicarDescontoIrmao(double percentual) {
    desconto += percentual;
    valor = valor * (1 - (percentual / 100.0));
  }

  bool estaEmAtraso() {
    return _status.toLowerCase() == 'pendente';
  }

  void registrarPagamento(String data) {
    dataPagamento = data;
    _status = 'Pago';
  }

  @override
  String toString() {
    final nomeAluno = aluno?.nome ?? 'Sem Aluno';
    final nomePlano = plano?.nome ?? 'Sem Plano';

    return 'Mensalidade [ID: $idMensalidade'
        ' | Aluno: $nomeAluno'
        ' | Plano: $nomePlano'
        ' | Valor: R\$ ${valor.toStringAsFixed(2)}'
        ' | Vencimento: $dataVencimento'
        ' | Status: $_status]';
  }
}