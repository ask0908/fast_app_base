abstract interface class Food<T extends Flavor> {
  T createFlavor();
}

class Chocolate extends Food {
  @override
  Flavor createFlavor() {
    return Sweet();
  }
}

class LemonCandy extends Food {
  @override
  Flavor createFlavor() {
    return Sour();
  }
}

class SpicyRamen extends Food {
  @override
  Flavor createFlavor() {
    return Spicy();
  }
}

abstract class Flavor {
  String get taste;
}

class Sour extends Flavor {
  @override
  String get taste => 'Sour';
}

class Sweet extends Flavor {
  @override
  String get taste => 'Sweet';
}

class Spicy extends Flavor {
  @override
  String get taste => 'Spicy';
}

abstract interface class FoodFactory<T extends Food> {
  T createFood();
}

class ChocolateFactory extends FoodFactory<Chocolate> {
  @override
  Chocolate createFood() {
    return Chocolate();
  }
}

FoodFactory getFactory() => ChocolateFactory();

main() {
  final FoodFactory foodFactory = getFactory();
  final Food food = foodFactory.createFood();
  print(food.createFlavor().taste); // Sweet
}