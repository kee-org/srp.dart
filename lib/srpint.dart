class SrpInt {
  final BigInt bi;
  final int? stringLength;

  SrpInt(this.bi, this.stringLength);

  static SrpInt parse(String source, {int? radix}) {
    final bi = BigInt.parse(source, radix: radix);
    return SrpInt(bi, source.length);
  }

  modPow(SrpInt exponent, SrpInt modulus) {
    return SrpInt(bi.modPow(exponent.bi, modulus.bi), modulus.stringLength);
  }

  SrpInt operator -() => SrpInt(-bi, stringLength);

  SrpInt operator +(SrpInt other) => SrpInt(this.bi + other.bi, null);

  SrpInt operator -(SrpInt other) => SrpInt(this.bi - other.bi, stringLength);

  SrpInt operator *(SrpInt other) => SrpInt(this.bi * other.bi, null);

  double operator /(SrpInt other) => this.bi / other.bi;

  SrpInt operator ~/(SrpInt other) => SrpInt(this.bi ~/ other.bi, stringLength);

  SrpInt operator %(SrpInt other) =>
      SrpInt(this.bi % other.bi, other.stringLength);

  SrpInt operator ^(SrpInt other) => SrpInt(this.bi ^ other.bi, stringLength);

  String toHex() {
    if (stringLength != null) {
      return bi.toRadixString(16).padLeft(stringLength!, '0');
    }
    throw new Exception('This SrpInt has no specified length');
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SrpInt && o.bi == bi;
  }

  @override
  int get hashCode => bi.hashCode;
}
