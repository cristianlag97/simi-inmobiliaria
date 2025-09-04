part of 'enum.dart';

enum Gender {
  male,
  female,
  other,
}

final genderValues = EnumValues({
  "female": Gender.female,
  "male": Gender.male,
  "other": Gender.other,
});

final genderDisplay = {
  Gender.male: "Masculino",
  Gender.female: "Femenino",
  Gender.other: "Otro",
};
