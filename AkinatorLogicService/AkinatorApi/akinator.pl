% Определение динамических предикатов
:- encoding(utf8). 
:- dynamic has_attribute/2.
:- dynamic attribute_translation/2.
% Определим динамический предикат для хранения упорядоченного списка атрибутов
:- dynamic ordered_attributes/1.

% --- Факты has_attribute/2 ---
% Вставьте сюда все факты has_attribute/2 для всех ваших персонажей.
% Убедитесь, что опечатка в имени Зайца ИСПРАВЛЕНА:
% Вместо has_attribute(zayac_nu_pogadi, is_mostly_silent).
% Должно быть: has_attribute(zayac_nu_pogodi, is_mostly_silent).

% Гомер Симпсон
has_attribute(gomer_simpson, animated).
has_attribute(gomer_simpson, male).
has_attribute(gomer_simpson, adult).
has_attribute(gomer_simpson, human).
has_attribute(gomer_simpson, from_the_simpsons).
has_attribute(gomer_simpson, lives_in_springfield).
has_attribute(gomer_simpson, works_at_power_plant).
has_attribute(gomer_simpson, is_a_father).
has_attribute(gomer_simpson, is_married_to_marge).
has_attribute(gomer_simpson, is_overweight).
has_attribute(gomer_simpson, loves_donuts).
has_attribute(gomer_simpson, says_doh).
has_attribute(gomer_simpson, appears_in_sitcom).
has_attribute(gomer_simpson, is_balding).

% Спанч Боб Квадратные Штаны
has_attribute(sponch_bob, animated).
has_attribute(sponch_bob, male).
has_attribute(sponch_bob, adult).
has_attribute(sponch_bob, non_human).
has_attribute(sponch_bob, is_a_sponge).
has_attribute(sponch_bob, lives_under_sea).
has_attribute(sponch_bob, lives_in_bikini_bottom).

% Багз Банни
has_attribute(bagz_banni, animated).
has_attribute(bagz_banni, male).
has_attribute(bagz_banni, non_human).
has_attribute(bagz_banni, is_a_rabbit).
has_attribute(bagz_banni, from_looney_tunes).
has_attribute(bagz_banni, outsmarts_enemies).
has_attribute(bagz_banni, eats_carrots).
has_attribute(bagz_banni, says_whats_up_doc).
has_attribute(bagz_banni, is_a_trickster).
has_attribute(bagz_banni, is_grey_and_white).

% Микки Маус
has_attribute(mikki_maus, animated).
has_attribute(mikki_maus, male).
has_attribute(sponch_bob, adult).
has_attribute(mikki_maus, non_human).
has_attribute(mikki_maus, is_a_mouse).
has_attribute(mikki_maus, is_an_early_disney_character).
has_attribute(mikki_maus, wears_red_shorts).
has_attribute(mikki_maus, wears_white_gloves).
has_attribute(mikki_maus, has_a_girlfriend_named_minnie).
has_attribute(mikki_maus, is_a_global_icon).



% Даффи Дак
has_attribute(daffi_dak, animated).
has_attribute(daffi_dak, male).
has_attribute(daffi_dak, non_human).
has_attribute(daffi_dak, is_a_duck).
has_attribute(daffi_dak, from_looney_tunes).
has_attribute(daffi_dak, is_greedy_or_selfish).
has_attribute(daffi_dak, has_a_lisp).
has_attribute(daffi_dak, is_black).
has_attribute(daffi_dak, wears_a_bow_tie).

% Фред Флинтстоун
has_attribute(fred_flintstoun, animated).
has_attribute(fred_flintstoun, male).
has_attribute(fred_flintstoun, adult).
has_attribute(fred_flintstoun, human).
has_attribute(fred_flintstoun, lives_in_stone_age).
has_attribute(fred_flintstoun, lives_in_bedrock).
has_attribute(fred_flintstoun, from_hanna_barbera).
has_attribute(fred_flintstoun, says_yabba_dabba_doo).
has_attribute(fred_flintstoun, has_a_best_friend_named_barney).
has_attribute(fred_flintstoun, works_at_quarry).
has_attribute(fred_flintstoun, wears_animal_skin_clothing).

% Скуби-Ду
has_attribute(skubi_du, animated).
has_attribute(skubi_du, male).
has_attribute(skubi_du, adult).
has_attribute(skubi_du, non_human).
has_attribute(skubi_du, is_a_dog).
has_attribute(skubi_du, solves_mysteries).
has_attribute(skubi_du, travels_in_a_van_called_mystery_machine).
has_attribute(skubi_du, from_hanna_barbera).
has_attribute(skubi_du, is_cowardly).
has_attribute(skubi_du, loves_scooby_snacks).
has_attribute(skubi_du, speaks_broken_english).
has_attribute(skubi_du, is_brown_and_black).

% Шэгги Роджерс
has_attribute(sheggi_rodzhers, animated).
has_attribute(sheggi_rodzhers, male).
has_attribute(sheggi_rodzhers, adult).
has_attribute(sheggi_rodzhers, human).
has_attribute(sheggi_rodzhers, solves_mysteries).
has_attribute(sheggi_rodzhers, travels_in_a_van_called_mystery_machine).
has_attribute(sheggi_rodzhers, from_hanna_barbera).
has_attribute(sheggi_rodzhers, is_cowardly).
has_attribute(sheggi_rodzhers, loves_food).
has_attribute(sheggi_rodzhers, has_a_dog_as_best_friend_named_scooby).
has_attribute(sheggi_rodzhers, is_thin_and_lanky).
has_attribute(sheggi_rodzhers, wears_a_green_shirt).

% Том
has_attribute(tom, animated).
has_attribute(tom, male).
has_attribute(tom, non_human).
has_attribute(tom, is_a_cat).
has_attribute(tom, from_tom_and_jerry).
has_attribute(tom, is_enemy_of_a_mouse_named_jerry).
has_attribute(tom, often_chases_another_character).
has_attribute(tom, is_mostly_silent).
has_attribute(tom, lives_in_a_house).
has_attribute(tom, is_grey_or_blue).

% Джерри
has_attribute(dzherri, animated).
has_attribute(dzherri, male).
has_attribute(dzherri, non_human).
has_attribute(dzherri, is_a_mouse).
has_attribute(dzherri, from_tom_and_jerry).
has_attribute(dzherri, is_enemy_of_a_cat_named_tom).
has_attribute(dzherri, often_outsmarts_a_bigger_character).
has_attribute(dzherri, is_mostly_silent).
has_attribute(dzherri, lives_in_a_house).
has_attribute(dzherri, is_brown).

% Винни-Пух (американский/Дисней)
has_attribute(vinni_puh_disney, animated).
has_attribute(vinni_puh_disney, male).
has_attribute(vinni_puh_disney, non_human).
has_attribute(vinni_puh_disney, is_a_bear).
has_attribute(vinni_puh_disney, wears_a_red_shirt).
has_attribute(vinni_puh_disney, loves_honey).
has_attribute(vinni_puh_disney, lives_in_hundred_acre_wood).
has_attribute(vinni_puh_disney, is_simple_minded).
has_attribute(vinni_puh_disney, from_disney).
has_attribute(vinni_puh_disney, is_yellow).

% Тигруля (американский/Дисней)
has_attribute(tigrulya_disney, animated).
has_attribute(tigrulya_disney, male).
has_attribute(tigrulya_disney, non_human).
has_attribute(tigrulya_disney, is_a_tiger).
has_attribute(tigrulya_disney, loves_to_bounce).
has_attribute(tigrulya_disney, lives_in_hundred_acre_wood).
has_attribute(tigrulya_disney, from_disney).
has_attribute(tigrulya_disney, has_a_tail_for_bouncing).
has_attribute(tigrulya_disney, is_energetic).
has_attribute(tigrulya_disney, is_orange_with_black_stripes).

% Дональд Дак
has_attribute(donald_dak, animated).
has_attribute(donald_dak, male).
has_attribute(donald_dak, non_human).
has_attribute(donald_dak, is_a_duck).
has_attribute(donald_dak, is_an_early_disney_character).
has_attribute(donald_dak, has_a_temper).
has_attribute(donald_dak, wears_a_sailor_shirt).
has_attribute(donald_dak, has_nephews_named_huey_dewey_louie).
has_attribute(donald_dak, is_often_unlucky).

% Гуфи
has_attribute(gufi, animated).
has_attribute(gufi, male).
has_attribute(gufi, non_human).
has_attribute(gufi, is_a_dog).
has_attribute(gufi, is_an_early_disney_character).
has_attribute(gufi, is_clumsy).
has_attribute(gufi, wears_a_hat).
has_attribute(gufi, says_gawrsh).
has_attribute(gufi, has_a_son_named_max).

% Плуто
has_attribute(pluto, animated).
has_attribute(pluto, male).
has_attribute(pluto, non_human).
has_attribute(pluto, is_a_dog).
has_attribute(pluto, is_an_early_disney_character).
has_attribute(pluto, is_a_pet).
has_attribute(pluto, belongs_to_mickey_mouse).
has_attribute(pluto, does_not_speak_human_language).
has_attribute(pluto, is_orange).

% Скрудж Макдак
has_attribute(skrudzh_makdak, animated).
has_attribute(skrudzh_makdak, male).
has_attribute(skrudzh_makdak, non_human).
has_attribute(skrudzh_makdak, is_a_duck).
has_attribute(skrudzh_makdak, from_disney).
has_attribute(skrudzh_makdak, is_very_rich).
has_attribute(skrudzh_makdak, loves_money).
has_attribute(skrudzh_makdak, swims_in_gold_coins).
has_attribute(skrudzh_makdak, has_nephews_named_huey_dewey_louie).
has_attribute(skrudzh_makdak, wears_a_top_hat_and_spats).
has_attribute(skrudzh_makdak, from_ducktales).

% Зигзаг Маккряк
has_attribute(zigzag_makkryak, animated).
has_attribute(zigzag_makkryak, male).
has_attribute(zigzag_makkryak, non_human).
has_attribute(zigzag_makkryak, is_a_duck).
has_attribute(zigzag_makkryak, from_disney).
has_attribute(zigzag_makkryak, is_a_pilot).
has_attribute(zigzag_makkryak, is_clumsy_pilot).
has_attribute(zigzag_makkryak, works_for_scrooge_mcduck).
has_attribute(zigzag_makkryak, from_ducktales).
has_attribute(zigzag_makkryak, wears_a_flight_helmet).

% Черепашка-ниндзя Леонардо
has_attribute(leonardo_tmnt, animated).
has_attribute(leonardo_tmnt, male).
has_attribute(leonardo_tmnt, non_human).
has_attribute(leonardo_tmnt, is_a_ninja_turtle).
has_attribute(leonardo_tmnt, wears_blue_mask).
has_attribute(leonardo_tmnt, uses_katanas).
has_attribute(leonardo_tmnt, is_the_leader_of_the_team).
has_attribute(leonardo_tmnt, lives_in_sewers).
has_attribute(leonardo_tmnt, eats_pizza).
has_attribute(leonardo_tmnt, is_the_most_disciplined).

% Черепашка-ниндзя Микеланджело
has_attribute(mikelandzhelo_tmnt, animated).
has_attribute(mikelandzhelo_tmnt, male).
has_attribute(mikelandzhelo_tmnt, non_human).
has_attribute(mikelandzhelo_tmnt, is_a_ninja_turtle).
has_attribute(mikelandzhelo_tmnt, wears_orange_mask).
has_attribute(mikelandzhelo_tmnt, uses_nunchucks).
has_attribute(mikelandzhelo_tmnt, is_the_jokester_of_the_team).
has_attribute(mikelandzhelo_tmnt, loves_pizza_very_much).
has_attribute(mikelandzhelo_tmnt, says_cowabunga).
has_attribute(mikelandzhelo_tmnt, uses_surfer_slang).

% Оптимус Прайм
has_attribute(optimus_prime, animated).
has_attribute(optimus_prime, live_action).
has_attribute(optimus_prime, male).
has_attribute(optimus_prime, non_human).
has_attribute(optimus_prime, is_a_robot).
has_attribute(optimus_prime, can_transform).
has_attribute(optimus_prime, transforms_into_a_truck).
has_attribute(optimus_prime, is_a_leader).
has_attribute(optimus_prime, fights_for_good).
has_attribute(optimus_prime, from_transformers).
has_attribute(optimus_prime, is_an_autobot).
has_attribute(optimus_prime, uses_a_blaster).

% Мегатрон
has_attribute(megatron, animated).
has_attribute(megatron, live_action).
has_attribute(megatron, male).
has_attribute(megatron, non_human).
has_attribute(megatron, is_a_robot).
has_attribute(megatron, can_transform).
has_attribute(megatron, is_a_villain).
has_attribute(megatron, is_a_leader).
has_attribute(megatron, fights_for_evil).
has_attribute(megatron, from_transformers).
has_attribute(megatron, is_a_decepticon).
has_attribute(megatron, enemy_of_optimus_prime).
has_attribute(megatron, transforms_into_a_gun).

% Принц Адам/Хи-Мен
has_attribute(hi_men, animated).
has_attribute(hi_men, male).
has_attribute(hi_men, adult).
has_attribute(hi_men, human).
has_attribute(hi_men, has_super_strength).
has_attribute(hi_men, says_i_have_the_power).
has_attribute(hi_men, has_a_secret_identity_as_prince_adam).
has_attribute(hi_men, rides_a_green_tiger_named_battle_cat).
has_attribute(hi_men, uses_a_magic_sword).
has_attribute(hi_men, from_he_man_and_the_masters_of_the_universe).

% Скелетор
has_attribute(skeletor, animated).
has_attribute(skeletor, male).
has_attribute(skeletor, non_human).
has_attribute(skeletor, is_a_villain).
has_attribute(skeletor, has_skull_for_a_face).
has_attribute(skeletor, enemy_of_he_man).
has_attribute(skeletor, seeks_power).
has_attribute(skeletor, uses_magic_staff).
has_attribute(skeletor, lives_on_planet_eternia).
has_attribute(skeletor, from_he_man_and_the_masters_of_the_universe).

% Гарфилд
has_attribute(garfild, animated).
has_attribute(garfild, male).
has_attribute(garfild, non_human).
has_attribute(garfild, is_a_cat).
has_attribute(garfild, is_lazy).
has_attribute(garfild, loves_lasagna).
has_attribute(garfild, hates_mondays).
has_attribute(garfild, has_a_dog_companion_named_odie).
has_attribute(garfild, lives_with_human_owner_named_jon_arbuckle).
has_attribute(garfild, from_garfield).
has_attribute(garfild, from_comic_strip).

% Оди
has_attribute(odi, animated).
has_attribute(odi, male).
has_attribute(odi, non_human).
has_attribute(odi, is_a_dog).
has_attribute(odi, is_simple_minded).
has_attribute(odi, lives_with_garfield).
has_attribute(odi, is_owned_by_jon_arbuckle).
has_attribute(odi, from_garfield).
has_attribute(odi, has_floppy_ears).
has_attribute(odi, has_a_long_tongue).

% Джон Арбакл
has_attribute(dzhon_arbakl, animated).
has_attribute(dzhon_arbakl, male).
has_attribute(dzhon_arbakl, adult).
has_attribute(dzhon_arbakl, human).
has_attribute(dzhon_arbakl, owns_a_cat_named_garfield).
has_attribute(dzhon_arbakl, owns_a_dog_named_odie).
has_attribute(dzhon_arbakl, is_awkward).
has_attribute(dzhon_arbakl, from_garfield).
has_attribute(dzhon_arbakl, is_a_cartoonist).
has_attribute(dzhon_arbakl, wears_glasses).

% Вуди Вудпекер
has_attribute(vudi_vudpeker, animated).
has_attribute(vudi_vudpeker, male).
has_attribute(vudi_vudpeker, non_human).
has_attribute(vudi_vudpeker, is_a_bird).
has_attribute(vudi_vudpeker, is_a_woodpecker).
has_attribute(vudi_vudpeker, has_a_distinctive_laugh).
has_attribute(vudi_vudpeker, is_a_trickster).
has_attribute(vudi_vudpeker, wears_gloves).
has_attribute(vudi_vudpeker, has_red_crest).

% Моряк Попай
has_attribute(moryak_popay, animated).
has_attribute(moryak_popay, male).
has_attribute(moryak_popay, adult).
has_attribute(moryak_popay, human).
has_attribute(moryak_popay, is_a_sailor).
has_attribute(moryak_popay, gains_strength_from_eating_spinach).
has_attribute(moryak_popay, has_big_forearms).
has_attribute(moryak_popay, has_one_eye_closed_or_squinting).
has_attribute(moryak_popay, has_a_girlfriend_named_olive_oyl).
has_attribute(moryak_popay, smokes_a_pipe).

% Олив Ойл
has_attribute(oliv_oyl, animated).
has_attribute(oliv_oyl, female).
has_attribute(oliv_oyl, adult).
has_attribute(oliv_oyl, human).
has_attribute(oliv_oyl, is_very_thin).
has_attribute(oliv_oyl, wears_red_dress).
has_attribute(oliv_oyl, is_the_girlfriend_of_popeye).
has_attribute(oliv_oyl, is_often_in_distress).

% Блакто
has_attribute(blakto, animated).
has_attribute(blakto, male).
has_attribute(blakto, non_human).
has_attribute(blakto, is_enemy_of_popeye).
has_attribute(blakto, is_physically_strong).
has_attribute(blakto, wears_a_cap).
has_attribute(blakto, has_a_beard).
has_attribute(blakto, is_a_bully).

% Розовая Пантера
has_attribute(rozovaya_pantera, animated).
has_attribute(rozovaya_pantera, male).
has_attribute(rozovaya_pantera, non_human).
has_attribute(rozovaya_pantera, is_a_panther).
has_attribute(rozovaya_pantera, is_pink).
has_attribute(rozovaya_pantera, is_mostly_silent).
has_attribute(rozovaya_pantera, accompanied_by_jazzy_music).

% Инспектор Клузо
has_attribute(inspektor_kluzo, live_action).
has_attribute(inspektor_kluzo, male).
has_attribute(inspektor_kluzo, adult).
has_attribute(inspektor_kluzo, human).
has_attribute(inspektor_kluzo, is_a_detective).
has_attribute(inspektor_kluzo, is_incompetent_detective).
has_attribute(inspektor_kluzo, from_the_pink_panther_films).
has_attribute(inspektor_kluzo, causes_chaos).
has_attribute(inspektor_kluzo, speaks_with_a_french_accent).

% Артур
has_attribute(artur, animated).
has_attribute(artur, male).
has_attribute(artur, child).
has_attribute(artur, non_human).
has_attribute(artur, is_an_aardvark).
has_attribute(artur, wears_glasses).
has_attribute(artur, goes_to_school).
has_attribute(artur, from_arthur).
has_attribute(artur, has_a_younger_sister_named_dw).

% Даша-путешественница
has_attribute(dasha_puteshestvennica, animated).
has_attribute(dasha_puteshestvennica, female).
has_attribute(dasha_puteshestvennica, child).
has_attribute(dasha_puteshestvennica, human).
has_attribute(dasha_puteshestvennica, is_an_explorer).
has_attribute(dasha_puteshestvennica, asks_questions_to_viewer).
has_attribute(dasha_puteshestvennica, has_a_monkey_friend_named_boots).
has_attribute(dasha_puteshestvennica, speaks_some_spanish).
has_attribute(dasha_puteshestvennica, from_nickelodeon).
has_attribute(dasha_puteshestvennica, carries_a_backpack).

% Башмачок
has_attribute(bashmachok, animated).
has_attribute(bashmachok, male).
has_attribute(bashmachok, non_human).
has_attribute(bashmachok, is_a_monkey).
has_attribute(bashmachok, wears_red_boots).
has_attribute(bashmachok, is_a_companion_to_dora_the_explorer).
has_attribute(bashmachok, from_nickelodeon).
has_attribute(bashmachok, is_purple).

% Диего Маркес
has_attribute(diego_markes, animated).
has_attribute(diego_markes, male).
has_attribute(diego_markes, child).
has_attribute(diego_markes, human).
has_attribute(diego_markes, rescues_animals).
has_attribute(diego_markes, is_cousin_of_dora).
has_attribute(diego_markes, from_go_diego_go).
has_attribute(diego_markes, speaks_spanish).
has_attribute(diego_markes, has_a_jaguar_companion).

% Свинка Пеппа
has_attribute(svinka_peppa, animated).
has_attribute(svinka_peppa, female).
has_attribute(svinka_peppa, child).
has_attribute(svinka_peppa, non_human).
has_attribute(svinka_peppa, is_a_pig).
has_attribute(svinka_peppa, loves_jumping_in_muddy_puddles).
has_attribute(svinka_peppa, has_a_younger_brother_named_george).
has_attribute(svinka_peppa, from_peppa_pig).
has_attribute(svinka_peppa, has_british_accent).

% Джордж Пиг
has_attribute(dzhordzh_pig, animated).
has_attribute(dzhordzh_pig, male).
has_attribute(dzhordzh_pig, child).
has_attribute(dzhordzh_pig, non_human).
has_attribute(dzhordzh_pig, is_a_pig).
has_attribute(dzhordzh_pig, loves_dinosaurs).
has_attribute(dzhordzh_pig, is_younger_brother_of_peppa).
has_attribute(dzhordzh_pig, from_peppa_pig).
has_attribute(dzhordzh_pig, says_dinosaur).

% Маша
has_attribute(masha, animated).
has_attribute(masha, female).
has_attribute(masha, child).
has_attribute(masha, human).
has_attribute(masha, from_russia).
has_attribute(masha, is_very_active_or_mischievous).
has_attribute(masha, lives_near_a_forest).
has_attribute(masha, has_a_bear_friend_named_medved).
has_attribute(masha, from_masha_and_the_bear).

% Медведь
has_attribute(medved_masha, animated).
has_attribute(medved_masha, male).
has_attribute(medved_masha, non_human).
has_attribute(medved_masha, is_a_bear).
has_attribute(medved_masha, from_russia).
has_attribute(medved_masha, lives_in_a_forest_house).
has_attribute(medved_masha, is_retired_circus_performer).
has_attribute(medved_masha, takes_care_of_a_girl_named_masha).
has_attribute(medved_masha, from_masha_and_the_bear).
has_attribute(medved_masha, does_not_speak_human_language_much).

% Ёжик в Тумане
has_attribute(yozhik_v_tumane, animated).
has_attribute(yozhik_v_tumane, male).
has_attribute(yozhik_v_tumane, non_human).
has_attribute(yozhik_v_tumane, is_a_hedgehog).
has_attribute(yozhik_v_tumane, from_ussr).
has_attribute(yozhik_v_tumane, gets_lost_in_fog).
has_attribute(yozhik_v_tumane, searches_for_a_bear).
has_attribute(yozhik_v_tumane, carries_a_bundle).
has_attribute(yozhik_v_tumane, from_philosophical_cartoon).

% Кот Леопольд
has_attribute(kot_leopold, animated).
has_attribute(kot_leopold, male).
has_attribute(kot_leopold, non_human).
has_attribute(kot_leopold, is_a_cat).
has_attribute(kot_leopold, from_ussr).
has_attribute(kot_leopold, is_very_kind).
has_attribute(kot_leopold, has_mouse_enemies).
has_attribute(kot_leopold, says_guys_lets_live_together_friendly).
has_attribute(kot_leopold, wears_a_bow_tie).

% Винни-Пух (советский)
has_attribute(vinni_puh_soviet, animated).
has_attribute(vinni_puh_soviet, male).
has_attribute(vinni_puh_soviet, non_human).
has_attribute(vinni_puh_soviet, is_a_bear).
has_attribute(vinni_puh_soviet, from_ussr).
has_attribute(vinni_puh_soviet, loves_honey).
has_attribute(vinni_puh_soviet, is_naive).
has_attribute(vinni_puh_soviet, sings_songs).
has_attribute(vinni_puh_soviet, has_a_small_pig_friend_named_pyatachok).

% Пятачок (советский)
has_attribute(pyatachok_soviet, animated).
has_attribute(pyatachok_soviet, male).
has_attribute(pyatachok_soviet, child).
has_attribute(pyatachok_soviet, non_human).
has_attribute(pyatachok_soviet, is_a_pig).
has_attribute(pyatachok_soviet, from_ussr).
has_attribute(pyatachok_soviet, is_cowardly).
has_attribute(pyatachok_soviet, is_friend_of_vinni_puh_soviet).
has_attribute(pyatachok_soviet, is_small).

% Карлсон
has_attribute(karlson, animated).
has_attribute(karlson, male).
has_attribute(karlson, non_human).
has_attribute(karlson, from_ussr).
has_attribute(karlson, lives_on_the_roof).
has_attribute(karlson, has_a_propeller_on_his_back).
has_attribute(karlson, is_selfish_or_boastful).
has_attribute(karlson, loves_jam_and_sweets).
has_attribute(karlson, is_friend_of_a_boy_named_malysh).

% Малыш
has_attribute(malysh, animated).
has_attribute(malysh, male).
has_attribute(malysh, child).
has_attribute(malysh, human).
has_attribute(malysh, from_ussr).
has_attribute(malysh, wishes_for_a_dog).
has_attribute(malysh, lives_with_parents).
has_attribute(malysh, is_friend_of_karlson).

% Дядя Федор
has_attribute(dyadya_fedor, animated).
has_attribute(dyadya_fedor, male).
has_attribute(dyadya_fedor, child).
has_attribute(dyadya_fedor, human).
has_attribute(dyadya_fedor, from_ussr).
has_attribute(dyadya_fedor, runs_away_from_home).
has_attribute(dyadya_fedor, lives_in_a_village).
has_attribute(dyadya_fedor, has_talking_pets).
has_attribute(dyadya_fedor, from_prostokvashino).

% Кот Матроскин
has_attribute(kot_matroskin, animated).
has_attribute(kot_matroskin, male).
has_attribute(kot_matroskin, non_human).
has_attribute(kot_matroskin, is_a_cat).
has_attribute(kot_matroskin, from_ussr).
has_attribute(kot_matroskin, lives_in_a_village).
has_attribute(kot_matroskin, is_economical_or_practical).
has_attribute(kot_matroskin, owns_a_cow).
has_attribute(kot_matroskin, from_prostokvashino).
has_attribute(kot_matroskin, wears_a_vest).
has_attribute(kot_matroskin, has_a_moustache).

% Пес Шарик
has_attribute(pes_sharik, animated).
has_attribute(pes_sharik, male).
has_attribute(pes_sharik, non_human).
has_attribute(pes_sharik, is_a_dog).
has_attribute(pes_sharik, from_ussr).
has_attribute(pes_sharik, lives_in_a_village).
has_attribute(pes_sharik, is_simple_minded).
has_attribute(pes_sharik, loves_hunting).
has_attribute(pes_sharik, uses_a_photo_gun).
has_attribute(pes_sharik, from_prostokvashino).

% Волк (Ну, погоди!)
has_attribute(volk_nu_pogodi, animated).
has_attribute(volk_nu_pogodi, male).
has_attribute(volk_nu_pogodi, non_human).
has_attribute(volk_nu_pogodi, is_a_wolf).
has_attribute(volk_nu_pogodi, from_ussr).
has_attribute(volk_nu_pogodi, chases_a_rabbit_named_zayac).
has_attribute(volk_nu_pogodi, is_a_hooligan).
has_attribute(volk_nu_pogodi, says_nu_pogodi).
has_attribute(volk_nu_pogodi, is_mostly_silent).
has_attribute(volk_nu_pogodi, wears_a_shirt_and_pants).

% Заяц (Ну, погоди!)
has_attribute(zayac_nu_pogodi, animated). 
has_attribute(zayac_nu_pogodi, male).
has_attribute(zayac_nu_pogodi, non_human).
has_attribute(zayac_nu_pogodi, is_a_rabbit).
has_attribute(zayac_nu_pogodi, from_ussr).
has_attribute(zayac_nu_pogodi, is_chased_by_a_wolf_named_volk).
has_attribute(zayac_nu_pogodi, is_resourceful).
has_attribute(zayac_nu_pogodi, is_mostly_silent).
has_attribute(zayac_nu_pogodi, wears_pants_or_shorts).

% Чебурашка
has_attribute(cheburashka, animated).
has_attribute(cheburashka, non_human).
has_attribute(cheburashka, from_ussr).
has_attribute(cheburashka, has_big_ears).
has_attribute(cheburashka, is_friend_of_a_crocodile_named_gena).
has_attribute(cheburashka, works_at_a_zoo_at_first).
has_attribute(cheburashka, falls_out_of_orange_box).
has_attribute(cheburashka, is_brown).

% Крокодил Гена
has_attribute(krokodil_gena, animated).
has_attribute(krokodil_gena, male).
has_attribute(krokodil_gena, non_human).
has_attribute(krokodil_gena, is_a_crocodile).
has_attribute(krokodil_gena, from_ussr).
has_attribute(krokodil_gena, is_friend_of_cheburashka).
has_attribute(krokodil_gena, works_at_a_zoo).
has_attribute(krokodil_gena, plays_accordion).
has_attribute(krokodil_gena, is_lonely).
has_attribute(krokodil_gena, wears_a_suit).

% Старуха Шапокляк
has_attribute(staruha_shapoklyak, animated).
has_attribute(staruha_shapoklyak, female).
has_attribute(staruha_shapoklyak, adult).
has_attribute(staruha_shapoklyak, human).
has_attribute(staruha_shapoklyak, from_ussr).
has_attribute(staruha_shapoklyak, is_a_villain).
has_attribute(staruha_shapoklyak, has_a_pet_rat_named_larska).
has_attribute(staruha_shapoklyak, carries_a_purse).
has_attribute(staruha_shapoklyak, wears_a_large_hat).
has_attribute(staruha_shapoklyak, likes_to_do_mischief).

% Попугай Кеша
has_attribute(popugay_kesha, animated).
has_attribute(popugay_kesha, male).
has_attribute(popugay_kesha, non_human).
has_attribute(popugay_kesha, is_a_parrot).
has_attribute(popugay_kesha, from_russia).
has_attribute(popugay_kesha, runs_away_from_home).
has_attribute(popugay_kesha, imitates_human_speech).
has_attribute(popugay_kesha, is_boastful).
has_attribute(popugay_kesha, lives_in_a_city_apartment).
has_attribute(popugay_kesha, is_blue_and_yellow).

% Домовенок Кузя
has_attribute(domovenok_kuzya, animated).
has_attribute(domovenok_kuzya, male).
has_attribute(domovenok_kuzya, non_human).
has_attribute(domovenok_kuzya, from_ussr).
has_attribute(domovenok_kuzya, is_a_house_spirit).
has_attribute(domovenok_kuzya, lives_in_a_house).
has_attribute(domovenok_kuzya, tells_tales).
has_attribute(domovenok_kuzya, is_naive).
has_attribute(domovenok_kuzya, wears_a_tunic_and_bast_shoes).

% Валли
has_attribute(valli, animated).
has_attribute(valli, male).
has_attribute(valli, non_human).
has_attribute(valli, is_a_robot).
has_attribute(valli, lives_on_earth_alone).
has_attribute(valli, cleans_up_trash).
has_attribute(valli, loves_old_movies).
has_attribute(valli, collects_items).
has_attribute(valli, has_a_pet_cockroach).
has_attribute(valli, from_pixar).
has_attribute(valli, has_tread_wheels).

% Ева
has_attribute(eva, animated).
has_attribute(eva, female).
has_attribute(eva, non_human).
has_attribute(eva, is_a_robot).
has_attribute(eva, comes_from_space).
has_attribute(eva, is_a_probe).
has_attribute(eva, can_fly).
has_attribute(eva, has_a_laser_arm).
has_attribute(eva, looks_sleek_and_white).
has_attribute(eva, from_pixar).
has_attribute(eva, searches_for_plant_life).

% Шрек
has_attribute(shrek, animated).
has_attribute(shrek, male).
has_attribute(shrek, non_human).
has_attribute(shrek, is_an_ogre).
has_attribute(shrek, lives_in_a_swamp).
has_attribute(shrek, is_grumpy_at_first).
has_attribute(shrek, has_a_donkey_friend_named_donkey).
has_attribute(shrek, marries_a_princess_named_fiona).
has_attribute(shrek, from_dreamworks).
has_attribute(shrek, is_green).

% Осёл (Шрек)
has_attribute(osel_shrek, animated).
has_attribute(osel_shrek, male).
has_attribute(osel_shrek, non_human).
has_attribute(osel_shrek, is_a_donkey).
has_attribute(osel_shrek, talks_a_lot).
has_attribute(osel_shrek, is_friend_of_shrek).
has_attribute(osel_shrek, marries_a_dragon).
has_attribute(osel_shrek, from_dreamworks).
has_attribute(osel_shrek, is_brown).

% Фиона (Шрек)
has_attribute(fiona_shrek, animated).
has_attribute(fiona_shrek, female).
has_attribute(fiona_shrek, non_human).
has_attribute(fiona_shrek, is_a_princess).
has_attribute(fiona_shrek, knows_martial_arts).
has_attribute(fiona_shrek, marries_shrek).
has_attribute(fiona_shrek, from_dreamworks).
has_attribute(fiona_shrek, transforms_into_an_ogre).
has_attribute(fiona_shrek, has_a_human_and_ogre_form).

% Алекс (лев из "Мадагаскара")
has_attribute(alex_madagascar, animated).
has_attribute(alex_madagascar, male).
has_attribute(alex_madagascar, non_human).
has_attribute(alex_madagascar, is_a_lion).
has_attribute(alex_madagascar, lives_in_a_zoo_at_first).
has_attribute(alex_madagascar, loves_to_perform).
has_attribute(alex_madagascar, gets_to_madagascar).
has_attribute(alex_madagascar, from_dreamworks).
has_attribute(alex_madagascar, has_a_mane).

% Марти (зебра из "Мадагаскара")
has_attribute(marti_madagascar, animated).
has_attribute(marti_madagascar, male).
has_attribute(marti_madagascar, non_human).
has_attribute(marti_madagascar, is_a_zebra).
has_attribute(marti_madagascar, lives_in_a_zoo_at_first).
has_attribute(marti_madagascar, wants_to_be_wild).
has_attribute(marti_madagascar, from_dreamworks).
has_attribute(marti_madagascar, has_black_and_white_stripes).

% Мелман (жираф из "Мадагаскара")
has_attribute(melman_madagascar, animated).
has_attribute(melman_madagascar, male).
has_attribute(melman_madagascar, non_human).
has_attribute(melman_madagascar, is_a_giraffe).
has_attribute(melman_madagascar, is_a_hypochondriac).
has_attribute(melman_madagascar, has_a_long_neck).
has_attribute(melman_madagascar, from_dreamworks).
has_attribute(melman_madagascar, is_brown_and_yellow).

% Глория (бегемотиха из "Мадагаскара")
has_attribute(gloria_madagascar, animated).
has_attribute(gloria_madagascar, female).
has_attribute(gloria_madagascar, non_human).
has_attribute(gloria_madagascar, is_a_hippo).
has_attribute(gloria_madagascar, lives_in_a_zoo_at_first).
has_attribute(gloria_madagascar, is_confident).
has_attribute(gloria_madagascar, is_large_in_size).
has_attribute(gloria_madagascar, from_dreamworks).
has_attribute(gloria_madagascar, is_grey).

% Король Джулиан XIII (Мадагаскар)
has_attribute(korol_dzhulian, animated).
has_attribute(korol_dzhulian, male).
has_attribute(korol_dzhulian, non_human).
has_attribute(korol_dzhulian, is_a_lemur).
has_attribute(korol_dzhulian, thinks_he_is_important).
has_attribute(korol_dzhulian, loves_to_dance).
has_attribute(korol_dzhulian, from_madagascar).
has_attribute(korol_dzhulian, has_a_servant_named_maurice).
has_attribute(korol_dzhulian, wears_a_leaf_crown).

% Шкипер (пингвин из "Мадагаскара")
has_attribute(shkiper_madagascar, animated).
has_attribute(shkiper_madagascar, male).
has_attribute(shkiper_madagascar, non_human).
has_attribute(shkiper_madagascar, is_a_penguin).
has_attribute(shkiper_madagascar, is_a_leader).
has_attribute(shkiper_madagascar, is_a_strategist).
has_attribute(shkiper_madagascar, from_madagascar).
has_attribute(shkiper_madagascar, is_part_of_a_small_commando_team).
has_attribute(shkiper_madagascar, speaks_in_military_jargon).
has_attribute(shkiper_madagascar, is_black_and_white).

% По (Кунг-фу Панда)
has_attribute(po_kung_fu_panda, animated).
has_attribute(po_kung_fu_panda, male).
has_attribute(po_kung_fu_panda, non_human).
has_attribute(po_kung_fu_panda, is_a_panda).
has_attribute(po_kung_fu_panda, learns_kung_fu).
has_attribute(po_kung_fu_panda, is_the_dragon_warrior).
has_attribute(po_kung_fu_panda, works_in_a_noodle_shop_at_first).
has_attribute(po_kung_fu_panda, is_clumsy_but_powerful).
has_attribute(po_kung_fu_panda, from_dreamworks).
has_attribute(po_kung_fu_panda, is_black_and_white).

% Мастер Шифу (Кунг-фу Панда)
has_attribute(master_shifu, animated).
has_attribute(master_shifu, male).
has_attribute(master_shifu, non_human).
has_attribute(master_shifu, is_a_red_panda).
has_attribute(master_shifu, is_a_kung_fu_master).
has_attribute(master_shifu, trains_po).
has_attribute(master_shifu, lives_in_a_temple).
has_attribute(master_shifu, is_initially_skeptical_of_po).
has_attribute(master_shifu, from_dreamworks).

% Моана Ваялики
has_attribute(moana_vayalik, animated).
has_attribute(moana_vayalik, female).
has_attribute(moana_vayalik, child).
has_attribute(moana_vayalik, human).
has_attribute(moana_vayalik, lives_on_an_island).
has_attribute(moana_vayalik, is_connected_to_the_ocean).
has_attribute(moana_vayalik, goes_on_a_voyage).
has_attribute(moana_vayalik, from_disney).
has_attribute(moana_vayalik, has_a_rooster_pet_named_heihei).
has_attribute(moana_vayalik, does_not_have_a_love_interest).

% Мауи
has_attribute(maui, animated).
has_attribute(maui, male).
has_attribute(maui, non_human).
has_attribute(maui, is_a_demigod).
has_attribute(maui, can_shapeshift).
has_attribute(maui, has_a_magic_fish_hook).
has_attribute(maui, is_boastful).
has_attribute(maui, travels_with_moana).
has_attribute(maui, from_disney).
has_attribute(maui, is_covered_in_magical_tattoos).
has_attribute(maui, lost_his_fish_hook).

% Рапунцель
has_attribute(rapunzel, animated).
has_attribute(rapunzel, female).
has_attribute(rapunzel, adult).
has_attribute(rapunzel, human).
has_attribute(rapunzel, has_very_long_hair).
has_attribute(rapunzel, was_locked_in_a_tower).
has_attribute(rapunzel, uses_a_frying_pan_as_weapon).
has_attribute(rapunzel, from_disney).
has_attribute(rapunzel, has_a_chameleon_friend_named_pascal).
has_attribute(rapunzel, is_a_lost_princess).

% Флинн Райдер (Юджин Фитцерберт)
has_attribute(flinn_rayder, animated).
has_attribute(flinn_rayder, male).
has_attribute(flinn_rayder, adult).
has_attribute(flinn_rayder, human).
has_attribute(flinn_rayder, is_a_thief_at_first).
has_attribute(flinn_rayder, has_a_wanted_poster).
has_attribute(flinn_rayder, travels_with_rapunzel).
has_attribute(flinn_rayder, is_also_known_as_eugene_fitzherbert).
has_attribute(flinn_rayder, from_disney).
has_attribute(flinn_rayder, is_charming_and_sarcastic).
has_attribute(flinn_rayder, falls_in_love_with_a_princess).

% Иккинг Кровожадный Карасик III
has_attribute(ikking, animated).
has_attribute(ikking, male).
has_attribute(ikking, child).
has_attribute(ikking, human).
has_attribute(ikking, is_a_viking).
has_attribute(ikking, befriends_a_dragon_named_toothless).
has_attribute(ikking, lives_on_an_island).
has_attribute(ikking, is_initially_unskilled_viking).
has_attribute(ikking, from_how_to_train_your_dragon).
has_attribute(ikking, has_prosthetic_leg).
has_attribute(ikking, is_inventive).

% Беззубик
has_attribute(bezzubik, animated).
has_attribute(bezzubik, male).
has_attribute(bezzubik, non_human).
has_attribute(bezzubik, is_a_dragon).
has_attribute(bezzubik, is_black_dragon).
has_attribute(bezzubik, is_friend_of_ikking).
has_attribute(bezzubik, is_a_night_fury).
has_attribute(bezzubik, from_how_to_train_your_dragon).
has_attribute(bezzubik, cannot_fly_alone).
has_attribute(bezzubik, is_loyal).

% Мерида
has_attribute(merida, animated).
has_attribute(merida, female).
has_attribute(merida, child).
has_attribute(merida, human).
has_attribute(merida, is_a_princess).
has_attribute(merida, is_skilled_archer).
has_attribute(merida, has_curly_red_hair).
has_attribute(merida, from_pixar).
has_attribute(merida, rides_a_horse_named_angus).
has_attribute(merida, rebels_against_tradition).
has_attribute(merida, uses_a_bow).

% Элли (из "Вверх")
has_attribute(elli_up, animated).
has_attribute(elli_up, female).
has_attribute(elli_up, adult).
has_attribute(elli_up, human).
has_attribute(elli_up, wants_to_be_an_explorer).
has_attribute(elli_up, is_married_to_carl_fredricksen).
has_attribute(elli_up, does_not_appear_for_most_of_movie).
has_attribute(elli_up, from_pixar).

% Карл Фредриксен (из "Вверх")
has_attribute(karl_fredriksen, animated).
has_attribute(karl_fredriksen, male).
has_attribute(karl_fredriksen, elder).
has_attribute(karl_fredriksen, human).
has_attribute(karl_fredriksen, travels_in_a_house_with_balloons).
has_attribute(karl_fredriksen, is_a_widower).
has_attribute(karl_fredriksen, is_grumpy_at_first).
has_attribute(karl_fredriksen, is_a_retired_balloon_salesman).
has_attribute(karl_fredriksen, from_pixar).
has_attribute(karl_fredriksen, wears_glasses).
has_attribute(karl_fredriksen, uses_a_cane).

% Рассел (из "Вверх")
has_attribute(rassel_up, animated).
has_attribute(rassel_up, male).
has_attribute(rassel_up, child).
has_attribute(rassel_up, human).
has_attribute(rassel_up, is_a_wilderness_explorer).
has_attribute(rassel_up, helps_an_elderly_man).
has_attribute(rassel_up, is_chubby).
has_attribute(rassel_up, wears_a_scout_uniform).
has_attribute(rassel_up, from_pixar).
has_attribute(rassel_up, has_a_dog_friend_who_talks_named_dug).

% Молния МакКуин
has_attribute(molniya_makkuin, animated).
has_attribute(molniya_makkuin, male).
has_attribute(molniya_makkuin, non_human).
has_attribute(molniya_makkuin, is_a_car).
has_attribute(molniya_makkuin, is_a_race_car).
has_attribute(molniya_makkuin, is_red).
has_attribute(molniya_makkuin, from_pixar).
has_attribute(molniya_makkuin, lives_in_radiator_springs).
has_attribute(molniya_makkuin, has_a_best_friend_who_is_a_tow_truck_named_mater).

% Мэтр
has_attribute(metr_cars, animated).
has_attribute(metr_cars, male).
has_attribute(metr_cars, non_human).
has_attribute(metr_cars, is_a_car).
has_attribute(metr_cars, is_a_tow_truck).
has_attribute(metr_cars, is_rusty).
has_attribute(metr_cars, is_best_friend_of_lightning_mcqueen).
has_attribute(metr_cars, from_pixar).
has_attribute(metr_cars, lives_in_radiator_springs).
has_attribute(metr_cars, loves_to_go_tractor_tipping).
has_attribute(metr_cars, is_simple_minded).

% Гарри Поттер
has_attribute(garri_potter, live_action).
has_attribute(garri_potter, male).
has_attribute(garri_potter, child).
has_attribute(garri_potter, human).
has_attribute(garri_potter, is_a_wizard).
has_attribute(garri_potter, goes_to_magic_school_hogwarts).
has_attribute(garri_potter, has_a_scar_on_forehead).
has_attribute(garri_potter, wears_glasses).
has_attribute(garri_potter, is_the_main_protagonist).
has_attribute(garri_potter, from_harry_potter).
has_attribute(garri_potter, speaks_to_snakes).
has_attribute(garri_potter, is_known_as_the_boy_who_lived).
has_attribute(garri_potter, has_an_owl_pet_named_hedwig).

% Гермиона Грейнджер
has_attribute(germiona_greyndzher, live_action).
has_attribute(germiona_greyndzher, female).
has_attribute(germiona_greyndzher, child).
has_attribute(germiona_greyndzher, human).
has_attribute(germiona_greyndzher, is_a_wizard).
has_attribute(germiona_greyndzher, goes_to_magic_school_hogwarts).
has_attribute(germiona_greyndzher, is_very_smart).
has_attribute(germiona_greyndzher, is_friend_of_harry_potter).
has_attribute(germiona_greyndzher, from_harry_potter).
has_attribute(germiona_greyndzher, uses_magic_wand).
has_attribute(germiona_greyndzher, is_muggle_born).

% Рон Уизли
has_attribute(ron_uizli, live_action).
has_attribute(ron_uizli, male).
has_attribute(ron_uizli, child).
has_attribute(ron_uizli, human).
has_attribute(ron_uizli, is_a_wizard).
has_attribute(ron_uizli, goes_to_magic_school_hogwarts).
has_attribute(ron_uizli, has_red_hair).
has_attribute(ron_uizli, comes_from_a_large_wizarding_family).
has_attribute(ron_uizli, is_friend_of_harry_potter).
has_attribute(ron_uizli, from_harry_potter).
has_attribute(ron_uizli, is_afraid_of_spiders).
has_attribute(ron_uizli, is_loyal).

% Дарт Вейдер
has_attribute(dart_veyder, live_action).
has_attribute(dart_veyder, male).
has_attribute(dart_veyder, adult).
has_attribute(dart_veyder, human).
has_attribute(dart_veyder, is_a_villain).
has_attribute(dart_veyder, wears_black_armor_and_helmet).
has_attribute(dart_veyder, uses_the_dark_side_of_the_force).
has_attribute(dart_veyder, uses_a_red_lightsaber).
has_attribute(dart_veyder, is_father_of_luk_skaywalker_and_leya_organa).
has_attribute(dart_veyder, from_star_wars).
has_attribute(dart_veyder, breathes_loudly).
has_attribute(dart_veyder, was_a_jedi).

% Люк Скайуокер
has_attribute(luk_skayuyoker, live_action).
has_attribute(luk_skayuyoker, male).
has_attribute(luk_skayuyoker, adult).
has_attribute(luk_skayuyoker, human).
has_attribute(luk_skayuyoker, is_a_jedi).
has_attribute(luk_skayuyoker, uses_the_force).
has_attribute(luk_skayuyoker, uses_a_lightsaber).
has_attribute(luk_skayuyoker, from_star_wars).
has_attribute(luk_skayuyoker, is_a_farm_boy_at_first).
has_attribute(luk_skayuyoker, discovers_he_has_a_twin_sister_leya).
has_attribute(luk_skayuyoker, fights_against_the_empire).
has_attribute(luk_skayuyoker, destroys_death_star).

% Хан Соло
has_attribute(han_solo, live_action).
has_attribute(han_solo, male).
has_attribute(han_solo, adult).
has_attribute(han_solo, human).
has_attribute(han_solo, is_a_smuggler).
has_attribute(han_solo, owns_a_famous_spaceship_millennium_falcon).
has_attribute(han_solo, has_a_wookiee_friend_named_chewbacca).
has_attribute(han_solo, from_star_wars).
has_attribute(han_solo, is_sarcastic).
has_attribute(han_solo, flies_kessel_run_in_less_than_12_parsecs).

% Лея Органа
has_attribute(leya_organa, live_action).
has_attribute(leya_organa, female).
has_attribute(leya_organa, adult).
has_attribute(leya_organa, human).
has_attribute(leya_organa, is_a_princess).
has_attribute(leya_organa, is_a_leader_of_the_rebellion).
has_attribute(leya_organa, has_twin_brother_luk_skywalker).
has_attribute(leya_organa, from_star_wars).
has_attribute(leya_organa, wears_distinctive_hair_buns).
has_attribute(leya_organa, is_captured_by_darth_vader).

% Индиана Джонс
has_attribute(indiana_dzhons, live_action).
has_attribute(indiana_dzhons, male).
has_attribute(indiana_dzhons, adult).
has_attribute(indiana_dzhons, human).
has_attribute(indiana_dzhons, is_an_archaeologist).
has_attribute(indiana_dzhons, uses_a_whip).
has_attribute(indiana_dzhons, wears_a_fedora_hat).
has_attribute(indiana_dzhons, fears_snakes).
has_attribute(indiana_dzhons, seeks_ancient_artifacts).
has_attribute(indiana_dzhons, from_indiana_jones).
has_attribute(indiana_dzhons, is_also_a_professor).

% Терминатор (T-800)
has_attribute(terminator_t800, live_action).
has_attribute(terminator_t800, male).
has_attribute(terminator_t800, non_human).
has_attribute(terminator_t800, is_a_robot).
has_attribute(terminator_t800, is_from_the_future).
has_attribute(terminator_t800, is_initially_an_antagonist).
has_attribute(terminator_t800, says_i_ll_be_back).
has_attribute(terminator_t800, has_a_metal_skeleton_under_skin).
has_attribute(terminator_t800, from_the_terminator_franchise).
has_attribute(terminator_t800, protects_john_connor).
has_attribute(terminator_t800, has_red_eyes).

% Сара Коннор
has_attribute(sara_konnor, live_action).
has_attribute(sara_konnor, female).
has_attribute(sara_konnor, adult).
has_attribute(sara_konnor, human).
has_attribute(sara_konnor, is_a_mother_of_future_leader_john_connor).
has_attribute(sara_konnor, fights_against_robots).
has_attribute(sara_konnor, becomes_a_strong_warrior).
has_attribute(sara_konnor, is_a_waitress_at_first).
has_attribute(sara_konnor, from_the_terminator_franchise).
has_attribute(sara_konnor, is_paranoid).

% Марти МакФлай
has_attribute(marti_makflay, live_action).
has_attribute(marti_makflay, male).
has_attribute(marti_makflay, child).
has_attribute(marti_makflay, human).
has_attribute(marti_makflay, travels_through_time).
has_attribute(marti_makflay, uses_a_delorean_to_time_travel).
has_attribute(marti_makflay, plays_guitar).
has_attribute(marti_makflay, is_friend_of_a_scientist_named_doc_brown).
has_attribute(marti_makflay, from_back_to_the_future).
has_attribute(marti_makflay, is_afraid_of_being_called_chicken).
has_attribute(marti_makflay, skateboards).

% Док Браун
has_attribute(dok_braun, live_action).
has_attribute(dok_braun, male).
has_attribute(dok_braun, adult).
has_attribute(dok_braun, human).
has_attribute(dok_braun, is_a_scientist).
has_attribute(dok_braun, invents_a_time_machine).
has_attribute(dok_braun, has_wild_white_hair).
has_attribute(dok_braun, is_friend_of_marty_mcfly).
has_attribute(dok_braun, from_back_to_the_future).
has_attribute(dok_braun, often_says_great_scott).
has_attribute(dok_braun, has_a_dog_pet_named_einstein).

% Форрест Гамп
has_attribute(forrest_gamp, live_action).
has_attribute(forrest_gamp, male).
has_attribute(forrest_gamp, adult).
has_attribute(forrest_gamp, human).
has_attribute(forrest_gamp, tells_his_life_story_on_a_bench).
has_attribute(forrest_gamp, is_simple_minded_but_successful).
has_attribute(forrest_gamp, is_good_at_running).
has_attribute(forrest_gamp, from_forrest_gump).
has_attribute(forrest_gamp, loves_shrimp).
has_attribute(forrest_gamp, meets_several_famous_people).
has_attribute(forrest_gamp, says_life_is_like_a_box_of_chocolates).

% Рокки Бальбоа
has_attribute(rokki_balboa, live_action).
has_attribute(rokki_balboa, male).
has_attribute(rokki_balboa, adult).
has_attribute(rokki_balboa, human).
has_attribute(rokki_balboa, is_a_boxer).
has_attribute(rokki_balboa, is_from_philadelphia).
has_attribute(rokki_balboa, fights_famous_opponents).
has_attribute(rokki_balboa, is_an_underdog).
has_attribute(rokki_balboa, runs_up_famous_steps).
has_attribute(rokki_balboa, from_rocky_franchise).
has_attribute(rokki_balboa, is_left_handed).

% Джон МакКлейн
has_attribute(dzhon_makkleyn, live_action).
has_attribute(dzhon_makkleyn, male).
has_attribute(dzhon_makkleyn, adult).
has_attribute(dzhon_makkleyn, human).
has_attribute(dzhon_makkleyn, is_a_police_officer).
has_attribute(dzhon_makkleyn, fights_terrorists_alone_in_a_building).
has_attribute(dzhon_makkleyn, is_often_barefoot_and_bloody).
has_attribute(dzhon_makkleyn, says_yippee_ki_yay).
has_attribute(dzhon_makkleyn, from_die_hard_franchise).
has_attribute(dzhon_makkleyn, from_new_york_city).

% Капитан Джек Воробей
has_attribute(kapitan_dzhek_vorobey, live_action).
has_attribute(kapitan_dzhek_vorobey, male).
has_attribute(kapitan_dzhek_vorobey, adult).
has_attribute(kapitan_dzhek_vorobey, human).
has_attribute(kapitan_dzhek_vorobey, is_a_pirate).
has_attribute(kapitan_dzhek_vorobey, is_captain_of_the_black_pearl).
has_attribute(kapitan_dzhek_vorobey, is_eccentric_or_quirky).
has_attribute(kapitan_dzhek_vorobey, wears_dreadlocks_and_hat).
has_attribute(kapitan_dzhek_vorobey, is_a_trickster).
has_attribute(kapitan_dzhek_vorobey, from_pirates_of_the_caribbean).
has_attribute(kapitan_dzhek_vorobey, uses_a_compass_that_points_to_what_he_wants_most).

% Китнисс Эвердин
has_attribute(kitniss_everdin, live_action).
has_attribute(kitniss_everdin, female).
has_attribute(kitniss_everdin, child).
has_attribute(kitniss_everdin, human).
has_attribute(kitniss_everdin, is_a_skilled_archer).
has_attribute(kitniss_everdin, volunteers_for_a_deadly_competition_the_hunger_games).
has_attribute(kitniss_everdin, starts_a_rebellion).
has_attribute(kitniss_everdin, is_from_district_12).
has_attribute(kitniss_everdin, from_the_hunger_games).
has_attribute(kitniss_everdin, hunts_to_feed_her_family).

% Пит Мелларк
has_attribute(pit_mellark, live_action).
has_attribute(pit_mellark, male).
has_attribute(pit_mellark, child).
has_attribute(pit_mellark, human).
has_attribute(pit_mellark, is_a_baker_s_son).
has_attribute(pit_mellark, competes_in_a_deadly_competition_the_hunger_games).
has_attribute(pit_mellark, is_from_district_12).
has_attribute(pit_mellark, from_the_hunger_games).
has_attribute(pit_mellark, can_camouflage).
has_attribute(pit_mellark, is_in_love_with_katniss).

% Малефисента
has_attribute(malefisenta, live_action).
has_attribute(malefisenta, animated).
has_attribute(malefisenta, female).
has_attribute(malefisenta, adult).
has_attribute(malefisenta, non_human).
has_attribute(malefisenta, has_horns).
has_attribute(malefisenta, wears_dark_clothing).
has_attribute(malefisenta, is_a_powerful_magic_user).
has_attribute(malefisenta, is_initially_a_villain).
has_attribute(malefisenta, from_sleeping_beauty_or_maleficent_film).
has_attribute(malefisenta, curses_a_baby_princess).

% Эйс Вентура
has_attribute(eis_ventura, live_action).
has_attribute(eis_ventura, male).
has_attribute(eis_ventura, adult).
has_attribute(eis_ventura, human).
has_attribute(eis_ventura, is_a_pet_detective).
has_attribute(eis_ventura, has_a_distinctive_hairstyle).
has_attribute(eis_ventura, talks_in_a_funny_way).
has_attribute(eis_ventura, from_ace_ventura_franchise).
has_attribute(eis_ventura, loves_animals).
has_attribute(eis_ventura, says_all_righty_then).

% Нео (Томас Андерсон)
has_attribute(neo, live_action).
has_attribute(neo, male).
has_attribute(neo, adult).
has_attribute(neo, human).
has_attribute(neo, lives_in_a_simulated_reality_the_matrix).
has_attribute(neo, is_known_as_the_one).
has_attribute(neo, can_manipulate_physics_in_the_matrix).
has_attribute(neo, wears_a_black_trench_coat).
has_attribute(neo, is_a_computer_programmer_at_first).
has_attribute(neo, from_the_matrix_franchise).
has_attribute(neo, learns_kung_fu_instantly).

% Морфеус
has_attribute(morfius, live_action).
has_attribute(morfius, male).
has_attribute(morfius, adult).
has_attribute(morfius, human).
has_attribute(morfius, is_a_leader_of_rebels_zion).
has_attribute(morfius, wears_a_trench_coat_and_sunglasses).
has_attribute(morfius, believes_in_neo).
has_attribute(morfius, offers_a_choice_of_pills).
has_attribute(morfius, from_the_matrix_franchise).
has_attribute(morfius, is_skilled_in_martial_arts).
has_attribute(morfius, is_captain_of_the_nebuchadnezzar).

% Тринити
has_attribute(triniti, live_action).
has_attribute(triniti, female).
has_attribute(triniti, adult).
has_attribute(triniti, human).
has_attribute(triniti, is_a_skilled_hacker).
has_attribute(triniti, wears_black_leather_clothing).
has_attribute(triniti, is_in_love_with_neo).
has_attribute(triniti, from_the_matrix_franchise).
has_attribute(triniti, is_skilled_in_martial_arts).
has_attribute(triniti, rides_a_motorcycle_in_chase).

% Арагорн
has_attribute(aragorn, live_action).
has_attribute(aragorn, male).
has_attribute(aragorn, adult).
has_attribute(aragorn, human).
has_attribute(aragorn, is_a_ranger_at_first).
has_attribute(aragorn, is_rightful_king_of_gondor).
has_attribute(aragorn, uses_a_sword_named_anduril).
has_attribute(aragorn, is_part_of_a_fellowship).
has_attribute(aragorn, is_in_love_with_an_elf_named_arwen).
has_attribute(aragorn, from_the_lord_of_the_rings).
has_attribute(aragorn, is_over_80_years_old).

% Гэндальф
has_attribute(gendalf, live_action).
has_attribute(gendalf, male).
has_attribute(gendalf, adult). % Он вроде как вечный, но выглядит пожилым
has_attribute(gendalf, non_human). % Является Истари (волшебником), не человеком
has_attribute(gendalf, is_a_wizard).
has_attribute(gendalf, is_old).
has_attribute(gendalf, wears_grey_or_white_robes).
has_attribute(gendalf, uses_a_staff).
has_attribute(gendalf, is_part_of_a_fellowship).
has_attribute(gendalf, guides_the_protagonist_frodo).
has_attribute(gendalf, from_the_lord_of_the_rings).
has_attribute(gendalf, fights_a_balrog_in_moria).

% Фродо Бэггинс
has_attribute(frodo_beggins, live_action).
has_attribute(frodo_beggins, male).
has_attribute(frodo_beggins, adult). % По меркам хоббитов он взрослый (33+)
has_attribute(frodo_beggins, non_human). % Хоббит
has_attribute(frodo_beggins, lives_in_the_shire).
has_attribute(frodo_beggins, carries_a_powerful_ring_the_one_ring).
has_attribute(frodo_beggins, is_part_of_a_fellowship).
has_attribute(frodo_beggins, travels_to_mount_doom).
has_attribute(frodo_beggins, from_the_lord_of_the_rings).
has_attribute(frodo_beggins, has_hairy_feet).

% Сэмвайс Гэмджи
has_attribute(semvays_gemdzhi, live_action).
has_attribute(semvays_gemdzhi, male).
has_attribute(semvays_gemdzhi, adult). % По меркам хоббитов
has_attribute(semvays_gemdzhi, non_human). % Хоббит
has_attribute(semvays_gemdzhi, lives_in_the_shire).
has_attribute(semvays_gemdzhi, is_a_gardener).
has_attribute(semvays_gemdzhi, is_friend_and_companion_of_frodo).
has_attribute(semvays_gemdzhi, is_very_loyal).
has_attribute(semvays_gemdzhi, from_the_lord_of_the_rings).
has_attribute(semvays_gemdzhi, kills_shelob).

% Боромир
has_attribute(boromir, live_action).
has_attribute(boromir, male).
has_attribute(boromir, adult).
has_attribute(boromir, human).
has_attribute(boromir, is_from_gondor).
has_attribute(boromir, wants_to_use_the_ring).
has_attribute(boromir, is_part_of_a_fellowship).
has_attribute(boromir, dies_heroically).
has_attribute(boromir, from_the_lord_of_the_rings).
has_attribute(boromir, uses_a_shield).

% Леголас
has_attribute(legolas, live_action).
has_attribute(legolas, male).
has_attribute(legolas, adult). % Эльфы не стареют как люди, но он взрослый
has_attribute(legolas, non_human). % Эльф
has_attribute(legolas, is_an_elf).
has_attribute(legolas, is_skilled_archer).
has_attribute(legolas, has_blonde_hair).
has_attribute(legolas, is_part_of_a_fellowship).
has_attribute(legolas, from_the_lord_of_the_rings).
has_attribute(legolas, is_prince_of_mirkwood).

% Гимли
has_attribute(gimli, live_action).
has_attribute(gimli, male).
has_attribute(gimli, adult). % Гномы живут долго, но он взрослый
has_attribute(gimli, non_human). % Гном
has_attribute(gimli, is_a_dwarf).
has_attribute(gimli, uses_an_axe).
has_attribute(gimli, has_a_beard).
has_attribute(gimli, is_part_of_a_fellowship).
has_attribute(gimli, argues_with_legolas).
has_attribute(gimli, from_the_lord_of_the_rings).
has_attribute(gimli, is_son_of_gloin).

% Джокер
has_attribute(dzhoker, live_action).
has_attribute(dzhoker, male).
has_attribute(dzhoker, adult).
has_attribute(dzhoker, human).
has_attribute(dzhoker, is_a_villain).
has_attribute(dzhoker, is_enemy_of_batman).
has_attribute(dzhoker, has_a_permanent_smile_or_grin).
has_attribute(dzhoker, wears_purple_suit).
has_attribute(dzhoker, is_insane).
has_attribute(dzhoker, is_a_clown_like_criminal).
has_attribute(dzhoker, from_dc_comics).
has_attribute(dzhoker, has_white_skin_and_green_hair).

% Бэтмен/Брюс Уэйн
has_attribute(betmen, live_action).
has_attribute(betmen, male).
has_attribute(betmen, adult).
has_attribute(betmen, human).
has_attribute(betmen, is_a_superhero).
has_attribute(betmen, does_not_have_superpowers).
has_attribute(betmen, uses_gadgets).
has_attribute(betmen, wears_a_bat_themed_costume).
has_attribute(betmen, lives_in_gotham_city).
has_attribute(betmen, has_a_secret_identity_as_bruce_wayne).
has_attribute(betmen, is_a_billionaire).
has_attribute(betmen, from_dc_comics).
has_attribute(betmen, operates_at_night).

% Альфред Пенниуорт
has_attribute(alfred_penniuort, live_action).
has_attribute(alfred_penniuort, male).
has_attribute(alfred_penniuort, elder).
has_attribute(alfred_penniuort, human).
has_attribute(alfred_penniuort, is_a_butler).
has_attribute(alfred_penniuort, works_for_bruce_wayne).
has_attribute(alfred_penniuort, helps_batman).
has_attribute(alfred_penniuort, lives_in_wayne_manor).
has_attribute(alfred_penniuort, is_british).
has_attribute(alfred_penniuort, from_dc_comics).
has_attribute(alfred_penniuort, is_a_father_figure).

% Джеймс Бонд
has_attribute(dzheyms_bond, live_action).
has_attribute(dzheyms_bond, male).
has_attribute(dzheyms_bond, adult).
has_attribute(dzheyms_bond, human).
has_attribute(dzheyms_bond, is_a_spy).
has_attribute(dzheyms_bond, works_for_british_secret_service).
has_attribute(dzheyms_bond, uses_gadgets).
has_attribute(dzheyms_bond, travels_the_world).
has_attribute(dzheyms_bond, is_known_as_007).
has_attribute(dzheyms_bond, likes_martinis_shaken_not_stirred).
has_attribute(dzheyms_bond, from_james_bond_franchise).
has_attribute(dzheyms_bond, drives_fast_cars).

% Мистер Смит (Матрица)
has_attribute(mister_smit, live_action).
has_attribute(mister_smit, male).
has_attribute(mister_smit, non_human). % Программа, не человек
has_attribute(mister_smit, is_a_program).
has_attribute(mister_smit, wears_a_suit_and_sunglasses).
has_attribute(mister_smit, can_copy_himself).
has_attribute(mister_smit, is_an_antagonist).
has_attribute(mister_smit, enemy_of_neo).
has_attribute(mister_smit, from_the_matrix_franchise).
has_attribute(mister_smit, wants_to_escape_the_matrix).

% Вилли Вонка
has_attribute(villi_vonka, live_action).
has_attribute(villi_vonka, male).
has_attribute(villi_vonka, adult).
has_attribute(villi_vonka, human).
has_attribute(villi_vonka, owns_a_chocolate_factory).
has_attribute(villi_vonka, is_eccentric).
has_attribute(villi_vonka, offers_a_tour).
has_attribute(villi_vonka, wears_a_top_hat).
has_attribute(villi_vonka, from_charlie_and_the_chocolate_factory).
has_attribute(villi_vonka, has_small_workers_called_oompa_loompas).

% Чарли Бакет
has_attribute(charli_baket, live_action).
has_attribute(charli_baket, male).
has_attribute(charli_baket, child).
has_attribute(charli_baket, human).
has_attribute(charli_baket, is_poor).
has_attribute(charli_baket, finds_a_golden_ticket).
has_attribute(charli_baket, is_good_hearted).
has_attribute(charli_baket, goes_on_a_factory_tour).
has_attribute(charli_baket, lives_with_his_grandparents).
has_attribute(charli_baket, from_charlie_and_the_chocolate_factory).
has_attribute(charli_baket, inherits_the_factory).

% Эдвард Руки-ножницы
has_attribute(edvard_ruki_nozhnicy, live_action).
has_attribute(edvard_ruki_nozhnicy, male).
has_attribute(edvard_ruki_nozhnicy, adult).
has_attribute(edvard_ruki_nozhnicy, human). % Внешне как человек, но создан искусственно
has_attribute(edvard_ruki_nozhnicy, has_scissors_for_hands).
has_attribute(edvard_ruki_nozhnicy, was_created_by_an_inventor).
has_attribute(edvard_ruki_nozhnicy, is_gentle_despite_appearance).
has_attribute(edvard_ruki_nozhnicy, is_pale_with_dark_hair).
has_attribute(edvard_ruki_nozhnicy, lives_in_a_castle_at_first).
has_attribute(edvard_ruki_nozhnicy, from_edward_scissorhands).
has_attribute(edvard_ruki_nozhnicy, can_create_ice_sculptures).

% Гарри Данн
has_attribute(garri_dann, live_action).
has_attribute(garri_dann, male).
has_attribute(garri_dann, adult).
has_attribute(garri_dann, human).
has_attribute(garri_dann, is_not_very_intelligent).
has_attribute(garri_dann, travels_with_a_friend_named_lloyd).
has_attribute(garri_dann, wears_distinctive_orange_tuxedo).
has_attribute(garri_dann, from_dumb_and_dumber).
has_attribute(garri_dann, owns_a_dog_van).

% Ллойд Кристмас
has_attribute(lloyd_kristmas, live_action).
has_attribute(lloyd_kristmas, male).
has_attribute(lloyd_kristmas, adult).
has_attribute(lloyd_kristmas, human).
has_attribute(lloyd_kristmas, is_not_very_intelligent).
has_attribute(lloyd_kristmas, travels_with_a_friend_named_harry).
has_attribute(lloyd_kristmas, rides_a_mini_bike).
has_attribute(lloyd_kristmas, from_dumb_and_dumber).
has_attribute(lloyd_kristmas, has_a_chipped_tooth).

% Детектив Дэвид Миллс
has_attribute(detektiv_devid_mills, live_action).
has_attribute(detektiv_devid_mills, male).
has_attribute(detektiv_devid_mills, adult).
has_attribute(detektiv_devid_mills, human).
has_attribute(detektiv_devid_mills, is_a_police_detective).
has_attribute(detektiv_devid_mills, is_new_to_the_city).
has_attribute(detektiv_devid_mills, investigates_serial_murders).
has_attribute(detektiv_devid_mills, is_partnered_with_an_older_detective_named_somerset).
has_attribute(detektiv_devid_mills, is_impetuous).
has_attribute(detektiv_devid_mills, from_se7en).
has_attribute(detektiv_devid_mills, is_married).

% Детектив Уильям Сомерсет
has_attribute(detektiv_uilyam_somerset, live_action).
has_attribute(detektiv_uilyam_somerset, male).
has_attribute(detektiv_uilyam_somerset, elder).
has_attribute(detektiv_uilyam_somerset, human).
has_attribute(detektiv_uilyam_somerset, is_a_police_detective).
has_attribute(detektiv_uilyam_somerset, is_about_to_retire).
has_attribute(detektiv_uilyam_somerset, investigates_serial_murders).
has_attribute(detektiv_uilyam_somerset, is_partnered_with_a_younger_detective_named_mills).
has_attribute(detektiv_uilyam_somerset, is_methodical).
has_attribute(detektiv_uilyam_somerset, from_se7en).
has_attribute(detektiv_uilyam_somerset, is_wise).

% Джон Доу (Se7en)
has_attribute(dzhon_dou_se7en, live_action).
has_attribute(dzhon_dou_se7en, male).
has_attribute(dzhon_dou_se7en, adult).
has_attribute(dzhon_dou_se7en, human).
has_attribute(dzhon_dou_se7en, is_a_serial_killer).
has_attribute(dzhon_dou_se7en, murders_based_on_seven_deadly_sins).
has_attribute(dzhon_dou_se7en, is_methodical_and_intelligent).
has_attribute(dzhon_dou_se7en, from_se7en).
has_attribute(dzhon_dou_se7en, turns_himself_in).
has_attribute(dzhon_dou_se7en, his_face_is_initially_hidden).

% Халк/Брюс Бэннер
has_attribute(halk, live_action).
has_attribute(halk, male).
has_attribute(halk, adult).
has_attribute(halk, human).
has_attribute(halk, has_super_strength).
has_attribute(halk, turns_green_when_angry).
has_attribute(halk, is_a_scientist_named_bruce_banner).
has_attribute(halk, is_part_of_avengers_team).
has_attribute(halk, from_marvel).
has_attribute(halk, is_indestructible).
has_attribute(halk, grows_in_size).

% Железный человек/Тони Старк
has_attribute(zheleznyi_chelovek, live_action).
has_attribute(zheleznyi_chelovek, male).
has_attribute(zheleznyi_chelovek, adult).
has_attribute(zheleznyi_chelovek, human).
has_attribute(zheleznyi_chelovek, wears_a_powered_suit).
has_attribute(zheleznyi_chelovek, is_a_billionaire).
has_attribute(zheleznyi_chelovek, is_an_inventor_named_tony_stark).
has_attribute(zheleznyi_chelovek, is_sarcastic_or_witty).
has_attribute(zheleznyi_chelovek, is_part_of_avengers_team).
has_attribute(zheleznyi_chelovek, from_marvel).
has_attribute(zheleznyi_chelovek, has_an_arc_reactor).

% Капитан Америка/Стив Роджерс
has_attribute(kapitan_amerika, live_action).
has_attribute(kapitan_amerika, male).
has_attribute(kapitan_amerika, adult).
has_attribute(kapitan_amerika, human).
has_attribute(kapitan_amerika, is_a_super_soldier).
has_attribute(kapitan_amerika, uses_a_shield).
has_attribute(kapitan_amerika, was_frozen_in_ice).
has_attribute(kapitan_amerika, is_a_leader).
has_attribute(kapitan_amerika, is_part_of_avengers_team).
has_attribute(kapitan_amerika, from_marvel).
has_attribute(kapitan_amerika, is_from_the_1940s).
has_attribute(kapitan_amerika, is_honorable).

% Тор
has_attribute(tor, live_action).
has_attribute(tor, male).
has_attribute(tor, adult). % Боги Асгарда живут очень долго, но по восприятию он взрослый
has_attribute(tor, non_human). % Бог (Асгардец)
has_attribute(tor, is_a_god).
has_attribute(tor, uses_a_hammer_or_axe_mjolnir_stormbreaker).
has_attribute(tor, controls_lightning).
has_attribute(tor, is_from_another_realm_asgard).
has_attribute(tor, is_part_of_avengers_team).
has_attribute(tor, from_marvel).
has_attribute(tor, has_a_brother_named_loki).

% Черная вдова/Наташа Романофф
has_attribute(chernaya_vdova, live_action).
has_attribute(chernaya_vdova, female).
has_attribute(chernaya_vdova, adult).
has_attribute(chernaya_vdova, human).
has_attribute(chernaya_vdova, is_a_spy).
has_attribute(chernaya_vdova, is_a_master_of_martial_arts).
has_attribute(chernaya_vdova, is_from_russia).
has_attribute(chernaya_vdova, is_part_of_avengers_team).
has_attribute(chernaya_vdova, from_marvel).
has_attribute(chernaya_vdova, wears_black_suit).
% Человек-паук/Питер Паркер
has_attribute(chelovek_pauk, live_action).
has_attribute(chelovek_pauk, male).
has_attribute(chelovek_pauk, child). % В первых фильмах/комиксах
has_attribute(chelovek_pauk, human).
has_attribute(chelovek_pauk, can_shoot_webs).
has_attribute(chelovek_pauk, can_climb_walls).
has_attribute(chelovek_pauk, wears_a_red_and_blue_suit).
has_attribute(chelovek_pauk, has_a_spider_sense).
has_attribute(chelovek_pauk, lives_in_new_york_city).
has_attribute(chelovek_pauk, from_marvel).
has_attribute(chelovek_pauk, is_initially_a_high_school_student).
has_attribute(chelovek_pauk, was_bitten_by_a_radioactive_spider).

% Доктор Стрэндж/Стивен Стрэндж
has_attribute(doktor_strendzh, live_action).
has_attribute(doktor_strendzh, male).
has_attribute(doktor_strendzh, adult).
has_attribute(doktor_strendzh, human).
has_attribute(doktor_strendzh, is_a_sorcerer).
has_attribute(doktor_strendzh, was_a_surgeon).
has_attribute(doktor_strendzh, wears_a_red_cloak).
has_attribute(doktor_strendzh, uses_magic_from_hands).
has_attribute(doktor_strendzh, is_part_of_avengers_team).
has_attribute(doktor_strendzh, from_marvel).
has_attribute(doktor_strendzh, has_eye_of_agamotto).
% Звездный Лорд/Питер Квилл
has_attribute(zvezdnyi_lord, live_action).
has_attribute(zvezdnyi_lord, male).
has_attribute(zvezdnyi_lord, adult).
has_attribute(zvezdnyi_lord, human). % Хотя и с элементами внеземного происхождения
has_attribute(zvezdnyi_lord, is_a_space_traveler).
has_attribute(zvezdnyi_lord, is_a_leader_of_guardians_of_the_galaxy).
has_attribute(zvezdnyi_lord, loves_old_music).
has_attribute(zvezdnyi_lord, uses_blasters).
has_attribute(zvezdnyi_lord, from_marvel).
has_attribute(zvezdnyi_lord, carries_a_walkman).

% Грут
has_attribute(grut, live_action).
has_attribute(grut, male). % Обычно воспринимается как мужского пола
has_attribute(grut, non_human).
has_attribute(grut, is_a_tree_like_creature).
has_attribute(grut, can_only_say_i_am_groot).
has_attribute(grut, is_friend_of_rocket).
has_attribute(grut, is_part_of_guardians_of_the_galaxy).
has_attribute(grut, can_regenerate).
has_attribute(grut, from_marvel).
has_attribute(grut, is_very_strong).

% Ракета (Енот)
has_attribute(raketa_yenot, live_action).
has_attribute(raketa_yenot, male).
has_attribute(raketa_yenot, non_human).
has_attribute(raketa_yenot, is_a_raccoon).
has_attribute(raketa_yenot, is_genetically_engineered).
has_attribute(raketa_yenot, is_a_skilled_marksman).
has_attribute(raketa_yenot, is_friend_of_groot).
has_attribute(raketa_yenot, is_part_of_guardians_of_the_galaxy).
has_attribute(raketa_yenot, is_sarcastic).
has_attribute(raketa_yenot, from_marvel).
has_attribute(raketa_yenot, is_a_master_of_explosives).

% Принцесса Оливия / Лютик (The Princess Bride)
has_attribute(lyutik_princess_bride, live_action).
has_attribute(lyutik_princess_bride, female).
has_attribute(lyutik_princess_bride, adult).
has_attribute(lyutik_princess_bride, human).
has_attribute(lyutik_princess_bride, is_a_princess).
has_attribute(lyutik_princess_bride, is_in_love_with_a_farm_boy_named_westley).
has_attribute(lyutik_princess_bride, is_captured_by_villains).
has_attribute(lyutik_princess_bride, from_the_princess_bride).
has_attribute(lyutik_princess_bride, is_beautiful).

% Уэстли/Страшный Пират Робертс
has_attribute(uestli_princess_bride, live_action).
has_attribute(uestli_princess_bride, male).
has_attribute(uestli_princess_bride, adult).
has_attribute(uestli_princess_bride, human).
has_attribute(uestli_princess_bride, is_a_farm_boy_at_first).
has_attribute(uestli_princess_bride, is_also_known_as_dread_pirate_roberts).
has_attribute(uestli_princess_bride, says_as_you_wish).
has_attribute(uestli_princess_bride, is_skilled_swordsman).
has_attribute(uestli_princess_bride, from_the_princess_bride).
has_attribute(uestli_princess_bride, wears_a_black_mask).
has_attribute(uestli_princess_bride, rescues_a_princess_named_buttercup).

% Иниго Монтойя
has_attribute(inigo_montoyya, live_action).
has_attribute(inigo_montoyya, male).
has_attribute(inigo_montoyya, adult).
has_attribute(inigo_montoyya, human).
has_attribute(inigo_montoyya, is_a_swordsman).
has_attribute(inigo_montoyya, seeks_revenge).
has_attribute(inigo_montoyya, says_hello_my_name_is_inigo_montoya).
has_attribute(inigo_montoyya, from_the_princess_bride).
has_attribute(inigo_montoyya, has_a_scar_on_his_face).
has_attribute(inigo_montoyya, seeks_a_six_fingered_man).

% Дороти Гейл
has_attribute(doroti_geyl, live_action).
has_attribute(doroti_geyl, female).
has_attribute(doroti_geyl, child).
has_attribute(doroti_geyl, human).
has_attribute(doroti_geyl, is_from_kansas).
has_attribute(doroti_geyl, travels_to_a_magical_land_oz).
has_attribute(doroti_geyl, has_a_dog_pet_named_toto).
has_attribute(doroti_geyl, wears_ruby_slippers).
has_attribute(doroti_geyl, follows_a_yellow_brick_road).
has_attribute(doroti_geyl, from_the_wizard_of_oz).

% Страшила (Волшебник страны Оз)
has_attribute(strashila_oz, live_action).
has_attribute(strashila_oz, male).
has_attribute(strashila_oz, non_human).
has_attribute(strashila_oz, is_made_of_straw).
has_attribute(strashila_oz, wants_a_brain).
has_attribute(strashila_oz, travels_with_dorothy).
has_attribute(strashila_oz, from_the_wizard_of_oz).
has_attribute(strashila_oz, is_flexible).

% Железный Дровосек (Волшебник страны Оз)
has_attribute(zheleznyi_drovosek_oz, live_action).
has_attribute(zheleznyi_drovosek_oz, male).
has_attribute(zheleznyi_drovosek_oz, non_human).
has_attribute(zheleznyi_drovosek_oz, is_made_of_tin).
has_attribute(zheleznyi_drovosek_oz, wants_a_heart).
has_attribute(zheleznyi_drovosek_oz, travels_with_dorothy).
has_attribute(zheleznyi_drovosek_oz, from_the_wizard_of_oz).
has_attribute(zheleznyi_drovosek_oz, rusts_easily).

% Трусливый Лев (Волшебник страны Оз)
has_attribute(truslivyi_lev_oz, live_action).
has_attribute(truslivyi_lev_oz, male).
has_attribute(truslivyi_lev_oz, non_human).
has_attribute(truslivyi_lev_oz, is_a_lion).
has_attribute(truslivyi_lev_oz, wants_courage).
has_attribute(truslivyi_lev_oz, travels_with_dorothy).
has_attribute(truslivyi_lev_oz, from_the_wizard_of_oz).
has_attribute(truslivyi_lev_oz, is_king_of_the_forest_but_afraid).

% Уолтер Уайт
has_attribute(uolter_uayt, live_action).
has_attribute(uolter_uayt, male).
has_attribute(uolter_uayt, adult).
has_attribute(uolter_uayt, human).
has_attribute(uolter_uayt, is_a_chemistry_teacher_at_first).
has_attribute(uolter_uayt, becomes_a_drug_dealer).
has_attribute(uolter_uayt, is_diagnosed_with_cancer).
has_attribute(uolter_uayt, cooks_meth).
has_attribute(uolter_uayt, is_known_as_heisenberg).
has_attribute(uolter_uayt, from_breaking_bad).
has_attribute(uolter_uayt, shaves_his_head).

% Джесси Пинкман
has_attribute(dzhessi_pinkman, live_action).
has_attribute(dzhessi_pinkman, male).
has_attribute(dzhessi_pinkman, adult).
has_attribute(dzhessi_pinkman, human).
has_attribute(dzhessi_pinkman, is_a_drug_dealer).
has_attribute(dzhessi_pinkman, is_partner_of_walter_white).
has_attribute(dzhessi_pinkman, says_bitch_a_lot).
has_attribute(dzhessi_pinkman, from_breaking_bad).
has_attribute(dzhessi_pinkman, uses_slang).
has_attribute(dzhessi_pinkman, is_younger_than_his_partner).

% Дон Дрейпер
has_attribute(don_dreyper, live_action).
has_attribute(don_dreyper, male).
has_attribute(don_dreyper, adult).
has_attribute(don_dreyper, human).
has_attribute(don_dreyper, works_in_advertising).
has_attribute(don_dreyper, has_a_secret_past).
has_attribute(don_dreyper, is_good_at_creating_slogans).
has_attribute(don_dreyper, smokes_and_drinks_a_lot).
has_attribute(don_dreyper, from_mad_men).
has_attribute(don_dreyper, has_multiple_affairs).

% Тони Сопрано
has_attribute(toni_soprano, live_action).
has_attribute(toni_soprano, male).
has_attribute(toni_soprano, adult).
has_attribute(toni_soprano, human).
has_attribute(toni_soprano, is_a_mafia_boss).
has_attribute(toni_soprano, has_panic_attacks).
has_attribute(toni_soprano, sees_a_therapist_dr_melfi).
has_attribute(toni_soprano, lives_in_new_jersey).
has_attribute(toni_soprano, from_the_sopranos).
has_attribute(toni_soprano, has_problems_balancing_family_and_crime).

% Доктор Грегори Хаус
has_attribute(doktor_gregori_haus, live_action).
has_attribute(doktor_gregori_haus, male).
has_attribute(doktor_gregori_haus, adult).
has_attribute(doktor_gregori_haus, human).
has_attribute(doktor_gregori_haus, is_a_doctor).
has_attribute(doktor_gregori_haus, solves_medical_mysteries).
has_attribute(doktor_gregori_haus, uses_a_cane).
has_attribute(doktor_gregori_haus, is_cynical_or_misanthropic).
has_attribute(doktor_gregori_haus, is_addicted_to_painkillers_vicodin).
has_attribute(doktor_gregori_haus, works_at_princeton_plainsboro_teaching_hospital).

% Шерлок Холмс
has_attribute(sherlok_holms, live_action).
has_attribute(sherlok_holms, male).
has_attribute(sherlok_holms, adult).
has_attribute(sherlok_holms, human).
has_attribute(sherlok_holms, is_a_detective).
has_attribute(sherlok_holms, uses_deduction).
has_attribute(sherlok_holms, lives_at_221b_baker_street).
has_attribute(sherlok_holms, has_a_doctor_as_a_companion_named_watson).
has_attribute(sherlok_holms, is_very_intelligent).
has_attribute(sherlok_holms, plays_the_violin).

% Доктор Джон Ватсон
has_attribute(doktor_dzhon_vatson, live_action).
has_attribute(doktor_dzhon_vatson, male).
has_attribute(doktor_dzhon_vatson, adult).
has_attribute(doktor_vatson, human). % Опечатка в имени Ватсона - ИСПРАВЛЕНО
has_attribute(doktor_dzhon_vatson, is_a_doctor).
has_attribute(doktor_dzhon_vatson, is_a_companion_to_sherlock_holmes).
has_attribute(doktor_dzhon_vatson, writes_about_adventures).
has_attribute(doktor_dzhon_vatson, lives_at_221b_baker_street).
has_attribute(doktor_dzhon_vatson, from_sherlock_holmes_stories).
has_attribute(doktor_dzhon_vatson, was_injured_in_afghanistan).

% Дейенерис Таргариен
has_attribute(deyen_ris_targarien, live_action).
has_attribute(deyen_ris_targarien, female).
has_attribute(deyen_ris_targarien, adult).
has_attribute(deyen_ris_targarien, human).
has_attribute(deyen_ris_targarien, has_dragons).
has_attribute(deyen_ris_targarien, has_silver_hair).
has_attribute(deyen_ris_targarien, seeks_the_iron_throne).
has_attribute(deyen_ris_targarien, is_called_mother_of_dragons).
has_attribute(deyen_ris_targarien, from_game_of_thrones).
has_attribute(deyen_ris_targarien, walks_into_fire).

% Джон Сноу
has_attribute(dzhon_snou, live_action).
has_attribute(dzhon_snou, male).
has_attribute(dzhon_snou, adult).
has_attribute(dzhon_snou, human).
has_attribute(dzhon_snou, serves_on_the_night_watch).
has_attribute(dzhon_snou, is_a_bastard_son).
has_attribute(dzhon_snou, fights_against_the_dead).
has_attribute(dzhon_snou, has_a_direwolf_pet_named_ghost).
has_attribute(dzhon_snou, from_game_of_thrones).
has_attribute(dzhon_snou, is_from_the_north).
has_attribute(dzhon_snou, returns_from_death).

% Тирион Ланнистер
has_attribute(tirion_lannister, live_action).
has_attribute(tirion_lannister, male).
has_attribute(tirion_lannister, adult).
has_attribute(tirion_lannister, human).
has_attribute(tirion_lannister, is_a_dwarf_in_size).
has_attribute(tirion_lannister, is_very_intelligent).
has_attribute(tirion_lannister, drinks_a_lot).
has_attribute(tirion_lannister, is_from_a_wealthy_and_powerful_family_lannister).
has_attribute(tirion_lannister, from_game_of_thrones).
has_attribute(tirion_lannister, has_a_scar_on_his_face).

% Баффи Саммерс
has_attribute(baffi_sammers, live_action).
has_attribute(baffi_sammers, female).
has_attribute(baffi_sammers, adult).
has_attribute(baffi_sammers, human).
has_attribute(baffi_sammers, fights_vampires).
has_attribute(baffi_sammers, has_super_strength).
has_attribute(baffi_sammers, attends_high_school).
has_attribute(baffi_sammers, is_called_the_slayer).
has_attribute(baffi_sammers, from_buffy_the_vampire_slayer).
has_attribute(baffi_sammers, lives_in_sunnydale_california).

% Ангел (Баффи/Ангел)
has_attribute(angel_buffy, live_action).
has_attribute(angel_buffy, male).
has_attribute(angel_buffy, adult).
has_attribute(angel_buffy, non_human).
has_attribute(angel_buffy, is_a_vampire).
has_attribute(angel_buffy, has_a_soul).
has_attribute(angel_buffy, is_in_love_with_buffy_summers).
has_attribute(angel_buffy, lives_in_los_angeles).
has_attribute(angel_buffy, from_buffyverse).
has_attribute(angel_buffy, runs_a_detective_agency).

% Майкл Скотт
has_attribute(maykl_skott, live_action).
has_attribute(maykl_skott, male).
has_attribute(maykl_skott, adult).
has_attribute(maykl_skott, human).
has_attribute(maykl_skott, is_a_manager_of_a_paper_company).
has_attribute(maykl_skott, is_socially_awkward).
has_attribute(maykl_skott, tries_to_be_funny).
has_attribute(maykl_skott, from_the_office_us).
has_attribute(maykl_skott, says_thats_what_she_said).

% Дуайт Шрут
has_attribute(duayt_shrutt, live_action).
has_attribute(duayt_shrutt, male).
has_attribute(duayt_shrutt, adult).
has_attribute(duayt_shrutt, human).
has_attribute(duayt_shrutt, works_at_a_paper_company).
has_attribute(duayt_shrutt, is_a_salesman).
has_attribute(duayt_shrutt, is_a_beet_farmer).
has_attribute(duayt_shrutt, is_socially_awkward).
has_attribute(duayt_shrutt, aspires_to_be_manager).
has_attribute(duayt_shrutt, from_the_office_us).
has_attribute(duayt_shrutt, is_assistant_to_the_regional_manager).
% --- Конец фактов has_attribute/2 ---

% --- Переводы атрибутов на русский ---
% Вставьте сюда все факты attribute_translation/2 из вашей третьей части.
% Рекомендуется дополнить этот список переводами для всех атрибутов,
% которые вы используете в ordered_attributes/1, чтобы вопросы задавались на русском.

attribute_translation(animated, 'является анимированным персонажем').
attribute_translation(live_action, 'является актером из игрового кино').
attribute_translation(male, 'мужского пола').
attribute_translation(female, 'женского пола').
attribute_translation(child, 'ребенок').
attribute_translation(adult, 'взрослый').
attribute_translation(elder, 'пожилой').
attribute_translation(human, 'человек').
attribute_translation(non_human, 'не человек').
attribute_translation(is_a_robot, 'является роботом').
attribute_translation(is_a_superhero, 'является супергероем').
attribute_translation(is_a_villain, 'является злодеем').
attribute_translation(is_a_princess, 'является принцессой').
attribute_translation(is_a_doctor, 'является доктором').
attribute_translation(is_a_detective, 'является детективом').
attribute_translation(is_a_spy, 'является шпионом').
attribute_translation(is_a_pirate, 'является пиратом').
attribute_translation(is_a_scientist, 'является ученым').
attribute_translation(is_a_boxer, 'является боксером').
attribute_translation(is_a_manager_of_a_paper_company, 'является менеджером бумажной компании').
attribute_translation(is_a_salesman, 'является продавцом').
attribute_translation(is_a_teacher, 'является учителем').
attribute_translation(from_the_simpsons, 'из мультсериала "Симпсоны"').
attribute_translation(from_nickelodeon, 'из мультсериала Nickelodeon').
attribute_translation(from_disney, 'из мультсериалов Диснея').
attribute_translation(from_looney_tunes, 'из мультсериала "Луни Тюнз"').
attribute_translation(from_hanna_barbera, 'из мультсериала Hanna-Barbera').
attribute_translation(from_tom_and_jerry, 'из мультсериала "Том и Джерри"').
attribute_translation(from_ducktales, 'из мультсериала "Утиные истории"').
attribute_translation(from_transformers, 'из франшизы "Трансформеры"').
attribute_translation(from_he_man_and_the_masters_of_the_universe, 'из мультсериала "Хи-Мен и Властелины Вселенной"').
attribute_translation(from_garfield, 'из франшизы "Гарфилд"').
attribute_translation(from_comic_strip, 'из комиксов').
attribute_translation(from_the_pink_panther_films, 'из фильмов о Розовой пантере').
attribute_translation(from_arthur, 'из мультсериала "Артур"').
attribute_translation(from_go_diego_go, 'из мультсериала "Вперед, Диего, вперед!"').
attribute_translation(from_peppa_pig, 'из мультсериала "Свинка Пеппа"').
attribute_translation(from_russia, 'из России').
attribute_translation(from_ussr, 'из СССР').
attribute_translation(from_philosophical_cartoon, 'из философского мультфильма').
attribute_translation(from_pixar, 'из мультфильмов Pixar').
attribute_translation(from_dreamworks, 'из мультфильмов Dreamworks').
attribute_translation(from_madagascar, 'из франшизы "Мадагаскар"').
attribute_translation(from_how_to_train_your_dragon, 'из франшизы "Как приручить дракона"').
attribute_translation(from_harry_potter, 'из франшизы "Гарри Поттер"').
attribute_translation(from_star_wars, 'из франшизы "Звездные войны"').
attribute_translation(from_indiana_jones, 'из франшизы "Индиана Джонс"').
attribute_translation(from_the_terminator_franchise, 'из франшизы "Терминатор"').
attribute_translation(from_back_to_the_future, 'из франшизы "Назад в будущее"').
attribute_translation(from_forrest_gump, 'из фильма "Форрест Гамп"').
attribute_translation(from_rocky_franchise, 'из франшизы "Рокки"').
attribute_translation(from_die_hard_franchise, 'из франшизы "Крепкий орешек"').
attribute_translation(from_pirates_of_the_caribbean, 'из франшизы "Пираты Карибского моря"').
attribute_translation(from_the_hunger_games, 'из франшизы "Голодные игры"').
attribute_translation(from_ace_ventura_franchise, 'из франшизы "Эйс Вентура"').
attribute_translation(from_the_matrix_franchise, 'из франшизы "Матрица"').
attribute_translation(from_the_princess_bride, 'из фильма "Принцесса-невеста"').
attribute_translation(from_the_wizard_of_oz, 'из книги/фильма "Волшебник страны Оз"').
attribute_translation(from_breaking_bad, 'из сериала "Во все тяжкие"').
attribute_translation(from_mad_men, 'из сериала "Безумцы"').
attribute_translation(from_the_sopranos, 'из сериала "Клан Сопрано"').
attribute_translation(from_sherlock_holmes_stories, 'из рассказов о Шерлоке Холмсе').
attribute_translation(from_game_of_thrones, 'из сериала "Игра престолов"').
attribute_translation(from_buffy_the_vampire_slayer, 'из сериала "Баффи - истребительница вампиров"').
attribute_translation(from_buffyverse, 'из вселенной Баффи').
attribute_translation(from_the_office_us, 'из сериала "Офис" (США)').
attribute_translation(lives_in_springfield, 'живет в Спрингфилде').
attribute_translation(lives_under_sea, 'живет под водой').
attribute_translation(lives_in_bikini_bottom, 'живет в Бикини Боттом').
attribute_translation(lives_in_stone_age, 'живет в каменном веке').
attribute_translation(lives_in_bedrock, 'живет в Бедроке').
attribute_translation(lives_in_hundred_acre_wood, 'живет в Чудесном Лесу').
attribute_translation(lives_in_a_house, 'живет в доме').
attribute_translation(lives_on_planet_eternia, 'живет на планете Этерния').
attribute_translation(lives_with_human_owner_named_jon_arbuckle, 'живет с человеком-хозяином по имени Джон Арбакл').
attribute_translation(lives_near_a_forest, 'живет рядом с лесом').
attribute_translation(lives_in_a_forest_house, 'живет в лесном домике').
attribute_translation(lives_on_the_roof, 'живет на крыше').
attribute_translation(lives_in_a_village, 'живет в деревне').
attribute_translation(lives_in_a_city_apartment, 'живет в городской квартире').
attribute_translation(lives_on_earth_alone, 'живет один на Земле').
attribute_translation(lives_in_a_swamp, 'живет на болоте').
attribute_translation(lives_in_a_zoo_at_first, 'сначала живет в зоопарке').
attribute_translation(lives_on_an_island, 'живет на острове').
attribute_translation(lives_in_radiator_springs, 'живет в Радиатор-Спрингс').
attribute_translation(lives_in_new_york_city, 'живет в Нью-Йорке').
attribute_translation(lives_at_221b_baker_street, 'живет по адресу Бейкер-стрит, 221Б').
attribute_translation(lives_in_new_jersey, 'живет в Нью-Джерси').
attribute_translation(lives_in_gotham_city, 'живет в Готэм-Сити').
attribute_translation(lives_in_los_angeles, 'живет в Лос-Анджелесе').
attribute_translation(lives_in_sunnydale_california, 'живет в Саннидейле, Калифорния').
attribute_translation(lives_with_parents, 'живет с родителями').
attribute_translation(lives_with_garfield, 'живет с Гарфилдом').
attribute_translation(is_a_father, 'является отцом').
attribute_translation(is_married_to_marge, 'женат на Мардж').
attribute_translation(is_a_girlfriend, 'является девушкой').
attribute_translation(has_a_girlfriend_named_minnie, 'имеет подругу по имени Минни').
attribute_translation(is_the_girlfriend_of_popeye, 'является девушкой Попая').
attribute_translation(has_a_son_named_max, 'имеет сына по имени Макс').
attribute_translation(has_nephews_named_huey_dewey_louie, 'имеет племянников по имени Хьюи, Дьюи и Луи').
attribute_translation(is_a_mother_of_future_leader_john_connor, 'является матерью будущего лидера Джона Коннора').
attribute_translation(is_married, 'женат/замужем').
attribute_translation(has_dragons, 'имеет драконов').
attribute_translation(is_called_mother_of_dragons, 'называется Матерью драконов').
attribute_translation(has_talking_pets, 'имеет говорящих питомцев').
attribute_translation(has_a_pet_snail_named_gary, 'имеет домашнюю улитку по имени Гэри').
attribute_translation(has_a_pet_cockroach, 'имеет домашнего таракана').
attribute_translation(has_a_dog_pet_named_toto, 'имеет домашнюю собаку по имени Тотошка').
attribute_translation(has_a_dog_pet_named_einstein, 'имеет домашнюю собаку по имени Эйнштейн').
attribute_translation(has_an_owl_pet_named_hedwig, 'имеет домашнюю сову по имени Букля').
attribute_translation(has_a_direwolf_pet_named_ghost, 'имеет домашнего лютоволка по имени Призрак').
attribute_translation(has_a_pet_rat_named_larska, 'имеет домашнюю крысу по имени Лариска').
attribute_translation(is_a_pet, 'является домашним животным').
attribute_translation(belongs_to_mickey_mouse, 'принадлежит Микки Маусу').
attribute_translation(owns_a_cat_named_garfield, 'владеет котом по имени Гарфилд').
attribute_translation(owns_a_dog_named_odie, 'владеет собакой по имени Оди').
attribute_translation(owns_a_cow, 'владеет коровой').
attribute_translation(has_a_monkey_friend_named_boots, 'имеет друга-обезьянку по имени Башмачок').
attribute_translation(has_a_jaguar_companion, 'имеет компаньона-ягуара').
attribute_translation(has_a_bear_friend_named_medved, 'имеет друга-медведя по имени Медведь').
attribute_translation(has_a_small_pig_friend_named_pyatachok, 'имеет маленького друга-поросенка по имени Пятачок').
attribute_translation(is_friend_of_a_boy_named_malysh, 'является другом мальчика по имени Малыш').
attribute_translation(is_friend_of_cheburashka, 'является другом Чебурашки').
attribute_translation(is_friend_of_a_crocodile_named_gena, 'является другом крокодила по имени Гена').
attribute_translation(is_friend_and_companion_of_frodo, 'является другом и спутником Фродо').
attribute_translation(is_best_friend_of_lightning_mcqueen, 'является лучшим другом Молнии МакКуина').
attribute_translation(is_friend_of_rocket, 'является другом Ракеты').
attribute_translation(is_friend_of_groot, 'является другом Грута').
attribute_translation(is_friend_of_ikking, 'является другом Иккинга').
attribute_translation(is_friend_of_a_scientist_named_doc_brown, 'является другом ученого по имени Док Браун').
attribute_translation(is_friend_of_marty_mcfly, 'является другом Марти МакФлая').
attribute_translation(is_friend_of_harry_potter, 'является другом Гарри Поттера').
attribute_translation(has_a_best_friend_named_barney, 'имеет лучшего друга по имени Барни').
attribute_translation(has_a_dog_as_best_friend_named_scooby, 'имеет лучшего друга-собаку по имени Скуби').
attribute_translation(travels_with_a_friend_named_lloyd, 'путешествует с другом по имени Ллойд').
attribute_translation(travels_with_a_friend_named_harry, 'путешествует с другом по имени Гарри').
attribute_translation(is_partnered_with_an_older_detective_named_somerset, 'является напарником пожилого детектива по имени Сомерсет').
attribute_translation(is_partnered_with_a_younger_detective_named_mills, 'является напарником молодого детектива по имени Миллс').
attribute_translation(is_partner_of_walter_white, 'является партнером Уолтера Уайта').
attribute_translation(is_a_team, 'является частью команды').
attribute_translation(is_part_of_a_small_commando_team, 'является частью небольшой команды коммандос').
attribute_translation(is_part_of_a_fellowship, 'является частью братства/сообщества').
attribute_translation(is_part_of_avengers_team, 'является частью команды Мстителей').
attribute_translation(is_part_of_guardians_of_the_galaxy, 'является частью Стражей Галактики').
attribute_translation(wears_red_shorts, 'носит красные шорты').
attribute_translation(wears_white_gloves, 'носит белые перчатки').
attribute_translation(wears_animal_skin_clothing, 'носит одежду из шкуры животного').
attribute_translation(wears_square_pants, 'носит квадратные штаны').
attribute_translation(wears_a_bow_tie, 'носит галстук-бабочку').
attribute_translation(wears_a_green_shirt, 'носит зеленую рубашку').
attribute_translation(wears_a_red_shirt, 'носит красную рубашку').
attribute_translation(wears_a_sailor_shirt, 'носит матросскую рубашку').
attribute_translation(wears_a_hat, 'носит шляпу').
attribute_translation(wears_a_top_hat_and_spats, 'носит цилиндр и гетры').
attribute_translation(wears_a_flight_helmet, 'носит летный шлем').
attribute_translation(wears_blue_mask, 'носит синюю маску').
attribute_translation(wears_orange_mask, 'носит оранжевую маску').
attribute_translation(wears_a_vest, 'носит жилет').
attribute_translation(wears_pants_or_shorts, 'носит брюки или шорты').
attribute_translation(wears_a_tunic_and_bast_shoes, 'носит косоворотку и лапти').
attribute_translation(wears_red_boots, 'носит красные сапоги').
attribute_translation(wears_glasses, 'носит очки').
attribute_translation(wears_a_scout_uniform, 'носит форму скаута').
attribute_translation(wears_black_armor_and_helmet, 'носит черные доспехи и шлем').
attribute_translation(wears_distinctive_hair_buns, 'носит характерные прически-бублики').
attribute_translation(wears_a_fedora_hat, 'носит шляпу-федору').
attribute_translation(wears_dark_clothing, 'носит темную одежду').
attribute_translation(wears_a_black_trench_coat, 'носит черный плащ').
attribute_translation(wears_a_trench_coat_and_sunglasses, 'носит плащ и темные очки').
attribute_translation(wears_black_leather_clothing, 'носит черную кожаную одежду').
attribute_translation(wears_purple_suit, 'носит фиолетовый костюм').
attribute_translation(wears_a_bat_themed_costume, 'носит костюм в стиле летучей мыши').
attribute_translation(wears_a_suit_and_sunglasses, 'носит костюм и темные очки').
attribute_translation(wears_a_top_hat, 'носит цилиндр').
attribute_translation(wears_red_dress, 'носит красное платье').
attribute_translation(wears_grey_or_white_robes, 'носит серые или белые одежды').
attribute_translation(wears_a_suit, 'носит костюм').
attribute_translation(wears_a_cap, 'носит кепку').
attribute_translation(wears_a_red_and_blue_suit, 'носит красно-синий костюм').
attribute_translation(wears_a_red_cloak, 'носит красный плащ').
attribute_translation(wears_dreadlocks_and_hat, 'носит дреды и шляпу').
attribute_translation(is_overweight, 'имеет избыточный вес').
attribute_translation(is_balding, 'лысеющий').
attribute_translation(has_a_lisp, 'шепелявит').
attribute_translation(is_grey_and_white, 'серый с белым').
attribute_translation(is_black, 'черный').
attribute_translation(is_brown_and_black, 'коричневый с черным').
attribute_translation(is_yellow, 'желтый').
attribute_translation(is_orange_with_black_stripes, 'оранжевый с черными полосами').
attribute_translation(is_orange, 'оранжевый').
attribute_translation(is_purple, 'фиолетовый').
attribute_translation(is_brown, 'коричневый').
attribute_translation(is_pink, 'розовый').
attribute_translation(is_pale_with_dark_hair, 'бледный с темными волосами').
attribute_translation(is_green, 'зеленый').
attribute_translation(is_grey, 'серый').
attribute_translation(is_black_and_white, 'черно-белый').
attribute_translation(is_black_dragon, 'является черным драконом').
attribute_translation(has_white_skin_and_green_hair, 'имеет белую кожу и зеленые волосы').
attribute_translation(has_red_hair, 'имеет рыжие волосы').
attribute_translation(has_silver_hair, 'имеет серебряные волосы').
attribute_translation(has_curly_red_hair, 'имеет вьющиеся рыжие волосы').
attribute_translation(has_a_beard, 'имеет бороду').
attribute_translation(has_a_moustache, 'имеет усы').
attribute_translation(has_big_forearms, 'имеет большие предплечья').
attribute_translation(has_one_eye_closed_or_squinting, 'один глаз закрыт или прищурен').
attribute_translation(has_red_crest, 'имеет красный хохолок').
attribute_translation(has_floppy_ears, 'имеет висячие уши').
attribute_translation(has_a_long_tongue, 'имеет длинный язык').
attribute_translation(has_big_ears, 'имеет большие уши').
attribute_translation(has_a_mane, 'имеет гриву').
attribute_translation(has_black_and_white_stripes, 'имеет черно-белые полосы').
attribute_translation(has_a_long_neck, 'имеет длинную шею').
attribute_translation(has_a_tail_for_bouncing, 'имеет хвост для прыжков').
attribute_translation(has_horns, 'имеет рога').
attribute_translation(has_a_distinctive_hairstyle, 'имеет характерную прическу').
attribute_translation(is_a_global_icon, 'является мировой иконой').
attribute_translation(is_an_early_disney_character, 'является одним из первых персонажей Диснея').
attribute_translation(says_doh, 'говорит "Д`оу!"').
attribute_translation(appears_in_sitcom, 'появляется в ситкоме').
attribute_translation(works_at_power_plant, 'работает на атомной электростанции').
attribute_translation(works_at_restaurant, 'работает в ресторане').
attribute_translation(works_as_fry_cook, 'работает поваром').
attribute_translation(works_at_quarry, 'работает в карьере').
attribute_translation(works_in_a_noodle_shop_at_first, 'сначала работает в лапшичной').
attribute_translation(works_at_a_zoo_at_first, 'сначала работает в зоопарке').
attribute_translation(works_at_a_zoo, 'работает в зоопарке').
attribute_translation(works_for_scrooge_mcduck, 'работает на Скруджа Макдака').
attribute_translation(works_in_advertising, 'работает в рекламном бизнесе').
attribute_translation(works_at_princeton_plainsboro_teaching_hospital, 'работает в учебной больнице Принстон-Плейнсборо').
attribute_translation(works_at_a_paper_company, 'работает в бумажной компании').
attribute_translation(goes_to_school, 'ходит в школу').
attribute_translation(is_an_explorer, 'является исследователем').
attribute_translation(rescues_animals, 'спасает животных').
attribute_translation(solves_mysteries, 'раскрывает тайны').
attribute_translation(travels_in_a_van_called_mystery_machine, 'путешествует на фургоне под названием "Машина тайн"').
attribute_translation(gets_lost_in_fog, 'теряется в тумане').
attribute_translation(searches_for_a_bear, 'ищет медведя').
attribute_translation(carries_a_bundle, 'несет узелок').
attribute_translation(runs_away_from_home, 'сбегает из дома').
attribute_translation(lives_in_a_village, 'живет в деревне').
attribute_translation(imitates_human_speech, 'подражает человеческой речи').
attribute_translation(cleans_up_trash, 'убирает мусор').
attribute_translation(travels_through_time, 'путешествует во времени').
attribute_translation(uses_a_delorean_to_time_travel, 'использует Делореан для путешествий во времени').
attribute_translation(tells_his_life_story_on_a_bench, 'рассказывает историю своей жизни на скамейке').
attribute_translation(runs_up_famous_steps, 'забегает по известным ступеням').
attribute_translation(fights_terrorists_alone_in_a_building, 'один сражается с террористами в здании').
attribute_translation(seeks_ancient_artifacts, 'ищет древние артефакты').
attribute_translation(volunteers_for_a_deadly_competition_the_hunger_games, 'добровольно участвует в смертельном соревновании "Голодные игры"').
attribute_translation(competes_in_a_deadly_competition_the_hunger_games, 'участвует в смертельном соревновании "Голодные игры"').
attribute_translation(hunts_to_feed_her_family, 'охотится, чтобы прокормить семью').
attribute_translation(goes_on_a_factory_tour, 'идет на экскурсию по фабрике').
attribute_translation(travels_to_a_magical_land_oz, 'путешествует в волшебную страну Оз').
attribute_translation(follows_a_yellow_brick_road, 'идет по дороге из желтого кирпича').
attribute_translation(becomes_a_drug_dealer, 'становится наркоторговцем').
attribute_translation(cooks_meth, 'варит метамфетамин').
attribute_translation(investigates_serial_murders, 'расследует серийные убийства').
attribute_translation(turns_himself_in, 'сам сдается полиции').
attribute_translation(serves_on_the_night_watch, 'служит в Ночном дозоре').
attribute_translation(fights_against_the_dead, 'сражается против мертвых').
attribute_translation(attends_high_school, 'учится в старшей школе').
attribute_translation(runs_a_detective_agency, 'руководит детективным агентством').
attribute_translation(rides_a_mini_bike, 'ездит на мини-байке').
attribute_translation(rides_a_horse_named_angus, 'ездит на лошади по имени Ангус').
attribute_translation(rides_a_motorcycle_in_chase, 'участвует в погоне на мотоцикле').
attribute_translation(rides_a_green_tiger_named_battle_cat, 'ездит на зеленом тигре по имени Боевой Кот').
attribute_translation(fights_famous_opponents, 'сражается с известными противниками').
attribute_translation(drives_fast_cars, 'водит быстрые машины').
attribute_translation(is_a_farm_boy_at_first, 'сначала является фермерским мальчиком').
attribute_translation(is_a_baker_s_son, 'является сыном пекаря').
attribute_translation(is_initially_an_antagonist, 'изначально является антагонистом').
attribute_translation(says_i_ll_be_back, 'говорит "Я вернусь"').
attribute_translation(is_loyal, 'преданный').
attribute_translation(is_sarcastic, 'саркастичный').
attribute_translation(uses_magic_wand, 'использует волшебную палочку').
attribute_translation(uses_the_dark_side_of_the_force, 'использует Темную сторону Силы').
attribute_translation(uses_the_force, 'использует Силу').
attribute_translation(uses_a_lightsaber, 'использует световой меч').
attribute_translation(fears_snakes, 'боится змей').
attribute_translation(is_methodical, 'методичный').
attribute_translation(is_very_intelligent, 'очень умный').
attribute_translation(is_a_companion_to_sherlock_holmes, 'является компаньоном Шерлока Холмса').
attribute_translation(solves_medical_mysteries, 'раскрывает медицинские тайны').
attribute_translation(is_socially_awkward, 'социально неловкий').
attribute_translation(says_thats_what_she_said, 'говорит "Это то, что она сказала"').
attribute_translation(is_a_leader, 'является лидером').
attribute_translation(is_a_strategist, 'является стратегом').
attribute_translation(thinks_he_is_important, 'считает себя важным').
attribute_translation(loves_to_dance, 'любит танцевать').
attribute_translation(has_a_servant_named_maurice, 'имеет слугу по имени Морис').
attribute_translation(is_a_hypochondriac, 'ипохондрик').
attribute_translation(has_a_long_neck, 'имеет длинную шею').
attribute_translation(is_large_in_size, 'крупного размера').
attribute_translation(is_connected_to_the_ocean, 'связан с океаном').
attribute_translation(goes_on_a_voyage, 'отправляется в плавание').
attribute_translation(has_a_rooster_pet_named_heihei, 'имеет петуха по имени Хейхей').
attribute_translation(learns_kung_fu, 'учится кунг-фу').
attribute_translation(is_the_dragon_warrior, 'является Воином Дракона').
attribute_translation(is_covered_in_magical_tattoos, 'покрыт магическими татуировками').
attribute_translation(uses_a_shield, 'использует щит').
attribute_translation(is_a_billionaire, 'является миллиардером').
attribute_translation(uses_gadgets, 'использует гаджеты').
attribute_translation(wears_a_bat_themed_costume, 'носит костюм в стиле летучей мыши').
attribute_translation(lives_in_gotham_city, 'живет в Готэме').
attribute_translation(wears_a_top_hat, 'носит цилиндр').
attribute_translation(is_a_pet_detective, 'является детективом по животным').
attribute_translation(has_a_distinctive_hairstyle, 'имеет характерную прическу').
attribute_translation(lives_in_a_simulated_reality_the_matrix, 'живет в симулированной реальности (Матрица)').
attribute_translation(wears_a_trench_coat_and_sunglasses, 'носит плащ и темные очки').
attribute_translation(wears_black_leather_clothing, 'носит черную кожаную одежду').
attribute_translation(rides_a_motorcycle_in_chase, 'участвует в погоне на мотоцикле').
attribute_translation(is_rightful_king_of_gondor, 'является законным королем Гондора').
attribute_translation(carries_a_powerful_ring_the_one_ring, 'носит могущественное кольцо (Единое кольцо)').
attribute_translation(argues_with_legolas, 'спорит с Леголасом').
attribute_translation(is_very_strong, 'очень сильный').
attribute_translation(is_friend_of_groot, 'является другом Грута').
attribute_translation(is_friend_of_ikking, 'является другом Иккинга').
attribute_translation(was_a_surgeon, 'был хирургом').
attribute_translation(is_a_leader_of_guardians_of_the_galaxy, 'является лидером Стражей Галактики').
attribute_translation(loves_old_music, 'любит старую музыку').
attribute_translation(has_a_scar_on_his_face, 'имеет шрам на лице').
attribute_translation(says_hello_my_name_is_inigo_montoya, 'говорит "Привет, меня зовут Иниго Монтойя"').
attribute_translation(travels_to_a_magical_land_oz, 'путешествует в волшебную страну Оз').
attribute_translation(has_a_dog_pet_named_toto, 'имеет домашнюю собаку по имени Тотошка').
attribute_translation(follows_a_yellow_brick_road, 'идет по дороге из желтого кирпича').
attribute_translation(wears_ruby_slippers, 'носит рубиновые туфельки').
attribute_translation(is_made_of_straw, 'сделан из соломы').
attribute_translation(wants_a_brain, 'хочет мозг').
attribute_translation(travels_with_dorothy, 'путешествует с Дороти').
attribute_translation(is_made_of_tin, 'сделан из жести').
attribute_translation(wants_a_heart, 'хочет сердце').
attribute_translation(is_a_lion, 'является львом').
attribute_translation(wants_courage, 'хочет смелость').
attribute_translation(is_a_chemistry_teacher_at_first, 'сначала является учителем химии').
attribute_translation(is_known_as_heisenberg, 'известен как Хайзенберг').
attribute_translation(shaves_his_head, 'бреет голову').
attribute_translation(says_bitch_a_lot, 'часто говорит "Сука"').
attribute_translation(uses_slang, 'использует сленг').
attribute_translation(is_younger_than_his_partner, 'моложе своего напарника').
attribute_translation(works_in_advertising, 'работает в рекламном бизнесе').
attribute_translation(has_a_secret_past, 'имеет тайное прошлое').
attribute_translation(is_good_at_creating_slogans, 'хорошо придумывает слоганы').
attribute_translation(smokes_and_drinks_a_lot, 'много курит и пьет').
attribute_translation(has_multiple_affairs, 'имеет множественные романы').
attribute_translation(is_a_mafia_boss, 'является боссом мафии').
attribute_translation(has_panic_attacks, 'страдает от панических атак').
attribute_translation(sees_a_therapist_dr_melfi, 'посещает терапевта (доктор Мелфи)').
attribute_translation(lives_in_new_jersey, 'живет в Нью-Джерси').
attribute_translation(has_problems_balancing_family_and_crime, 'испытывает проблемы с совмещением семьи и криминала').
attribute_translation(uses_deduction, 'использует дедукцию').
attribute_translation(has_a_doctor_as_a_companion_named_watson, 'имеет компаньона-доктора по имени Ватсон').
attribute_translation(plays_the_violin, 'играет на скрипке').
attribute_translation(writes_about_adventures, 'пишет о приключениях').
attribute_translation(was_injured_in_afghanistan, 'был ранен в Афганистане').
attribute_translation(seeks_the_iron_throne, 'претендует на Железный трон').
attribute_translation(walks_into_fire, 'входит в огонь').
attribute_translation(is_a_bastard_son, 'является бастардом').
attribute_translation(is_from_the_north, 'с Севера').
attribute_translation(returns_from_death, 'возвращается из мертвых').
attribute_translation(is_a_dwarf_in_size, 'невысокого роста (карлик)').
attribute_translation(drinks_a_lot, 'много пьет').
attribute_translation(is_from_a_wealthy_and_powerful_family_lannister, 'из богатой и влиятельной семьи (Ланнистеры)').
attribute_translation(fights_vampires, 'сражается с вампирами').
attribute_translation(is_called_the_slayer, 'называется Истребительницей').
attribute_translation(lives_in_sunnydale_california, 'живет в Саннидейле, Калифорния').
attribute_translation(is_a_vampire, 'является вампиром').
attribute_translation(has_a_soul, 'имеет душу').
attribute_translation(is_in_love_with_buffy_summers, 'влюблен в Баффи Саммерс').
attribute_translation(lives_in_los_angeles, 'живет в Лос-Анджелесе').
attribute_translation(tries_to_be_funny, 'пытается шутить').
attribute_translation(is_a_beet_farmer, 'является фермером свеклы').
attribute_translation(aspires_to_be_manager, 'стремится стать менеджером').
attribute_translation(is_assistant_to_the_regional_manager, 'является помощником регионального менеджера').

% ... (Добавьте сюда остальные ваши переводы) ...
% --- Конец переводов атрибутов на русский ---

% --- Определение упорядоченного списка атрибутов ---
% Этот список используется для определения порядка вопросов.
% Вы можете изменить порядок или добавить/удалить атрибуты по своему усмотрению.
ordered_attributes([
    animated, live_action,
    male, female, child, adult, elder,
    human, non_human,
    is_a_robot, is_a_superhero, is_a_villain, is_a_princess, is_a_doctor, is_a_detective, is_a_spy, is_a_pirate, is_a_scientist, is_a_boxer, is_a_teacher, is_a_manager_of_a_paper_company, is_a_salesman,
    from_the_simpsons, from_nickelodeon, from_disney, from_looney_tunes, from_hanna_barbera, from_tom_and_jerry, from_ducktales, from_transformers, from_he_man_and_the_masters_of_the_universe, from_garfield, from_comic_strip, from_the_pink_panther_films, from_arthur, from_go_diego_go, from_peppa_pig, from_russia, from_ussr, from_philosophical_cartoon, from_pixar, from_dreamworks, from_madagascar, from_how_to_train_your_dragon, from_harry_potter, from_star_wars, from_indiana_jones, from_the_terminator_franchise, from_back_to_the_future, from_forrest_gump, from_rocky_franchise, from_die_hard_franchise, from_pirates_of_the_caribbean, from_the_hunger_games, from_ace_ventura_franchise, from_the_matrix_franchise, from_the_princess_bride, from_the_wizard_of_oz, from_breaking_bad, from_mad_men, from_the_sopranos, from_sherlock_holmes_stories, from_game_of_thrones, from_buffy_the_vampire_slayer, from_buffyverse, from_the_office_us,
    lives_in_springfield, lives_under_sea, lives_in_bikini_bottom, lives_in_stone_age, lives_in_bedrock, lives_in_hundred_acre_wood, lives_in_a_house, lives_on_planet_eternia, lives_with_human_owner_named_jon_arbuckle, lives_near_a_forest, lives_in_a_forest_house, lives_on_the_roof, lives_in_a_village, lives_in_a_city_apartment, lives_on_earth_alone, lives_in_a_swamp, lives_in_a_zoo_at_first, lives_on_an_island, lives_in_radiator_springs, lives_in_new_york_city, lives_at_221b_baker_street, lives_in_new_jersey, lives_in_gotham_city, lives_in_los_angeles, lives_in_sunnydale_california, lives_with_parents, lives_with_garfield,
    is_a_father, is_married_to_marge, is_a_girlfriend, has_a_girlfriend_named_minnie, is_the_girlfriend_of_popeye, has_a_son_named_max, has_nephews_named_huey_dewey_louie, is_a_mother_of_future_leader_john_connor, is_married, has_dragons, is_called_mother_of_dragons, has_talking_pets, has_a_pet_snail_named_gary, has_a_pet_cockroach, has_a_dog_pet_named_toto, has_a_dog_pet_named_einstein, has_an_owl_pet_named_hedwig, has_a_direwolf_pet_named_ghost, has_a_pet_rat_named_larska, is_a_pet, belongs_to_mickey_mouse, owns_a_cat_named_garfield, owns_a_dog_named_odie, owns_a_cow, has_a_monkey_friend_named_boots, has_a_jaguar_companion, has_a_bear_friend_named_medved, has_a_small_pig_friend_named_pyatachok, is_friend_of_a_boy_named_malysh, is_friend_of_cheburashka, is_friend_of_a_crocodile_named_gena, is_friend_and_companion_of_frodo, is_best_friend_of_lightning_mcqueen, is_friend_of_rocket, is_friend_of_groot, is_friend_of_ikking, is_friend_of_a_scientist_named_doc_brown, is_friend_of_marty_mcfly, is_friend_of_harry_potter, has_a_best_friend_named_barney, has_a_dog_as_best_friend_named_scooby, travels_with_a_friend_named_lloyd, travels_with_a_friend_named_harry, is_partnered_with_an_older_detective_named_somerset, is_partnered_with_a_younger_detective_named_mills, is_partner_of_walter_white, is_a_team, is_part_of_a_small_commando_team, is_part_of_a_fellowship, is_part_of_avengers_team, is_part_of_guardians_of_the_galaxy,
    has_super_strength, can_transform, speaks_to_snakes, uses_magic_wand, uses_the_dark_side_of_the_force, uses_the_force, uses_a_lightsaber, uses_a_blaster, can_shoot_webs, can_climb_walls, has_a_spider_sense, is_a_sorcerer, was_a_surgeon, uses_magic_from_hands, has_eye_of_agamotto, is_a_space_traveler, is_a_leader_of_guardians_of_the_galaxy, loves_old_music, uses_blasters, carries_a_walkman, is_a_tree_like_creature, can_only_say_i_am_groot, can_regenerate, is_a_raccoon, is_genetically_engineered, is_a_skilled_marksman, is_a_master_of_explosives, is_in_love_with_a_farm_boy_named_westley, is_captured_by_villains, is_beautiful, is_also_known_as_dread_pirate_roberts, says_as_you_wish, is_skilled_swordsman, wears_a_black_mask, rescues_a_princess_named_buttercup, is_a_swordsman, seeks_revenge, says_hello_my_name_is_inigo_montoya, seeks_a_six_fingered_man, is_from_kansas, wears_ruby_slippers, is_made_of_straw, wants_a_brain, travels_with_dorothy, is_flexible, is_made_of_tin, wants_a_heart, rusts_easily, is_a_lion, wants_courage, is_king_of_the_forest_but_afraid, is_a_chemistry_teacher_at_first, is_diagnosed_with_cancer, is_known_as_heisenberg, shaves_his_head, says_bitch_a_lot, uses_slang, is_younger_than_his_partner, works_in_advertising, has_a_secret_past, is_good_at_creating_slogans, smokes_and_drinks_a_lot, has_multiple_affairs, is_a_mafia_boss, has_panic_attacks, sees_a_therapist_dr_melfi, lives_in_new_jersey, has_problems_balancing_family_and_crime, solves_medical_mysteries, uses_a_cane, is_cynical_or_misanthropic, is_addicted_to_painkillers_vicodin, works_at_princeton_plainsboro_teaching_hospital, uses_deduction, lives_at_221b_baker_street, has_a_doctor_as_a_companion_named_watson, is_very_intelligent, plays_the_violin, is_a_companion_to_sherlock_holmes, writes_about_adventures, was_injured_in_afghanistan, seeks_the_iron_throne, walks_into_fire, serves_on_the_night_watch, is_a_bastard_son, fights_against_the_dead, has_a_direwolf_pet_named_ghost, is_from_the_north, returns_from_death, is_a_dwarf_in_size, drinks_a_lot, is_from_a_wealthy_and_powerful_family_lannister, is_a_dwarf, fights_vampires, attends_high_school, is_called_the_slayer, lives_in_sunnydale_california, is_a_vampire, has_a_soul, is_in_love_with_buffy_summers, lives_in_los_angeles, runs_a_detective_agency, is_a_manager_of_a_paper_company, is_socially_awkward, tries_to_be_funny, from_the_office_us, says_thats_what_she_said, works_at_a_paper_company, is_a_salesman, is_a_beet_farmer, aspires_to_be_manager, is_assistant_to_the_regional_manager,
    wears_red_shorts, wears_white_gloves, wears_animal_skin_clothing, wears_square_pants, wears_a_bow_tie, wears_a_green_shirt, wears_a_red_shirt, wears_a_sailor_shirt, wears_a_hat, wears_a_top_hat_and_spats, wears_a_flight_helmet, wears_blue_mask, wears_orange_mask, wears_a_vest, wears_pants_or_shorts, wears_a_tunic_and_bast_shoes, wears_red_boots, wears_glasses, wears_a_scout_uniform, wears_black_armor_and_helmet, wears_distinctive_hair_buns, wears_a_fedora_hat, wears_dark_clothing, wears_a_black_trench_coat, wears_a_trench_coat_and_sunglasses, wears_black_leather_clothing, wears_purple_suit, wears_a_bat_themed_costume, wears_a_suit_and_sunglasses, wears_a_top_hat, wears_red_dress, wears_grey_or_white_robes, wears_a_suit, wears_a_cap, wears_a_red_and_blue_suit, wears_a_red_cloak, wears_dreadlocks_and_hat,
    is_overweight, is_balding, has_a_lisp, is_grey_and_white, is_black, is_brown_and_black, is_yellow, is_orange_with_black_stripes, is_orange, is_purple, is_brown, is_pink, is_pale_with_dark_hair, is_green, is_grey, is_black_and_white, is_black_dragon, has_white_skin_and_green_hair, has_red_hair, has_silver_hair, has_curly_red_hair, has_a_beard, has_a_moustache, has_big_forearms, has_one_eye_closed_or_squinting, has_red_crest, has_floppy_ears, has_a_long_tongue, has_big_ears, has_a_mane, has_black_and_white_stripes, has_a_long_neck, has_a_tail_for_bouncing, has_horns, has_a_distinctive_hairstyle, has_a_scar_on_forehead, has_a_chipped_tooth, his_face_is_initially_hidden, has_a_scar_on_his_face,
    is_a_sponge, is_a_mouse, is_a_rabbit, is_a_duck, is_a_dog, is_a_cat, is_a_bear, is_a_tiger, is_a_pilot, is_a_ninja_turtle, is_a_lemur, is_a_penguin, is_a_panda, is_a_red_panda, is_an_aardvark, is_a_monkey, is_a_pig, is_a_hedgehog, is_a_wolf, is_a_parrot, is_a_house_spirit, is_an_ogre, is_a_donkey, is_a_lion, is_a_zebra, is_a_giraffe, is_a_hippo, is_a_dwarf,
    outsmarts_enemies, eats_carrots, says_whats_up_doc, is_greedy_or_selfish, says_yabba_dabba_doo, speaks_broken_english, often_chases_another_character, is_enemy_of_a_mouse_named_jerry, is_enemy_of_a_cat_named_tom, often_outsmarts_a_bigger_character, loves_honey, loves_to_bounce, is_energetic, has_a_temper, is_clumsy, says_gawrsh, is_often_unlucky, is_clumsy_pilot, uses_katanas, is_the_leader_of_the_team, lives_in_sewers, eats_pizza, is_the_most_disciplined, uses_nunchucks, is_the_jokester_of_the_team, loves_pizza_very_much, says_cowabunga, uses_surfer_slang, fights_for_good, is_an_autobot, fights_for_evil, is_a_decepticon, enemy_of_optimus_prime, transforms_into_a_truck, transforms_into_a_gun, says_i_have_the_power, has_a_secret_identity_as_prince_adam, enemy_of_he_man, seeks_power, uses_a_magic_sword, uses_magic_staff, is_lazy, loves_lasagna, hates_mondays, has_a_dog_companion_named_odie, lives_with_human_owner_named_jon_arbuckle, is_owned_by_jon_arbuckle, is_awkward, is_a_cartoonist, is_a_bird, is_a_woodpecker, has_a_distinctive_laugh, is_a_trickster, wears_gloves, is_a_sailor, gains_strength_from_eating_spinach, has_a_girlfriend_named_olive_oyl, smokes_a_pipe, is_very_thin, is_often_in_distress, is_enemy_of_popeye, is_physically_strong, is_a_bully, is_a_panther, is_mostly_silent, accompanied_by_jazzy_music, is_incompetent_detective, causes_chaos, speaks_with_a_french_accent, is_an_aardvark, has_a_younger_sister_named_dw, asks_questions_to_viewer, speaks_some_spanish, carries_a_backpack, is_a_monkey, is_a_companion_to_dora_the_explorer, is_cousin_of_dora, speaks_spanish, is_a_pig, loves_jumping_in_muddy_puddles, has_a_younger_brother_named_george, has_british_accent, loves_dinosaurs, is_younger_brother_of_peppa, says_dinosaur, is_very_active_or_mischievous, lives_near_a_forest, has_a_bear_friend_named_medved, lives_in_a_forest_house, is_retired_circus_performer, takes_care_of_a_girl_named_masha, does_not_speak_human_language_much, is_a_hedgehog, gets_lost_in_fog, searches_for_a_bear, carries_a_bundle, from_philosophical_cartoon, is_very_kind, has_mouse_enemies, says_guys_lets_live_together_friendly, is_naive, sings_songs, has_a_small_pig_friend_named_pyatachok, is_cowardly, is_friend_of_vinni_puh_soviet, is_small, lives_on_the_roof, has_a_propeller_on_his_back, is_selfish_or_boastful, loves_jam_and_sweets, is_friend_of_a_boy_named_malysh, wishes_for_a_dog, lives_with_parents, is_friend_of_karlson, runs_away_from_home, lives_in_a_village, has_talking_pets, is_economical_or_practical, owns_a_cow, wears_a_vest, has_a_moustache, is_a_wolf, chases_a_rabbit_named_zayac, is_a_hooligan, says_nu_pogodi, is_chased_by_a_wolf_named_volk, is_resourceful, wears_pants_or_shorts, has_big_ears, is_friend_of_cheburashka, is_friend_of_a_crocodile_named_gena, works_at_a_zoo_at_first, works_at_a_zoo, falls_out_of_orange_box, is_a_crocodile, plays_accordion, is_lonely, wears_a_suit, carries_a_purse, wears_a_large_hat, likes_to_do_mischief, is_a_parrot, is_blue_and_yellow, lives_in_a_city_apartment, is_a_house_spirit, wears_a_tunic_and_bast_shoes, lives_on_earth_alone, cleans_up_trash, from_pixar, has_a_pet_cockroach, from_dreamworks, from_madagascar, has_a_mane, wants_to_be_wild, has_black_and_white_stripes, is_brown_and_yellow, is_confident, is_grey, from_how_to_train_your_dragon, is_black_dragon, cannot_fly_alone, rebels_against_tradition, uses_a_bow, wants_to_be_an_explorer, is_married_to_carl_fredricksen, does_not_appear_for_most_of_movie, is_a_widower, is_a_retired_balloon_salesman, has_a_dog_friend_who_talks_named_dug, is_a_car, is_a_race_car, is_red, has_a_best_friend_who_is_a_tow_truck_named_mater, is_a_tow_truck, is_rusty, loves_to_go_tractor_tipping, is_the_main_protagonist, is_known_as_the_boy_who_lived, has_an_owl_pet_named_hedwig, is_very_smart, is_muggle_born, comes_from_a_large_wizarding_family, is_afraid_of_spiders, is_father_of_luk_skaywalker_and_leya_organa, breathes_loudly, was_a_jedi, discovers_he_has_a_twin_sister_leya, fights_against_the_empire, destroys_death_star, is_a_smuggler, owns_a_famous_spaceship_millennium_falcon, has_a_wookiee_friend_named_chewbacca, flies_kessel_run_in_less_than_12_parsecs, is_a_leader_of_the_rebellion, has_twin_brother_luk_skywalker, is_captured_by_darth_vader, is_an_archaeologist, uses_a_whip, is_also_a_professor, is_from_the_future, has_a_metal_skeleton_under_skin, protects_john_connor, has_red_eyes, becomes_a_strong_warrior, is_a_waitress_at_first, is_paranoid, plays_guitar, is_afraid_of_being_called_chicken, skateboards, invents_a_time_machine, has_wild_white_hair, often_says_great_scott, has_a_dog_pet_named_einstein, is_simple_minded_but_successful, is_good_at_running, loves_shrimp, meets_several_famous_people, says_life_is_like_a_box_of_chocolates, is_from_philadelphia, is_an_underdog, is_left_handed, is_a_police_officer, is_often_barefoot_and_bloody, from_new_york_city, is_eccentric_or_quirky, uses_a_compass_that_points_to_what_he_wants_most, starts_a_rebellion, is_from_district_12, can_camouflage, is_in_love_with_katniss, is_a_powerful_magic_user, is_initially_a_villain, from_sleeping_beauty_or_maleficent_film, curses_a_baby_princess, talks_in_a_funny_way, loves_animals, says_all_righty_then, is_known_as_the_one, can_manipulate_physics_in_the_matrix, is_a_computer_programmer_at_first, learns_kung_fu_instantly, is_a_leader_of_rebels_zion, believes_in_neo, offers_a_choice_of_pills, is_skilled_in_martial_arts, is_captain_of_the_nebuchadnezzar, is_a_skilled_hacker, is_in_love_with_neo, rides_a_motorcycle_in_chase, is_a_ranger_at_first, uses_a_sword_named_anduril, is_in_love_with_an_elf_named_arwen, is_over_80_years_old, is_old, uses_a_staff, guides_the_protagonist_frodo, fights_a_balrog_in_moria, lives_in_the_shire, travels_to_mount_doom, has_hairy_feet, is_a_gardener, is_very_loyal, kills_shelob, is_from_gondor, wants_to_use_the_ring, dies_heroically, is_an_elf, has_blonde_hair, is_prince_of_mirkwood, is_son_of_gloin, is_enemy_of_batman, does_not_have_superpowers, has_a_secret_identity_as_bruce_wayne, operates_at_night, is_a_butler, works_for_bruce_wayne, helps_batman, lives_in_wayne_manor, is_british, is_a_father_figure, works_for_british_secret_service, travels_the_world, is_known_as_007, likes_martinis_shaken_not_stirred, is_a_program, can_copy_himself, enemy_of_neo, wants_to_escape_the_matrix, owns_a_chocolate_factory, is_eccentric, offers_a_tour, has_small_workers_called_oompa_loompas, is_poor, finds_a_golden_ticket, is_good_hearted, lives_with_his_grandparents, inherits_the_factory, has_scissors_for_hands, was_created_by_an_inventor, is_gentle_despite_appearance, lives_in_a_castle_at_first, can_create_ice_sculptures, is_not_very_intelligent, wears_distinctive_orange_tuxedo, owns_a_dog_van, is_new_to_the_city, is_impetuous, is_about_to_retire, is_wise, is_a_serial_killer, murders_based_on_seven_deadly_sins, is_methodical_and_intelligent, is_indestructible, grows_in_size, wears_a_powered_suit, is_an_inventor_named_tony_stark, is_sarcastic_or_witty, has_an_arc_reactor, is_a_super_soldier, is_from_the_1940s, is_honorable, is_a_god, controls_lightning, has_a_brother_named_loki, is_a_master_of_martial_arts, wears_black_suit, has_hairy_feet
]).


% Поиск персонажа по атрибутам
guess_once(Attributes, Character) :-
    findall(C, (
        has_attribute(C, _),
        forall(member(A, Attributes), has_attribute(C, A))
    ), Candidates),
    sort(Candidates, Sorted),
    ( Sorted = [Character] ->
        true
    ; Sorted = [] ->
        Character = not_found
    ; Character = too_many
    ).


% Правило для определения персонажа
% guesses(List_of_Attributes, Possible_Characters)

% Base case 1: Only one possible character left
guesses(_, [Character]) :-
    format('Ваш персонаж - это ~w! Я угадал? (да/нет)~n', [Character]),
    read(Guess_Answer),
    (   Guess_Answer == да
    ->  write('Ура! Я молодец!'), nl
    ;   write('Жаль, но я старался.'), nl
    ),
    !. % Отсекаем альтернативы, так как персонаж угадан или пользователь ответил "нет" на финальное предположение.

% Base case 2: No more attributes to ask, but multiple characters remain
guesses([], Possible_Characters) :-
    write('Я не уверен. У меня закончились подходящие вопросы.'), nl,
    write('Возможно, вы загадали одного из этих персонажей: '), write(Possible_Characters), nl,
    write('Или у меня недостаточно информации/атрибутов для точного определения.'), nl,
    !. % Отсекаем альтернативы, так как вопросы закончились.

% Recursive step: Ask about an attribute if it helps differentiate
guesses([Attribute | Rest_Attributes], Possible_Characters) :-
    % Проверяем, помогает ли текущий атрибут отличить персонажей среди оставшихся.
    % Атрибут полезен, если он есть хотя бы у одного из Possible_Characters И отсутствует хотя бы у одного из Possible_Characters.
    (   (member(CharWithAttr, Possible_Characters), has_attribute(CharWithAttr, Attribute),
         member(CharWithoutAttr, Possible_Characters), \+ has_attribute(CharWithoutAttr, Attribute))
    ->  % Атрибут помогает отличить, задаем вопрос
        (   attribute_translation(Attribute, Russian_Attribute)
        ->  format('Ваш персонаж ~w? (да/нет)~n', [Russian_Attribute])
        ;   % Если нет перевода, используем английский атрибут
            format('Ваш персонаж имеет атрибут "~w"? (да/нет)~n', [Attribute])
        ),
        % Читаем ответ пользователя (ожидаем атомы 'да' или 'нет')
        read(Answer),
        (   Answer == да
        ->  % Если ответ "да", фильтруем персонажей, у которых есть этот атрибут
            findall(Character, (member(Character, Possible_Characters), has_attribute(Character, Attribute)), New_Possible_Characters),
            (   New_Possible_Characters == []
            ->  % Этот случай может возникнуть, если пользователь ответил "да", но по базе знаний ни у одного из оставшихся персонажей такого атрибута нет.
                % Это противоречие. Сообщаем пользователю.
                write('Похоже, ваш ответ противоречит моей базе знаний. Ни один из оставшихся персонажей не обладает этим атрибутом.'), nl,
                 % Возвращаемся, чтобы игра могла завершиться или предложить начать заново, если это возможно.
                fail
            ;   % Продолжаем с оставшимися атрибутами и отфильтрованным списком персонажей
                guesses(Rest_Attributes, New_Possible_Characters)
            )
        ;   Answer == нет
        ->  % Если ответ "нет", фильтруем персонажей, у которых НЕТ этого атрибута
            findall(Character, (member(Character, Possible_Characters), \+ has_attribute(Character, Attribute)), New_Possible_Characters),
            (   New_Possible_Characters == []
            ->  % Аналогично, противоречие, если пользователь ответил "нет", но у всех оставшихся персонажей такой атрибут есть.
                write('Похоже, ваш ответ противоречит моей базе знаний. Все оставшиеся персонажи обладают этим атрибутом.'), nl,
                % Возвращаемся
                fail
            ;   % Продолжаем с оставшимися атрибутами и отфильтрованным списком персонажей
                guesses(Rest_Attributes, New_Possible_Characters)
            )
        ;   % Если ответ пользователя некорректный (не "да" и не "нет")
            write('Пожалуйста, ответьте "да" или "нет".'), nl,
            % Повторяем вопрос с тем же атрибутом и тем же списком персонажей
            guesses([Attribute | Rest_Attributes], Possible_Characters)
        )
    ;   % Если атрибут НЕ помогает отличить персонажей среди оставшихся (т.е. либо у всех он есть, либо ни у кого нет)
        % Пропускаем этот атрибут и переходим к следующему
        guesses(Rest_Attributes, Possible_Characters)
    ).


% Точка входа в игру
start_game :-
    % Получаем упорядоченный список атрибутов для вопросов
    (   ordered_attributes(All_Attributes)
    ->  true % Список атрибутов определен
    ;   write('Ошибка: Список упорядоченных атрибутов (ordered_attributes/1) не определен.'), nl,
        write('Пожалуйста, добавьте факт ordered_attributes([...]).'), nl,
        fail % Прерываем игру из-за ошибки
    ),

    % Находим всех уникальных персонажей в базе знаний
    findall(Character, has_attribute(Character, _), All_Characters_With_Duplicates),
    sort(All_Characters_With_Duplicates, All_Characters),

    (   All_Characters == []
    ->  write('Ошибка: В базе данных нет ни одного персонажа (нет фактов has_attribute/2).'), nl
    ;   % Начинаем игру с полным списком атрибутов и всеми персонажами
        write('Загадайте персонажа из моей базы данных.'), nl,
        write('Пожалуйста, отвечайте "да" или "нет".'), nl,
        guesses(All_Attributes, All_Characters)
    ).

:- initialization(main).


main :-
    current_prolog_flag(argv, Argv),
    ( Argv = [Input],
      atom_to_term(Input, guess_once(Attrs, Result), _),
      ( guess_once(Attrs, Result) -> format('~w', [Result]) ; write('not_found') ),
      halt
    ; write('invalid'), halt(1)
    ).

% Чтобы запустить игру, выполните в консоли Prolog: ?- start_game.