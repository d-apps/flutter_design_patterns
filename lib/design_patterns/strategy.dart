abstract class ShippingStrategy {
  double calculate(double distance);
}

class ExpressShipping implements ShippingStrategy {
  @override
  double calculate(double distance) => distance * 0.5 + 10.0;
}

class NormalShipping implements ShippingStrategy {
  @override
  double calculate(double distance) => distance * 0.3;
}

class ShippingContext {
  ShippingStrategy _strategy;

  ShippingContext(this._strategy);

  void setStrategy(ShippingStrategy strategy) {
    _strategy = strategy;
  }

  double calculateCost(double distance) {
    return _strategy.calculate(distance);
  }
}

void main(){
  final context = ShippingContext(NormalShipping());
  print('Frete normal: R\$ ${context.calculateCost(50)}');
  context.setStrategy(ExpressShipping());
  print('Frete expresso: R\$ ${context.calculateCost(50)}');
}