import 'package:intl/intl.dart';

class DateTimeServices {
  ///**It Gives output as:**
  ///- 4hrs 6min
  ///- 1hr 2min
  ///- 19 min
  static String durationInHoursAndMinutes({
    required DateTime? startTime,
    required DateTime? endTime,
  }) {
    if (startTime != null && endTime != null) {
      Duration taskDuration = endTime.difference(startTime);
      if (taskDuration.isNegative) return '-';

      int totalMinutes = taskDuration.inMinutes;

      int hours = totalMinutes ~/ 60;
      int remainingMinutes = totalMinutes % 60;

      List<String> durationParts = [];
      if (hours > 0) {
        durationParts.add(hours == 1 ? "${hours}hr" : "${hours}hrs");
      }
      if (remainingMinutes > 0) durationParts.add("${remainingMinutes}min");

      return durationParts.isEmpty ? '-' : durationParts.join(' ');
    } else {
      return '-';
    }
  }

  ///**It Gives output as:**
  /// - 10 d
  /// - 3 hrs
  /// - 15 mins

  static String durationPast({required DateTime? startTime}) {
    if (startTime != null) {
      Duration taskDuration = DateTime.now().difference(startTime);
      if (taskDuration.isNegative) return '-';

      int totalDays = taskDuration.inDays;
      int totalHours = taskDuration.inHours % 24; // Remaining hours after days
      int totalMinutes =
          taskDuration.inMinutes % 60; // Remaining minutes after hours

      List<String> durationParts = [];

      if (totalDays >= 30) {
        int months = totalDays ~/ 30;
        durationParts.add(months == 1 ? "$months m" : "$months m");
        return durationParts.join(' ');
      } else if (totalDays >= 7) {
        int weeks = totalDays ~/ 7;
        durationParts.add(weeks == 1 ? "$weeks w" : "$weeks w");
        return durationParts.join(' ');
      } else if (totalDays > 0) {
        durationParts.add(totalDays == 1 ? "$totalDays d" : "$totalDays d");
        return durationParts.join(' ');
      } else if (totalHours > 0) {
        durationParts.add(
          totalHours == 1 ? "$totalHours hr" : "$totalHours hrs",
        );
        return durationParts.join(' ');
      } else if (totalMinutes > 0) {
        durationParts.add("$totalMinutes min");
        return durationParts.join(' ');
      }

      return '-';
    } else {
      return '-';
    }
  }

  ///**It Gives output as:**
  /// - 10 days ago
  /// - 3 hrs ago
  /// - 6 mins ago

  static String durationPast1({required DateTime? startTime}) {
    if (startTime != null) {
      Duration taskDuration = DateTime.now().difference(startTime);
      if (taskDuration.isNegative) return '-';

      int totalDays = taskDuration.inDays;
      int totalHours = taskDuration.inHours % 24; // Remaining hours after days
      int totalMinutes =
          taskDuration.inMinutes % 60; // Remaining minutes after hours

      List<String> durationParts = [];

      if (totalDays >= 30) {
        int months = totalDays ~/ 30;
        durationParts.add(
          months == 1 ? "$months month ago" : "$months months ago",
        );
        return durationParts.join(' ');
      } else if (totalDays >= 7) {
        int weeks = totalDays ~/ 7;
        durationParts.add(weeks == 1 ? "$weeks week ago" : "$weeks weeks ago");
        return durationParts.join(' ');
      } else if (totalDays > 0) {
        durationParts.add(
          totalDays == 1 ? "$totalDays day ago" : "$totalDays days ago",
        );
        return durationParts.join(' ');
      } else if (totalHours > 0) {
        durationParts.add(
          totalHours == 1 ? "$totalHours hr ago" : "$totalHours hrs ago",
        );
        return durationParts.join(' ');
      } else if (totalMinutes > 0) {
        durationParts.add(
          totalMinutes == 1
              ? "$totalMinutes min ago"
              : "$totalMinutes mins ago",
        );
        return durationParts.join(' ');
      }

      return '-';
    } else {
      return '-';
    }
  }

  ///### It Gives output as:
  ///- Feb 6, 2024 12:23 pm
  static String formatDateTime1(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  ///### It Gives output as:
  ///- 6 Feb 2024 12:23 pm
  ///- 9 Mar 2024 4:55 pm
  static String formatDateTime2(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('d MMM y  h:mm a').format(dateTime);
  }

  ///### It Gives output as:
  ///- 2024-02-28_13-23-23
  static String formatDateTime3(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('d-MM-y HH:mm').format(dateTime);
  }

  ///### It Gives output as:
  ///It formats Date into readable format
  ///- 6 Feb 2024
  ///- 12 Mar 2024
  static String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('d MMM y').format(dateTime);
  }

  ///### It Gives output as:
  ///It formats Date into readable format
  ///- 16/09
  static String formatDate3(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('dd/MM').format(dateTime);
  }

  ///### It Gives output as:
  ///It formats Date into readable format
  ///- `Nov, 24`
  static String formatDate4(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('MMM, yy').format(dateTime);
  }

  ///### It Gives output as:
  ///It formats Date into readable format
  ///- 2024-02-28
  static String formatDate1(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('yy-MM-d').format(dateTime);
  }

  static String formatDate2(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('MMMM-y').format(dateTime);
  }

  ///### It Gives output as:
  ///TTYD stands for Today,Tomorrow,Yesterday and date
  ///- Today
  ///- Tomorrow
  ///- Yesterday
  ///- 6 February 2024
  static String formatTTYD(DateTime? dateTime) {
    if (dateTime == null) return '-';
    final duration = DateTime.now().difference(dateTime);
    return switch (duration.inDays) {
      0 => 'Today',
      -1 => 'Tomorrow',
      1 => 'Yesterday',
      _ => DateFormat('d MMMM y').format(dateTime),
    };
  }

  ///### It Gives output as:
  ///TTYDT stands for Today,Tomorrow,Yesterday,Date and Time
  ///- Today 12:23 pm
  ///- Tomorrow 12:23 pm
  ///- Yesterday 12:23 pm
  ///- 6 Feb 2024  12:23 pm
  static String formatTTYDT(DateTime? dateTime) {
    if (dateTime == null) return '-';
    final duration = DateTime.now().difference(dateTime);

    return switch (duration.inDays) {
      0 => 'Today  ${DateFormat('h:mm a').format(dateTime)}',
      -1 => 'Tomorrow  ${DateFormat('h:mm a').format(dateTime)}',
      1 => 'Yesterday  ${DateFormat('h:mm a').format(dateTime)}',
      _ => DateFormat('d MMM y  h:mm a').format(dateTime),
    };
  }

  ///### It Gives output as:
  ///- 1hr 20min
  ///- 7hrs 2min
  ///- 40min
  static String hoursToHoursAndMinutes(double? decimalHours) {
    if (decimalHours == null) return '0min';

    int hours = decimalHours.toInt();
    int minutes = ((decimalHours - hours) * 60).round();

    List<String> time = [];
    if (hours > 0) {
      if (hours == 1) {
        time.add('${hours}hr');
      } else {
        time.add('${hours}hrs');
      }
    }
    time.add('${minutes}min');
    return time.join(' ');
  }

  ///### It Gives output as:
  ///TTYDT stands for Today,Tomorrow,Yesterday,Date and Time
  ///-  12:23 pm
  static String formatTime1(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('h:mm aa').format(dateTime);
  }

  ///### It Gives output as:
  static List<DateTime>? generateIntermediateDateTime({
    required DateTime start,
    required DateTime end,
    required Duration duration,
  }) {
    if (start.isAfter(end)) return null;

    List<DateTime> intermediateDates = [];
    DateTime currentDateTime = start;

    while (currentDateTime.isBefore(end)) {
      intermediateDates.add(currentDateTime);
      currentDateTime = currentDateTime.add(duration);
    }

    return intermediateDates;
  }

  static bool isWithinRange(DateTime? startDateTime, DateTime? endDateTime) {
    DateTime now = DateTime.now();
    bool isStartValid = startDateTime == null || now.isAfter(startDateTime);
    bool isEndValid = endDateTime == null || now.isBefore(endDateTime);
    if (startDateTime == null && endDateTime == null) return false;
    return isStartValid && isEndValid;
  }
}
