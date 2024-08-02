extension ToInt on bool? {
  int? get toInt => (this == null)
      ? null
      : (this == true)
          ? 1
          : 0;
}
