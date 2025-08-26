class CreditCardProcessor {
  void processPayment(double amount) => print('Processing payment by card...');
}

class BoletoGenerator {
  void generateBoleto(double amount) => print('Generating boleto...');
}

class PixHandler {
  void createQrCode(double amount) => print('Creating QR code Pix...');
}

class PaymentFacade {
  final CreditCardProcessor _cardProcessor = CreditCardProcessor();
  final BoletoGenerator _boletoGenerator = BoletoGenerator();
  final PixHandler _pixHandler = PixHandler();

  void payWithCreditCard(double amount) {
    _cardProcessor.processPayment(amount);
  }

  void payWithBoleto(double amount) {
    _boletoGenerator.generateBoleto(amount);
  }

  void payWithPix(double amount) {
    _pixHandler.createQrCode(amount);
  }
}

void main(){
  final payment = PaymentFacade();
  payment.payWithCreditCard(100.0);
}