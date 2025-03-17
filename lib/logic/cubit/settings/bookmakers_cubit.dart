import 'package:betting_app/data/constants/list_of_bookmakers.dart';
import 'package:betting_app/data/models/bookmaker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CountryOptions { eu, us, au }

class BookmakersState extends Equatable {
  final CountryOptions country;
  final List<Bookmaker> bookmakersList;
  final Map<CountryOptions, Bookmaker> selectedBookmaker;

  const BookmakersState(
      {required this.country,
      required this.bookmakersList,
      required this.selectedBookmaker});

  BookmakersState copyWith({
    List<Bookmaker>? bookmakersList,
    Map<CountryOptions, Bookmaker>? selectedBookmaker,
    CountryOptions? country,
  }) {
    return BookmakersState(
      bookmakersList: bookmakersList ?? this.bookmakersList,
      country: country ?? this.country,
      selectedBookmaker: selectedBookmaker ?? this.selectedBookmaker,
    );
  }

  @override
  List<Object?> get props => [country, bookmakersList, selectedBookmaker];
}

class BookmakersCubit extends Cubit<BookmakersState> {
  BookmakersCubit()
      : super(BookmakersState(
          country: CountryOptions.eu,
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

  void setBookmakersList(List<Bookmaker> newBookmakersList) {
    emit(state.copyWith(bookmakersList: newBookmakersList));
  }

  void setBookmaker(Bookmaker bookmaker, CountryOptions country) {
    final entries = state.selectedBookmaker.entries.toList();
    entries.add(MapEntry(country, bookmaker));
    final Map<CountryOptions, Bookmaker> bookmakerMap =
        Map.fromEntries(entries);
    emit(state.copyWith(selectedBookmaker: bookmakerMap));
  }
}
