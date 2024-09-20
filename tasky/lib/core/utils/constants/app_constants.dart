class AppConstants {
  AppConstants._();

  static List<String> experienceLevelsDisplay = [
    'Fresh',
    'Junior',
    'Mid level',
    'Senior',
  ];

  static Map<String, String> experienceLevelMapping = {
    'Junior': 'junior',
    'Mid level': 'midLevel',
    'Senior': 'senior',
    'Fresh': 'fresh',
  };
}

enum Status { waiting, finished, inProgress }

enum Priority { low, high, medium }
