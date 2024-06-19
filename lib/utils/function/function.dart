String dateTimeDiff(DateTime dateTime) {
  final duration = DateTime.now().difference(dateTime);
  if (duration.inDays > 1) {
    return '${duration.inDays} days ago';
  } else if (duration.inHours > 1) {
    return '${duration.inHours} hours ago';
  } else if (duration.inMinutes > 1) {
    return '${duration.inMinutes} minutes ago';
  } else {
    return 'just now';
  }
}
