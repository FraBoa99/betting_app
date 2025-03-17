class Questions {
  static List<Map<String, dynamic>> questions = [
    //Nome
    {
      'key': 'name',
      'label': 'Come ti chiami? (inserisci nome e cognome)',
      'hint': '',
      'inputType': 'text',
      'answer': null,
    },
    //Email
    {
      'key': 'email',
      'label': 'Qual è il tuo indirizzo email?',
      'hint': 'esempio@gmail.com',
      'inputType': 'text',
      'answer': null,
    },
    //Nickname
    {
      'key': 'Scegli un nickname! ',
      'label': '',
      'inputType': 'text',
      'answer': null,
    },
    //Data di nascita
    {
      'key': 'birthdate',
      'label': 'Quando sei nato/a?',
      'inputType': 'dataPicker',
      'answer': null,
    },
    //Valuta
    {
      'key': 'valuta',
      'label': 'Quale valuta preferisci usare?',
      'inputType': 'menuValuta',
      'answer': null,
    },
    //Sport preferito
    {
      'key': 'sport',
      'label': 'Scegli il tuo sport preferito e seleziona una lega associata',
      'inputType': 'menuSport',
      'answer': 'null',
    }
  ];

  static const List<Map<String, String>> valutaOptions = [
    {'EUR': 'EURO'},
    {'USD': 'USD - Dollaro USA'},
    {'GBP': 'Sterlina Britannica'},
  ];
}
