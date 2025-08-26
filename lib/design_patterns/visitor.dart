abstract class ReportElement {
  void accept(ReportVisitor visitor);
}

class SalesReport implements ReportElement {
  @override
  void accept(ReportVisitor visitor) => visitor.visitSales(this);
}

class CustomerReport implements ReportElement {
  @override
  void accept(ReportVisitor visitor) => visitor.visitCustomer(this);
}

abstract class ReportVisitor {
  void visitSales(SalesReport report);
  void visitCustomer(CustomerReport report);
}

class JsonExporter implements ReportVisitor {
  @override
  void visitSales(SalesReport report) {
    print('Exportando relatório de vendas para JSON...');
  }
  @override
  void visitCustomer(CustomerReport report) {
    print('Exportando relatório de clientes para JSON...');
  }
}

void main(){
  final salesReport = SalesReport();
  final jsonExporter = JsonExporter();
  salesReport.accept(jsonExporter);
}
