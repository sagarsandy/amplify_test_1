enum Gender { male, female, other }

extension GenderX on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'N/A';
    }
  }
}
