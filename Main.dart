import 'Monstro.dart';
import 'Personagem.dart';
import 'dart:io';

void main() {
  String? classe;
  int? vida;
  int? ataque;
  int? defesa;
  String? item;

  print('Bem vindo ao coliseu da loucura\nQual o seu nome ?');
  String? nome = stdin.readLineSync();

  while (classe == null) {
    print(
        'Por favor escolha sua classe:\n1 - Guerreiro\n2 - Arqueiro\n3 - Mago\n');
    String? escolhaClasse = stdin.readLineSync();

    switch (escolhaClasse) {
      case '1':
        classe = 'Guerreiro';
        vida = 30;
        ataque = 5;
        defesa = 10;
        item = 'Espada de ferro Adornada';
        break;
      case '2':
        classe = 'Arqueiro';
        vida = 20;
        ataque = 10;
        defesa = 5;
        item = 'Arco da bravura';
        break;
      case '3':
        classe = 'Mago';
        vida = 20;
        ataque = 15;
        defesa = 0;
        item = 'Varinha de enxurrada';
        break;
      default:
        print('Escolha inválida. Por favor, escolha uma classe válida.');
        break;
    }
  }

  Personagem personagem =
      Personagem(nome!, classe, vida!, ataque!, defesa!, item!);

  print(
      '\nOlá ${personagem.nome}\nVocê é um ${personagem.classe} que usa o item ${personagem.item} e tem os atributos:');
  print('Ataque: ${personagem.ataque}');
  print('Defesa: ${personagem.defesa}');
  print('Vida: ${personagem.vida}\n');

  print(
      'O Caeser está chamando hora de começar os DUELOS\nVoce tem a opção de lutar ou não contra os monstros faça suas escolhas de forma sabia!\n');

  while (personagem.vida > 0) {
    Monstro monstro = gerarMonstro(); // Gerar monstro aleatório
    // Exibir atributos do monstro e XP
    print('Você aceita lutar contra um ${monstro.nome}? \nAtributos:');
    print('Ataque: ${monstro.ataque}');
    print('Defesa: ${monstro.defesa}');
    print('Vida: ${monstro.vida}');
    print('Você irá ganhar ${monstro.XP} de XP caso vença o duelo!\n');

    String? Escolhaduelo = stdin.readLineSync();
    if (Escolhaduelo == 'sim') {
      print(
          '\nO duelo entre ${personagem.nome} e um ${monstro.nome} começou! O que será que ${personagem.nome} irá fazer?\n');

      while (personagem.vida > 0 && monstro.vida > 0) {
        print('\n1 - Atacar \n2 - Defender \n3 - Esquivar');
        String? escolhaacao = stdin.readLineSync();
        switch (escolhaacao) {
          case '1':
            // Ataque do personagem
            int dano = personagem.ataque - monstro.defesa;
            if (dano < 0) dano = 0;
            monstro.vida -= dano;
            print(
                '${personagem.nome} atacou ${monstro.nome} causando $dano de dano!');
            if (monstro.vida <= 0) {
              print('${monstro.nome} foi derrotado!');
              break;
            }
            dano = monstro.ataque - personagem.defesa;
            if (dano < 0) dano = 0;
            personagem.levarDano(dano);
            print(
                '${monstro.nome} atacou ${personagem.nome} causando $dano de dano!');

            if (personagem.vida <= 0) {
              print('${personagem.nome} foi derrotado!');
              break; // Sai do loop do duelo
            }
            break;

          case '2':
            print('${personagem.nome} se preparou para defender!');
            // Defesa pode ser implementada como uma mecânica que reduz dano no próximo ataque
            personagem.defesa += 5; // Exemplo de mecânica de defesa
            break;

          case '3':
            print('${personagem.nome} tentou esquivar!');
            // Implementar lógica de esquiva
            break;

          default:
            print('Escolha inválida. Por favor, escolha uma ação válida.');
            break;
        }
      }
    }
  }
}
