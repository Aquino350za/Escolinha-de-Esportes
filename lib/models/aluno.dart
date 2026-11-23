import 'mensalidade.dart';
import 'plano.dart';
import 'professor.dart';

class Aluno {
  final int idAluno;
  String nome;
  String dataNascimento;
  String telefone;
  String responsavel;
  String cpfResponsavel;
  Professor? professor; 
  Plano? plano; 
  final List<Mensalidade> _mensalidades = []; 

  Aluno({
    required this.idAluno,
    required this.nome,
    required this.dataNascimento,
    required this.telefone,
    required this.responsavel,
    required this.cpfResponsavel,
    this.professor,
    this.plano,
  }) {
    professor?.adicionarAluno(this);
  }

  List<Mensalidade> get mensalidades => _mensalidades;

  void adicionarMensalidade(Mensalidade mensalidade) {
    _mensalidades.add(mensalidade);
  }

  void alterarProfessor(Professor? novoProfessor) {
    professor?.removerAluno(this);
    professor = novoProfessor;
    novoProfessor?.adicionarAluno(this);
  }

  @override
  String toString() {
    final nomeProf = professor?.nome ?? 'Sem Professor';
    final nomePlano = plano?.nome ?? 'Sem Plano';

    return 'Aluno [ID: $idAluno'
        ' | Nome: $nome'
        ' | Data Nasc: $dataNascimento'
        ' | Tel: $telefone'
        ' | Responsável: $responsavel'
        ' | CPF Resp: $cpfResponsavel'
        ' | Professor: $nomeProf'
        ' | Plano: $nomePlano'
        ' | Mensalidades Registradas: ${_mensalidades.length}]';
  }
}