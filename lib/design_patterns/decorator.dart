abstract class Coffee {
  String getDescription();
  double getPrice();
}

class SimpleCoffee implements Coffee {
  @override
  String getDescription() => 'Simple Coffee';
  @override
  double getPrice() => 5.0;
}

abstract class CoffeeDecorator implements Coffee {
  final Coffee decoratedCoffee;
  CoffeeDecorator(this.decoratedCoffee);
}

class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(super.coffee);

  @override
  String getDescription() => '${decoratedCoffee.getDescription()}, Milk';
  @override
  double getPrice() => decoratedCoffee.getPrice() + 2.0;
}

void main(){
  Coffee myCoffee = SimpleCoffee();
  myCoffee = MilkDecorator(myCoffee);
  print('${myCoffee.getDescription()} - R\$ ${myCoffee.getPrice()}');
}
