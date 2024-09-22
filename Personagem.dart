import 'Monstro.dart';

class Personagem {
  String nome; // Remover 'late' e inicializar no construtor
  String classe;
  int vida;
  int ataque;
  int defesa;
  String item;

  // Construtor da classe
  Personagem(
      this.nome, this.classe, this.vida, this.ataque, this.defesa, this.item);

  void equiparItem(String novoItem) {
    item = novoItem;
  }

  void AtaquePersonagem(Monstro mostro) {
    // Lógica de ataque do monstro
    int dano = (ataque - mostro.defesa);
    dano = dano < 0 ? 0 : dano; // Garante que o dano não seja negativo
    mostro.vida -= dano;
    if (vida < 0) {
      vida = 0; // Garante que a vida não fique negativa
    }
    print('$nome atacou ${mostro.nome}. Dano causado: $dano');
  }

  void levarDano(int dano) {
    vida -= dano;
    if (vida < 0) {
      vida = 0; // Garante que a vida não fique negativa
    }
  }
}
