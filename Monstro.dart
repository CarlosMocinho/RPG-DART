import 'Personagem.dart';
import 'dart:math';

class Monstro {
  String nome;
  int ataque;
  int defesa;
  int vida;

  Monstro(this.nome, this.ataque, this.defesa, this.vida);

  int get XP {
    return (ataque + defesa + vida);
  }

  void AtaqueMonstro(Personagem personagem) {
    // Lógica de ataque do monstro
    int dano = (ataque - personagem.defesa);
    dano = dano < 0 ? 0 : dano; // Garante que o dano não seja negativo
    personagem.vida -= dano;
    if (vida < 0) {
      vida = 0; // Garante que a vida não fique negativa
    }
    print('$nome atacou ${personagem.nome}. Dano causado: $dano');
  }
}

Monstro gerarMonstro() {
  final Random random = Random();
  List<String> nomes = ['Goblin', 'Esqueleto', 'Zumbi', 'Orc', 'Dragao'];
  String nome = nomes[random.nextInt(nomes.length)];

  int ataque, defesa, vida;

  switch (nome) {
    case "Goblin":
      ataque = random.nextInt(3) + 2;
      defesa = random.nextInt(1) + 1;
      vida = random.nextInt(6) + 10;
      break;
    case "Esqueleto":
      ataque = random.nextInt(3) + 6;
      defesa = random.nextInt(4) + 1;
      vida = random.nextInt(10) + 15;
      break;
    case "Zumbi":
      ataque = random.nextInt(3) + 8;
      defesa = random.nextInt(3) + 3;
      vida = random.nextInt(10) + 25;
      break;
    case "Orc":
      ataque = random.nextInt(5) + 10;
      defesa = random.nextInt(5) + 3;
      vida = random.nextInt(10) + 20;
      break;
    case "Dragao":
      ataque = random.nextInt(10) + 20;
      defesa = random.nextInt(5) + 10;
      vida = random.nextInt(20) + 50;
      break;
    default:
      ataque = 1;
      defesa = 1;
      vida = 1;
      nome = "Mosquito Da Dengue";
  }

  return Monstro(nome, ataque, defesa, vida);
}
