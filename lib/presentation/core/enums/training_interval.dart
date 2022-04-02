enum TrainingInterval { never, onceAWeek, twiceAWeek, everyday }

extension TrainingIntervalX on TrainingInterval {
  String get name {
    switch (this) {
      case TrainingInterval.never:
        return 'Never';
      case TrainingInterval.onceAWeek:
        return 'Once a week';
      case TrainingInterval.twiceAWeek:
        return 'Twice a week';
      case TrainingInterval.everyday:
        return 'Everyday';
    }
  }
}
