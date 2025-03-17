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
    this.photoURL,
    this.createdAt,
    this.lastLogin,
    required this.provider,
    required this.isFirstLogin,
    this.dateOfBirth,
    this.phoneNumber,
    this.adress,
    required this.balance,
    required this.betsCount,
    required this.winningBets,
    required this.losingBets,
    this.preferredSports,
    this.currency,
  });

  factory LocalUser.fromDatabase(Map<String, dynamic> data) {
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

  LocalUser copyWith({
    String? uid,
    String? name,
    String? email,
    String? nickname,
    String? photoURL,
    String? createdAt,
    String? lastLogin,
    String? provider,
    bool? isFirstLogin,
    String? dateOfBirth,
    String? phoneNumber,
    Map<String, String>? adress,
    double? balance,
    int? betsCount,
    int? winningBets,
    int? losingBets,
    Map<String, String>? preferredSports,
    String? currency,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      photoURL: photoURL ?? this.photoURL,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
      provider: provider ?? this.provider,
      isFirstLogin: isFirstLogin ?? this.isFirstLogin,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      adress: adress ?? this.adress,
      balance: balance ?? this.balance,
      betsCount: betsCount ?? this.betsCount,
      winningBets: winningBets ?? this.winningBets,
      losingBets: losingBets ?? this.losingBets,
      preferredSports: preferredSports ?? this.preferredSports,
      currency: currency ?? this.currency,
    );
  }
}
