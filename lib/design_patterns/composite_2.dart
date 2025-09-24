abstract class IValidation {
  String? validate(String value);
}

class EmailValidation implements IValidation {
  @override
  String? validate(String value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }
}

class RequiredFieldValidation implements IValidation {
  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}

class ValidatorComposite {
  final List<IValidation> _validations;

  ValidatorComposite({required List<IValidation> validations})
    : _validations = validations;

  String? validate(String value) {
    for (var validation in _validations) {
      final result = validation.validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

void main() {
  final validator1 = ValidatorComposite(
    validations: [RequiredFieldValidation(), EmailValidation()],
  );

  var result1 = validator1.validate('djalma@');
  print(result1);
  result1 = validator1.validate("djalma@djalma.com");
  print(result1);


  var validator2 = ValidatorComposite(
      validations: [RequiredFieldValidation()]
  );

  var result2 = validator2.validate('');
  print(result2);
  result2 = validator2.validate('djalma');
  print(result2);
}
