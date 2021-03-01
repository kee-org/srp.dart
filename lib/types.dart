class Session {
  final String key;
  final String proof;

  Session({required this.key, required this.proof});
}

class Ephemeral {
  final String public;
  final String secret;

  Ephemeral({required this.public, required this.secret});
}
