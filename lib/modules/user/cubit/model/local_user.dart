class LocalUser {
  //User ID
  final String uid;
  //User's information
  final String name;
  final String email;
  final String nickname;
  final String? photoURL;
  final String? createdAt;
  final String? lastLogin;
  final String provider;
  final bool isFirstLogin;
  final String? dateOfBirth;
  final String? phoneNumber;
  final Map<String, String>? adress;
  //Bet & Balance
  final double balance;
  final int betsCount;
  final int winningBets;
  final int losingBets;
  //Preferencies
  final Map<String, String>? preferredSports;
  final String? currency;

  LocalUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.nickname,
    required this.balance,
    required this.betsCount,
    required this.winningBets,
    required this.losingBets,
    required this.provider,
    required this.isFirstLogin,
    this.photoURL,
    this.adress,
    this.preferredSports,
    this.currency,
    this.lastLogin,
    this.createdAt,
    this.dateOfBirth,
    this.phoneNumber,
  });

  factory LocalUser.fromMap(Map<String, dynamic> data) {
    return LocalUser(
        uid: data['uid'],
        name: data['name'],
        email: data['email'],
        nickname: data['nickname'],
        balance: data['balance'],
        betsCount: data['betsCount'],
        winningBets: data['winningBets'],
        losingBets: data['losingBets'],
        provider: data['provider'],
        isFirstLogin: data['isFirstLogin']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'nickname': nickname,
      'balance': balance,
      'betsCount': betsCount,
      'winningBets': winningBets,
      'losingBets': losingBets,
      'provider': provider,
      'isFirstLogin': isFirstLogin
    };
  }
}
