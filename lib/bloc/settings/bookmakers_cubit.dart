import 'package:betting_app/constants/list_of_bookmakers.dart';
import 'package:betting_app/core/storage/preferences_manager.dart';
import 'package:betting_app/models/bookmaker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CountryOptions { eu, us, au }

enum VisualOptions { alphabetical, custom }

class BookmakersState extends Equatable {
  final CountryOptions country;
  final VisualOptions visual;

  final List<Bookmaker> bookmakersList;
  final Map<CountryOptions, Bookmaker> selectedBookmaker;

  const BookmakersState(
      {required this.country,
      required this.visual,
      required this.bookmakersList,
      required this.selectedBookmaker});

  BookmakersState copyWith({
    List<Bookmaker>? bookmakersList,
    Map<CountryOptions, Bookmaker>? selectedBookmaker,
    CountryOptions? country,
    VisualOptions? visual,
  }) {
    return BookmakersState(
      bookmakersList: bookmakersList ?? this.bookmakersList,
      country: country ?? this.country,
      visual: visual ?? this.visual,
      selectedBookmaker: selectedBookmaker ?? this.selectedBookmaker,
    );
  }

  @override
  List<Object?> get props =>
      [country, visual, bookmakersList, selectedBookmaker];
}

class BookmakersCubit extends Cubit<BookmakersState> {
  BookmakersCubit()
      : super(BookmakersState(
          country: CountryOptions.eu,
          visual: VisualOptions.alphabetical,
          bookmakersList: BookmakerListEurope.euBookmakersList,
          selectedBookmaker: const <CountryOptions, Bookmaker>{},
        ));

  void setCountry(CountryOptions newCountry) {
    if (newCountry == CountryOptions.eu) {
      emit(state.copyWith(
          country: newCountry,
          bookmakersList: BookmakerListEurope.euBookmakersList));
    } else if (newCountry == CountryOptions.us) {
      emit(state.copyWith(
          country: newCountry,
          bookmakersList: BookmakerListUs.usBookmakersList));
    } else if (newCountry == CountryOptions.au) {
      emit(state.copyWith(
          country: newCountry,
          bookmakersList: BookmakersListAu.auBookmakersList));
    }
  }

  void setVisual(VisualOptions newVisual) {
    emit(state.copyWith(
        visual: newVisual,
        bookmakersList: BookmakerListEurope.euBookmakersList));
    //Salva nelle preferenze
    //
  }

  void setBookmakersList(List<Bookmaker> newBookmakersList) {
    emit(state.copyWith(bookmakersList: newBookmakersList));
  }

  void setBookmaker(Bookmaker bookmaker, CountryOptions country) {
    PreferencesManager().savePreferredBookmaker(bookmaker, country.name);
    final entries = state.selectedBookmaker.entries.toList();
    entries.add(MapEntry(country, bookmaker));
    final Map<CountryOptions, Bookmaker> bookmakerMap =
        Map.fromEntries(entries);
    emit(state.copyWith(selectedBookmaker: bookmakerMap));
  }
}
