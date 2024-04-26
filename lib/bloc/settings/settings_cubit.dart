import 'package:bloc/bloc.dart';
import '../../storage/storage.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(super.initialState);

  changeLanguage(String lang) async {
    // varsayılan durumu güncelle
    final newState = SettingsState(
      language: lang,
      darkMode: state.darkMode,
    );
     //yeni durumu hafızaya kaydet
    emit(newState);
    
    // yeni dili duruma yaz
    final storage = AppStorage();
    
    await storage.writeAppSettings(
      darkMode: state.darkMode,
      language: lang,
    );
  }

  changeThemeMode(bool darkMode) {
    final newState = SettingsState(
      language: state.language,
      darkMode: darkMode,
    );
    //yeni durumu kaydet
    emit(newState);

    // yeni temayı duruma yaz
    final storage = AppStorage();
    
    storage.writeAppSettings(
      darkMode: darkMode,
      language: state.language,
    );
  }
}