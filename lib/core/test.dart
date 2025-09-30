class Animal {
  void makeSound() {
    print("Some generic animal sound");
  }
}class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof! Woof!");
  }
}
class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow! Meow!");
  }
}
void main() {

  List<Animal> animals = [Dog(), Cat(), Animal()];

  for (var animal in animals) {
    animal.makeSound(); 
  }
}
