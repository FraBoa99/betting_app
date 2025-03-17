class StringHelpers {
  //Restituisce la prima parola prima di un trattino alto se esiste o una stringa vuota
  String getFirstWordBeforeScore(String string) {
    List<String> words = string.split(' - ');
    return words.isNotEmpty ? words[0] : '';
  }

  //Sostituisce il trattino basso con uno spazio
  String removeUnderscore(String string) {
    return string.replaceAll("_", " ");
  }

  //Maiuscola solo la prima lettera
  String capitalizeEachWord(String string) {
    return string[0].toUpperCase() + string.substring(1);
  }

  //Maiuscola la prima lettera dopo uno spazio
  String capitalizeAfterSpace(String string) {
    return string.split(' ').map((word) {
      return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : word;
    }).join(' ');
  }
}
