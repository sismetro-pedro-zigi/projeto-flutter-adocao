/// Representa um animal disponivel para adocao.
///
/// Esta classe nao sabe nada sobre HTTP, JSON ou de qual API o dado veio.
/// Ela e apenas uma "caixa de dados" (Single Responsibility Principle):
/// sua unica responsabilidade e guardar e expor os dados de um Dog.
/// Quem sabe buscar e converter esse dado e a camada de Service.
class Dog {
  final String id;
  final String name;
  final String imageUrl;

  const Dog({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
