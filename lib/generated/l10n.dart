// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Адрес компании:`
  String get adress {
    return Intl.message(
      'Адрес компании:',
      name: 'adress',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © 2020 Template by DSK BINOKOR`
  String get certificat {
    return Intl.message(
      'Copyright © 2020 Template by DSK BINOKOR',
      name: 'certificat',
      desc: '',
      args: [],
    );
  }

  /// `Каталоги`
  String get catalog {
    return Intl.message(
      'Каталоги',
      name: 'catalog',
      desc: '',
      args: [],
    );
  }

  /// `Форма заказа`
  String get form_order {
    return Intl.message(
      'Форма заказа',
      name: 'form_order',
      desc: '',
      args: [],
    );
  }

  /// `Марка изделия:`
  String get mark_make {
    return Intl.message(
      'Марка изделия:',
      name: 'mark_make',
      desc: '',
      args: [],
    );
  }

  /// `Длина`
  String get lenght {
    return Intl.message(
      'Длина',
      name: 'lenght',
      desc: '',
      args: [],
    );
  }

  /// `Поля не заполнено!`
  String get field_validate {
    return Intl.message(
      'Поля не заполнено!',
      name: 'field_validate',
      desc: '',
      args: [],
    );
  }

  /// `Ширина`
  String get widht {
    return Intl.message(
      'Ширина',
      name: 'widht',
      desc: '',
      args: [],
    );
  }

  /// `Высота`
  String get height {
    return Intl.message(
      'Высота',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Кол-во`
  String get quantity {
    return Intl.message(
      'Кол-во',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `В Корзину`
  String get to_shopbox {
    return Intl.message(
      'В Корзину',
      name: 'to_shopbox',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get description {
    return Intl.message(
      'Описание',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Характеристики`
  String get characteristic {
    return Intl.message(
      'Характеристики',
      name: 'characteristic',
      desc: '',
      args: [],
    );
  }

  /// `Объем`
  String get volume {
    return Intl.message(
      'Объем',
      name: 'volume',
      desc: '',
      args: [],
    );
  }

  /// `Масса`
  String get mass {
    return Intl.message(
      'Масса',
      name: 'mass',
      desc: '',
      args: [],
    );
  }

  /// `Класс бетона`
  String get klass_concrate {
    return Intl.message(
      'Класс бетона',
      name: 'klass_concrate',
      desc: '',
      args: [],
    );
  }

  /// `Адрес компании:`
  String get adress_company {
    return Intl.message(
      'Адрес компании:',
      name: 'adress_company',
      desc: '',
      args: [],
    );
  }

  /// `Телефон`
  String get telephone {
    return Intl.message(
      'Телефон',
      name: 'telephone',
      desc: '',
      args: [],
    );
  }

  /// `Телеграм`
  String get telegram {
    return Intl.message(
      'Телеграм',
      name: 'telegram',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Социальные сети`
  String get socset {
    return Intl.message(
      'Социальные сети',
      name: 'socset',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
