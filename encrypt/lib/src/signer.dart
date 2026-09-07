part of '../encrypt.dart';

class Signer {
  final SignerAlgorithm algo;

  Signer(this.algo);

  Encrypted sign(String input) => signBytes(convert.utf8.encode(input));

  Encrypted signBytes(List<int> bytes) => algo.sign(.fromList(bytes));

  bool verifyBytes(List<int> bytes, Encrypted signature) =>
      algo.verify(.fromList(bytes), signature);

  bool verify(String input, Encrypted signature) =>
      verifyBytes(convert.utf8.encode(input), signature);

  bool verify16(String input, String signature) =>
      verify(input, .fromBase16(signature));

  bool verify64(String input, String signature) =>
      verify(input, .fromBase64(signature));
}
