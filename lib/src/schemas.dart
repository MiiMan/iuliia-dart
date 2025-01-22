enum Schemas {
  alaLc('ala_lc'),
  alaLcAlt('ala_lc_alt'),
  bgnPcgn('bgn_pcgn'),
  bgnPcgnAlt('bgn_pcgn_alt'),
  bs2979('bs_2979'),
  bs2979Alt('bs_2979_alt'),
  gost779('gost_779'),
  gost779Alt('gost_779_alt'),
  gost7034('gost_7034'),
  gost16876('gost_16876'),
  gost16876Alt('gost_16876_alt'),
  gost52290('gost_52290'),
  gost52535('gost_52535'),
  icaoDoc9303('icao_doc_9303'),
  iso9_1954('iso_9_1954'),
  iso9_1968('iso_9_1968'),
  iso9_1968Alt('iso_9_1968_alt'),
  mosmetro('mosmetro'),
  mvd310('mvd_310'),
  mvd310Fr('mvd_310_fr'),
  mvd782('mvd_782'),
  scientific('scientific'),
  telegram('telegram'),
  ungegn1987('ungegn_1987'),
  wikipedia('wikipedia'),
  yandexMaps('yandex_maps'),
  yandexMoney('yandex_money');

  const Schemas(this.rawName);

  final String rawName;
}
