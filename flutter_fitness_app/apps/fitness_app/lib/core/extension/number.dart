// extension [DoubleHelper] number on double 
extension DoubleHelper on double {
  double toDoubleValue(

    /// ratio convert
    double ratioConvert,
  ) {
    var result = this;

    /// convert result
    result = result * ratioConvert;

    return result;
  }
}
