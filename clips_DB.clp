
(deftemplate ioproxy ; шаблон факта-посредника для обмена информацией с GUI
	(slot message (default none))
)

(deffacts proxy-fact ; экземпляр факта ioproxy
	(ioproxy
		(message none)
	)
)

(defrule clear-message
	(declare (salience 90))
	?sendmessage <- (sendmessagehalt ?msg)
	?clear-msg-flg <- (clearmessage)
	=>
	(retract ?sendmessage)
	(retract ?clear-msg-flg)
)

(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (message ?msg))
	=>
	(modify ?proxy (message ?new-msg))
	(retract ?current-message)
	(halt)
)

;=======================================================
(deftemplate album ; Шаблон альбома
	(slot name (default none)) ; Имя 
)

(deftemplate ganre ; Шаблон жанра
	(slot name (default none)) ; Имя 
)

(deftemplate song ; Шаблон песни
	(slot name (default none)) ; Имя 
)

(deftemplate singer ; Шаблон исполнителя
	(slot name (default none)) ; Имя 
)

(deftemplate year ; Шаблон года
	(slot name (default none)) ; Имя 
)

;=============================================
(deffacts albums
    (album (name Insomniac))
    (album (name American_idiot))
    (album (name Signs_of_life))
    (album (name Meteora))
    (album (name One_hot_minute))
    (album (name Californication))
    (album (name These_days))
    (album (name Crush))
    (album (name Have_a_nice_day))
    (album (name Curb))
    (album (name The_state))
    (album (name Silver_side_up))
    (album (name Fallen))
    (album (name 30_seconds_to_mars))
    (album (name A_beautiful_lie))
    (album (name Three_days_grace))
    (album (name Smash))
    (album (name Americana))
    (album (name Conspiracy))
    (album (name Splinter))
    (album (name System_of_a_down))
    (album (name Toxicity))
    (album (name I_brought_you_my_bullets,_you_brought_me_your_love))
    (album (name Three_cheers_for_sweet_revenge))
    (album (name Ночь_короче_дня))
    (album (name Крещение_огнем))
    (album (name Химера))
    (album (name Пепел))
    (album (name Нервы))
    (album (name Звуки_на_заре))
    (album (name На_заре))
    (album (name Жень-шень))
    (album (name Стекло))
    (album (name Египтянин))
    (album (name Чужой))
    (album (name Трибьют))
    (album (name Skillet))
    (album (name That's_what_people_do))
    (album (name Атлантида))
    (album (name Herzeleid))
    (album (name Sehnsucht))
    (album (name Король_и_шут))
    (album (name Акустический_альбом))
    (album (name Любовь))
    (album (name Мир_номер_ноль))
    (album (name Ballbreaker))
    (album (name By_the_way))
)

;=============================================
(deffacts ganres
    (ganre (name Альтернативный_рок))
    (ganre (name Русский_рок))
    (ganre (name Инди-рок))
    (ganre (name Hard_rock))
)

;=============================================
(deffacts songs
    (song (name I_can))
    (song (name Gasoline))
    (song (name Hey_you,_i_love_your_soul))
    (song (name Geek_stink_breath))
    (song (name Walking_contradiction))
    (song (name Nice_guys_finish_last))
    (song (name Warped))
    (song (name Aeroplane))
    (song (name Around_the_world))
    (song (name Lie_to_me))
    (song (name Hey_god))
    (song (name These_days))
    (song (name Leader_of_man))
    (song (name Window_shopper))
    (song (name Little_friend))
    (song (name Pretty_fly_[for_a_white_guy]))
    (song (name Gonna_get_way))
    (song (name All_i_want))
    (song (name Sugar))
    (song (name Spiders))
    (song (name Suite-Pee))
    (song (name Отшельник))
    (song (name Ангельская_пыль))
    (song (name Король_дороги))
    (song (name Звуки_на_заре))
    (song (name Смерти_нет))
    (song (name Вальс))
    (song (name Немое_кино))
    (song (name Лицо))
    (song (name Еще_один_дождь))
    (song (name Butterfly_mindedness))
    (song (name Brother_john))
    (song (name Sweet_unknown))
    (song (name Крылья))
    (song (name Абсолютное_белое))
    (song (name Бегущая_вдаль))
    (song (name Alter_mann))
    (song (name Seeman))
    (song (name Wollt_ihr_das_bett_in_flammen_sehen))
    (song (name Лесник))
    (song (name Ели_мясо_мужики))
    (song (name Кукла_колдуна))
    (song (name Полная_луна))
    (song (name Апокалипсис))
    (song (name Он))
    (song (name Hard_as_a_rock))
    (song (name The_furor))
    (song (name Love_bomb))
    (song (name American_idiot))
    (song (name Boulevard_of_broken_dreams))
    (song (name Wake_me_up_when_september_ends))
    (song (name Late_goodbye))
    (song (name Lift))
    (song (name Sleep))
    (song (name Numb))
    (song (name From_the_inside))
    (song (name Easier_to_run))
    (song (name By_the_way))
    (song (name Can’t_stop))
    (song (name Universally_speaking))
    (song (name Have_a_nice_day))
    (song (name It’s_my_life))
    (song (name One_wild_night))
    (song (name How_you_remind_me))
    (song (name Never_again))
    (song (name Leader_of_men))
    (song (name Bring_me_to_life))
    (song (name My_immortal))
    (song (name Taking_over_me))
    (song (name Fallen))
    (song (name Attack))
    (song (name From_yesterday))
    (song (name Take_me_under))
    (song (name Just_like_you))
    (song (name Home))
    (song (name Living_in_chaos))
    (song (name All_along))
    (song (name Lightning_rod))
    (song (name Toxicity))
    (song (name Chop_suey!))
    (song (name Prison_song))
    (song (name Honey,_this_mirror_isn’t_big_enough_for_the_two_of_us))
    (song (name To_the_end))
    (song (name Thank_you_for_the_venom))
    (song (name Крещение_огнем))
    (song (name Небо_тебя_найдёт))
    (song (name Осколок_льда))
    (song (name Прощай_и_прости))
    (song (name Один))
    (song (name Весна))
    (song (name На_заре))
    (song (name Второе_рождение))
    (song (name Ни_твоё,_ни_моё))
    (song (name Осень))
    (song (name Я_невидим))
    (song (name Зверь))
)

;=============================================
(deffacts singers
    (singer (name Skillet))
    (singer (name Green_day))
    (singer (name Red_hot_chili_peppers))
    (singer (name Bon_jovi))
    (singer (name Nickelback))
    (singer (name The_offspring))
    (singer (name System_of_a_down))
    (singer (name Thousand_foot_Krutch))
    (singer (name Rammstein))
    (singer (name Nautilus_pompilius))
    (singer (name Ария))
    (singer (name Альянс))
    (singer (name Пикник))
    (singer (name Король_и_шут))
    (singer (name ДДТ))
    (singer (name AC/DC))
    (singer (name Poets_of_the_fall))
    (singer (name Linkin_park))
    (singer (name Evanescence))
    (singer (name 30_seconds_to_mars))
    (singer (name Three_days_grace))
    (singer (name My_chemical_romance))
    (singer (name Черный_обелиск))
    (singer (name Coldplay))
)

;=============================================
(deffacts years
    (year (name 1995))
    (year (name 1996))
    (year (name 1997))
    (year (name 1998))
    (year (name 1999))
    (year (name 2000))
    (year (name 2001))
    (year (name 2002))
    (year (name 2003))
    (year (name 2004))
    (year (name 2005))
)

;=============================================
(defrule find-song0
	(declare (salience 60))
	(album (name Insomniac))
	=>
	( assert (song (name Geek_stink_breath)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Geek_stink_breath"))))

(defrule find-song1
	(declare (salience 60))
	(album (name Insomniac))
	=>
	( assert (song (name Walking_contradiction)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Walking_contradiction"))))

(defrule find-song2
	(declare (salience 60))
	(album (name Insomniac))
	=>
	( assert (song (name Nice_guys_finish_last)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Nice_guys_finish_last"))))

(defrule find-song3
	(declare (salience 60))
	(album (name American_idiot))
	=>
	( assert (song (name American_idiot)))
  ( assert ( sendmessagehalt (str-cat "[Finish]American_idiot"))))

(defrule find-song4
	(declare (salience 60))
	(album (name American_idiot))
	=>
	( assert (song (name Boulevard_of_broken_dreams)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Boulevard_of_broken_dreams"))))

(defrule find-song5
	(declare (salience 60))
	(album (name American_idiot))
	=>
	( assert (song (name Wake_me_up_when_september_ends)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Wake_me_up_when_september_ends"))))

(defrule find-song6
	(declare (salience 60))
	(album (name Signs_of_life))
	=>
	( assert (song (name Late_goodbye)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Late_goodbye"))))

(defrule find-song7
	(declare (salience 60))
	(album (name Signs_of_life))
	=>
	( assert (song (name Lift)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Lift"))))

(defrule find-song8
	(declare (salience 60))
	(album (name Signs_of_life))
	=>
	( assert (song (name Sleep)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Sleep"))))

(defrule find-song9
	(declare (salience 60))
	(album (name Meteora))
	=>
	( assert (song (name Numb)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Numb"))))

(defrule find-song10
	(declare (salience 60))
	(album (name Meteora))
	=>
	( assert (song (name From_the_inside)))
  ( assert ( sendmessagehalt (str-cat "[Finish]From_the_inside"))))

(defrule find-song11
	(declare (salience 60))
	(album (name One_hot_minute))
	=>
	( assert (song (name Warped)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Warped"))))

(defrule find-song12
	(declare (salience 60))
	(album (name One_hot_minute))
	=>
	( assert (song (name Aeroplane)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Aeroplane"))))

(defrule find-song13
	(declare (salience 60))
	(album (name Californication))
	=>
	( assert (song (name Around_the_world)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Around_the_world"))))

(defrule find-song14
	(declare (salience 60))
	(album (name By_the_way))
	=>
	( assert (song (name By_the_way)))
  ( assert ( sendmessagehalt (str-cat "[Finish]By_the_way"))))

(defrule find-song15
	(declare (salience 60))
	(album (name By_the_way))
	=>
	( assert (song (name Can’t_stop)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Can’t_stop"))))

(defrule find-song16
	(declare (salience 60))
	(album (name By_the_way))
	=>
	( assert (song (name Universally_speaking)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Universally_speaking"))))

(defrule find-song17
	(declare (salience 60))
	(album (name These_days))
	=>
	( assert (song (name Lie_to_me)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Lie_to_me"))))

(defrule find-song18
	(declare (salience 60))
	(album (name These_days))
	=>
	( assert (song (name Hey_god)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Hey_god"))))

(defrule find-song19
	(declare (salience 60))
	(album (name These_days))
	=>
	( assert (song (name These_days)))
  ( assert ( sendmessagehalt (str-cat "[Finish]These_days"))))

(defrule find-song20
	(declare (salience 60))
	(album (name Have_a_nice_day))
	=>
	( assert (song (name Have_a_nice_day)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Have_a_nice_day"))))

(defrule find-song21
	(declare (salience 60))
	(album (name Crush))
	=>
	( assert (song (name It’s_my_life)))
  ( assert ( sendmessagehalt (str-cat "[Finish]It's_my_life"))))

(defrule find-song22
	(declare (salience 60))
	(album (name Crush))
	=>
	( assert (song (name One_wild_night)))
  ( assert ( sendmessagehalt (str-cat "[Finish]One_wild_night"))))

(defrule find-song23
	(declare (salience 60))
	(album (name Curb))
	=>
	( assert (song (name Leader_of_man)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Leader_of_man"))))

(defrule find-song24
	(declare (salience 60))
	(album (name Curb))
	=>
	( assert (song (name Window_shopper)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Window_shopper"))))

(defrule find-song25
	(declare (salience 60))
	(album (name Curb))
	=>
	( assert (song (name Little_friend)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Little_friend"))))

(defrule find-song26
	(declare (salience 60))
	(album (name Silver_side_up))
	=>
	( assert (song (name How_you_remind_me)))
  ( assert ( sendmessagehalt (str-cat "[Finish]How_you_remind_me"))))

(defrule find-song27
	(declare (salience 60))
	(album (name Silver_side_up))
	=>
	( assert (song (name Never_again)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Never_again"))))

(defrule find-song28
	(declare (salience 60))
	(album (name The_state))
	=>
	( assert (song (name Leader_of_men)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Leader_of_men"))))

(defrule find-song29
	(declare (salience 60))
	(album (name Fallen))
	=>
	( assert (song (name Bring_me_to_life)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Bring_me_to_life"))))

(defrule find-song30
	(declare (salience 60))
	(album (name Fallen))
	=>
	( assert (song (name My_immortal)))
  ( assert ( sendmessagehalt (str-cat "[Finish]My_immortal"))))

(defrule find-song31
	(declare (salience 60))
	(album (name Fallen))
	=>
	( assert (song (name Taking_over_me)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Taking_over_me"))))

(defrule find-song32
	(declare (salience 60))
	(album (name 30_seconds_to_mars))
	=>
	( assert (song (name Fallen)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Fallen"))))

(defrule find-song33
	(declare (salience 60))
	(album (name A_beautiful_lie))
	=>
	( assert (song (name Attack)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Attack"))))

(defrule find-song34
	(declare (salience 60))
	(album (name A_beautiful_lie))
	=>
	( assert (song (name From_yesterday)))
  ( assert ( sendmessagehalt (str-cat "[Finish]From_yesterday"))))

(defrule find-song35
	(declare (salience 60))
	(album (name Three_days_grace))
	=>
	( assert (song (name Take_me_under)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Take_me_under"))))

(defrule find-song36
	(declare (salience 60))
	(album (name Three_days_grace))
	=>
	( assert (song (name Just_like_you)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Just_like_you"))))

(defrule find-song37
	(declare (salience 60))
	(album (name Three_days_grace))
	=>
	( assert (song (name Home)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Home"))))

(defrule find-song38
	(declare (salience 60))
	(album (name Americana))
	=>
	( assert (song (name Pretty_fly_[for_a_white_guy])))
  ( assert ( sendmessagehalt (str-cat "[Finish]Pretty_fly_[for_a_white_guy]"))))

(defrule find-song39
	(declare (salience 60))
	(album (name Smash))
	=>
	( assert (song (name Gonna_get_way)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Gonna_get_way"))))

(defrule find-song40
	(declare (salience 60))
	(album (name Americana))
	=>
	( assert (song (name All_i_want)))
  ( assert ( sendmessagehalt (str-cat "[Finish]All_i_want"))))

(defrule find-song41
	(declare (salience 60))
	(album (name Conspiracy))
	=>
	( assert (song (name Living_in_chaos)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Living_in_chaos"))))

(defrule find-song42
	(declare (salience 60))
	(album (name Conspiracy))
	=>
	( assert (song (name All_along)))
  ( assert ( sendmessagehalt (str-cat "[Finish]All_along"))))

(defrule find-song43
	(declare (salience 60))
	(album (name Splinter))
	=>
	( assert (song (name Lightning_rod)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Lightning_rod"))))

(defrule find-song44
	(declare (salience 60))
	(album (name System_of_a_down))
	=>
	( assert (song (name Sugar)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Sugar"))))

(defrule find-song45
	(declare (salience 60))
	(album (name System_of_a_down))
	=>
	( assert (song (name Spiders)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Spiders"))))

(defrule find-song46
	(declare (salience 60))
	(album (name System_of_a_down))
	=>
	( assert (song (name Suite-Pee)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Suite-Pee"))))

(defrule find-song47
	(declare (salience 60))
	(album (name Toxicity))
	=>
	( assert (song (name Toxicity)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Toxicity"))))

(defrule find-song48
	(declare (salience 60))
	(album (name Toxicity))
	=>
	( assert (song (name Chop_suey!)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Chop_suey"))))

(defrule find-song49
	(declare (salience 60))
	(album (name Toxicity))
	=>
	( assert (song (name Prison_song)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Prison_song"))))

(defrule find-song50
	(declare (salience 60))
	(album (name I_brought_you_my_bullets,_you_brought_me_your_love))
	=>
	( assert (song (name Honey,_this_mirror_isn’t_big_enough_for_the_two_of_us)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Honey,_this_mirror_isn’t_big_enough_for_the_two_of_us"))))

(defrule find-song51
	(declare (salience 60))
	(album (name Three_cheers_for_sweet_revenge))
	=>
	( assert (song (name To_the_end)))
  ( assert ( sendmessagehalt (str-cat "[Finish]To_the_end"))))

(defrule find-song52
	(declare (salience 60))
	(album (name Three_cheers_for_sweet_revenge))
	=>
	( assert (song (name Thank_you_for_the_venom)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Thank_you_for_the_venom"))))

(defrule find-song53
	(declare (salience 60))
	(album (name Ночь_короче_дня))
	=>
	( assert (song (name Зверь)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Зверь"))))

(defrule find-song54
	(declare (salience 60))
	(album (name Ночь_короче_дня))
	=>
	( assert (song (name Ангельская_пыль)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Ангельская_пыль"))))

(defrule find-song55
	(declare (salience 60))
	(album (name Ночь_короче_дня))
	=>
	( assert (song (name Король_дороги)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Король_дороги"))))

(defrule find-song56
	(declare (salience 60))
	(album (name Химера))
	=>
	( assert (song (name Крещение_огнем)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Крещение_огнем"))))

(defrule find-song57
	(declare (salience 60))
	(album (name Крещение_огнем))
	=>
	( assert (song (name Небо_тебя_найдёт)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Небо_тебя_найдёт"))))

(defrule find-song58
	(declare (salience 60))
	(album (name Пепел))
	=>
	( assert (song (name Прощай_и_прости)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Прощай_и_прости"))))

(defrule find-song59
	(declare (salience 60))
	(album (name Пепел))
	=>
	( assert (song (name Один)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Один"))))

(defrule find-song60
	(declare (salience 60))
	(album (name Нервы))
	=>
	( assert (song (name Весна)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Весна"))))

(defrule find-song61
	(declare (salience 60))
	(album (name Звуки_на_заре))
	=>
	( assert (song (name Звуки_на_заре)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Звуки_на_заре"))))

(defrule find-song62
	(declare (salience 60))
	(album (name Звуки_на_заре))
	=>
	( assert (song (name Смерти_нет)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Смерти_нет"))))

(defrule find-song63
	(declare (salience 60))
	(album (name Звуки_на_заре))
	=>
	( assert (song (name Вальс)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Вальс"))))

(defrule find-song64
	(declare (salience 60))
	(album (name На_заре))
	=>
	( assert (song (name На_заре)))
  ( assert ( sendmessagehalt (str-cat "[Finish]На_заре"))))

(defrule find-song65
	(declare (salience 60))
	(album (name На_заре))
	=>
	( assert (song (name Второе_рождение)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Второе_рождение"))))

(defrule find-song66
	(declare (salience 60))
	(album (name Жень-шень))
	=>
	( assert (song (name Немое_кино)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Немое_кино"))))

(defrule find-song67
	(declare (salience 60))
	(album (name Стекло))
	=>
	( assert (song (name Лицо)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Лицо"))))

(defrule find-song68
	(declare (salience 60))
	(album (name Стекло))
	=>
	( assert (song (name Еще_один_дождь)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Еще_один_дождь"))))

(defrule find-song69
	(declare (salience 60))
	(album (name Египтянин))
	=>
	( assert (song (name Ни_твоё,_ни_моё)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Ни_твоё,_ни_моё"))))

(defrule find-song70
	(declare (salience 60))
	(album (name Чужой))
	=>
	( assert (song (name Осень)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Осень"))))

(defrule find-song71
	(declare (salience 60))
	(album (name Трибьют))
	=>
	( assert (song (name Я_невидим)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Я_невидим"))))

(defrule find-song72
	(declare (salience 60))
	(album (name Skillet))
	=>
	( assert (song (name I_can)))
  ( assert ( sendmessagehalt (str-cat "[Finish]I_can"))))

(defrule find-song73
	(declare (salience 60))
	(album (name Skillet))
	=>
	( assert (song (name Gasoline)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Gasoline"))))

(defrule find-song74
	(declare (salience 60))
	(album (name Skillet))
	=>
	( assert (song (name Hey_you,_i_love_your_soul)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Hey_you,_i_love_your_soul"))))

(defrule find-song75
	(declare (salience 60))
	(album (name That's_what_people_do))
	=>
	( assert (song (name Butterfly_mindedness)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Butterfly_mindedness"))))

(defrule find-song76
	(declare (salience 60))
	(album (name That's_what_people_do))
	=>
	( assert (song (name Brother_john)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Brother_john"))))

(defrule find-song77
	(declare (salience 60))
	(album (name That's_what_people_do))
	=>
	( assert (song (name Sweet_unknown)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Sweet_unknown"))))

(defrule find-song78
	(declare (salience 60))
	(album (name Атлантида))
	=>
	( assert (song (name Крылья)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Крылья"))))

(defrule find-song79
	(declare (salience 60))
	(album (name Атлантида))
	=>
	( assert (song (name Абсолютное_белое)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Абсолютное_белое"))))

(defrule find-song80
	(declare (salience 60))
	(album (name Атлантида))
	=>
	( assert (song (name Бегущая_вдаль)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Бегущая_вдаль"))))

(defrule find-song81
	(declare (salience 60))
	(album (name Sehnsucht))
	=>
	( assert (song (name Alter_mann)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Alter_mann"))))

(defrule find-song82
	(declare (salience 60))
	(album (name Herzeleid))
	=>
	( assert (song (name Seeman)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Seeman"))))

(defrule find-song83
	(declare (salience 60))
	(album (name Herzeleid))
	=>
	( assert (song (name Wollt_ihr_das_bett_in_flammen_sehen)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Wollt_ihr_das_bett_in_flammen_sehen"))))

(defrule find-song84
	(declare (salience 60))
	(album (name Король_и_шут))
	=>
	( assert (song (name Лесник)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Лесник"))))

(defrule find-song85
	(declare (salience 60))
	(album (name Акустический_альбом))
	=>
	( assert (song (name Ели_мясо_мужики)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Ели_мясо_мужики"))))

(defrule find-song86
	(declare (salience 60))
	(album (name Король_и_шут))
	=>
	( assert (song (name Кукла_колдуна)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Кукла_колдуна"))))

(defrule find-song87
	(declare (salience 60))
	(album (name Любовь))
	=>
	( assert (song (name Полная_луна)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Полная_луна"))))

(defrule find-song88
	(declare (salience 60))
	(album (name Любовь))
	=>
	( assert (song (name Апокалипсис)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Апокалипсис"))))

(defrule find-song89
	(declare (salience 60))
	(album (name Мир_номер_ноль))
	=>
	( assert (song (name Он)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Он"))))

(defrule find-song90
	(declare (salience 60))
	(album (name Ballbreaker))
	=>
	( assert (song (name Hard_as_a_rock)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Hard_as_a_rock"))))

(defrule find-song91
	(declare (salience 60))
	(album (name Ballbreaker))
	=>
	( assert (song (name The_furor)))
  ( assert ( sendmessagehalt (str-cat "[Finish]The_furor"))))

(defrule find-song92
	(declare (salience 60))
	(album (name Ballbreaker))
	=>
	( assert (song (name Love_bomb)))
  ( assert ( sendmessagehalt (str-cat "[Finish]Love_bomb"))))
;=============================================
;=============================================
(defrule find-album0
	(declare (salience 50))
	(singer (name Green_day))
	(year (name 1995))
	=>
	( assert (album (name Insomniac)))
  ( assert ( sendmessagehalt (str-cat "[Service]Insomniac)))
  )

(defrule find-album1
	(declare (salience 50))
	(singer (name Green_day))
	(year (name 2004))
	=>
	( assert (album (name American_idiot)))
  ( assert ( sendmessagehalt (str-cat "[Service]American_idiot"))))

(defrule find-album2
	(declare (salience 50))
	(singer (name Poets_of_the_fall))
	(year (name 2005))
	=>
	( assert (album (name Signs_of_life)))
  ( assert ( sendmessagehalt (str-cat "[Service]Signs_of_life"))))

(defrule find-album3
	(declare (salience 50))
	(singer (name Linkin_park))
	(year (name 2003))
	=>
	( assert (album (name Meteora)))
  ( assert ( sendmessagehalt (str-cat "[Service]Meteora"))))

(defrule find-album4
	(declare (salience 50))
	(singer (name Red_hot_chili_peppers))
	(year (name 1995))
	=>
	( assert (album (name One_hot_minute)))
  ( assert ( sendmessagehalt (str-cat "[Service]One_hot_minute"))))

(defrule find-album5
	(declare (salience 50))
	(singer (name Red_hot_chili_peppers))
	(year (name 1999))
	=>
	( assert (album (name Californication)))
  ( assert ( sendmessagehalt (str-cat "[Service]Californication"))))

(defrule find-album6
	(declare (salience 50))
	(singer (name Red_hot_chili_peppers))
	(year (name 2002))
	=>
	( assert (album (name By_the_way)))
  ( assert ( sendmessagehalt (str-cat "[Service]By_the_way"))))

(defrule find-album7
	(declare (salience 50))
	(singer (name Bon_jovi))
	(year (name 1996))
	=>
	( assert (album (name These_days)))
  ( assert ( sendmessagehalt (str-cat "[Service]These_days"))))

(defrule find-album8
	(declare (salience 50))
	(singer (name Bon_jovi))
	(year (name 2000))
	=>
	( assert (album (name Crush"))))

(defrule find-album9
	(declare (salience 50))
	(singer (name Bon_jovi))
	(year (name 2005))
	=>
	( assert (album (name Have_a_nice_day)))
  ( assert ( sendmessagehalt (str-cat "[Service]Have_a_nice_day"))))

(defrule find-album10
	(declare (salience 50))
	(singer (name Nickelback))
	(year (name 1996))
	=>
	( assert (album (name Curb)))
  ( assert ( sendmessagehalt (str-cat "[Service]Curb"))))

(defrule find-album11
	(declare (salience 50))
	(singer (name Nickelback))
	(year (name 2000))
	=>
	( assert (album (name The_state)))
  ( assert ( sendmessagehalt (str-cat "[Service]The_state"))))

(defrule find-album12
	(declare (salience 50))
	(singer (name Nickelback))
	(year (name 2001))
	=>
	( assert (album (name Silver_side_up)))
  ( assert ( sendmessagehalt (str-cat "[Service]Silver_side_up"))))

(defrule find-album13
	(declare (salience 50))
	(singer (name Evanescence))
	(year (name 2002))
	=>
	( assert (album (name Fallen)))
  ( assert ( sendmessagehalt (str-cat "[Service]Fallen"))))

(defrule find-album14
	(declare (salience 50))
	(singer (name 30_seconds_to_mars))
	(year (name 2002))
	=>
	( assert (album (name 30_seconds_to_mars)))
  ( assert ( sendmessagehalt (str-cat "[Service]30_seconds_to_mars"))))

(defrule find-album15
	(declare (salience 50))
	(singer (name 30_seconds_to_mars))
	(year (name 2005))
	=>
	( assert (album (name A_beautiful_lie)))
  ( assert ( sendmessagehalt (str-cat "[Service]A_beautiful_lie"))))

(defrule find-album16
	(declare (salience 50))
	(singer (name Three_days_grace))
	(year (name 2003))
	=>
	( assert (album (name Three_days_grace)))
  ( assert ( sendmessagehalt (str-cat "[Service]Three_days_grace"))))

(defrule find-album17
	(declare (salience 50))
	(singer (name The_offspring))
	(year (name 1995))
	=>
	( assert (album (name Smash)))
  ( assert ( sendmessagehalt (str-cat "[Service]Smash"))))

(defrule find-album18
	(declare (salience 50))
	(singer (name The_offspring))
	(year (name 1998))
	=>
	( assert (album (name Americana)))
  ( assert ( sendmessagehalt (str-cat "[Service]Americana"))))

(defrule find-album19
	(declare (salience 50))
	(singer (name The_offspring))
	(year (name 2000))
	=>
	( assert (album (name Conspiracy)))
  ( assert ( sendmessagehalt (str-cat "[Service]Conspiracy"))))

(defrule find-album20
	(declare (salience 50))
	(singer (name The_offspring))
	(year (name 2003))
	=>
	( assert (album (name Splinter)))
  ( assert ( sendmessagehalt (str-cat "[Service]Splinter"))))

(defrule find-album21
	(declare (salience 50))
	(singer (name System_of_a_down))
	(year (name 1998))
	=>
	( assert (album (name System_of_a_down)))
  ( assert ( sendmessagehalt (str-cat "[Service]System_of_a_down"))))

(defrule find-album22
	(declare (salience 50))
	(singer (name System_of_a_down))
	(year (name 2002))
	=>
	( assert (album (name Toxicity)))
  ( assert ( sendmessagehalt (str-cat "[Service]Toxicity"))))

(defrule find-album23
	(declare (salience 50))
	(singer (name My_chemical_romance))
	(year (name 2002))
	=>
	( assert (album (name I_brought_you_my_bullets,_you_brought_me_your_love)))
  ( assert ( sendmessagehalt (str-cat "[Service]I_brought_you_my_bullets,_you_brought_me_your_love"))))

(defrule find-album24
	(declare (salience 50))
	(singer (name My_chemical_romance))
	(year (name 2004))
	=>
	( assert (album (name Three_cheers_for_sweet_revenge)))
  ( assert ( sendmessagehalt (str-cat "[Service]Three_cheers_for_sweet_revenge"))))

(defrule find-album25
	(declare (salience 50))
	(singer (name Ария))
	(year (name 1995))
	=>
	( assert (album (name Ночь_короче_дня)))
  ( assert ( sendmessagehalt (str-cat "[Service]Ночь_короче_дня"))))

(defrule find-album26
	(declare (salience 50))
	(singer (name Ария))
	(year (name 2003))
	=>
	( assert (album (name Крещение_огнем)))
  ( assert ( sendmessagehalt (str-cat "[Service]Крещение_огнем"))))

(defrule find-album27
	(declare (salience 50))
	(singer (name Ария))
	(year (name 2003))
	=>
	( assert (album (name Химера)))
  ( assert ( sendmessagehalt (str-cat "[Service]Химера"))))

(defrule find-album28
	(declare (salience 50))
	(singer (name Черный_Обелиск))
	(year (name 2002))
	=>
	( assert (album (name Пепел)))
  ( assert ( sendmessagehalt (str-cat "[Service]Пепел"))))

(defrule find-album29
	(declare (salience 50))
	(singer (name Черный_Обелиск))
	(year (name 2004))
	=>
	( assert (album (name Нервы)))
  ( assert ( sendmessagehalt (str-cat "[Service]Нервы"))))

(defrule find-album30
	(declare (salience 50))
	(singer (name Альянс))
	(year (name 1996))
	=>
	( assert (album (name Звуки_на_заре)))
  ( assert ( sendmessagehalt (str-cat "[Service]Звуки_на_заре"))))

(defrule find-album31
	(declare (salience 50))
	(singer (name Альянс))
	(year (name 2001))
	=>
	( assert (album (name На_заре)))
  ( assert ( sendmessagehalt (str-cat "[Service]На_заре"))))

(defrule find-album32
	(declare (salience 50))
	(singer (name Пикник))
	(year (name 1996))
	=>
	( assert (album (name Жень-шень)))
  ( assert ( sendmessagehalt (str-cat "[Service]Жень-шень"))))

(defrule find-album33
	(declare (salience 50))
	(singer (name Пикник))
	(year (name 1996))
	=>
	( assert (album (name Стекло)))
  ( assert ( sendmessagehalt (str-cat "[Service]Стекло"))))

(defrule find-album34
	(declare (salience 50))
	(singer (name Пикник))
	(year (name 2001))
	=>
	( assert (album (name Египтянин)))
  ( assert ( sendmessagehalt (str-cat "[Service]Египтянин"))))

(defrule find-album35
	(declare (salience 50))
	(singer (name Пикник))
	(year (name 2002))
	=>
	( assert (album (name Чужой)))
  ( assert ( sendmessagehalt (str-cat "[Service]Чужой"))))

(defrule find-album36
	(declare (salience 50))
	(singer (name Пикник))
	(year (name 2003))
	=>
	( assert (album (name Трибьют)))
  ( assert ( sendmessagehalt (str-cat "[Service]Трибьют"))))

(defrule find-album37
	(declare (salience 50))
	(singer (name Skillet))
	(year (name 1996))
	=>
	( assert (album (name Skillet)))
  ( assert ( sendmessagehalt (str-cat "[Service]Skillet"))))

(defrule find-album38
	(declare (salience 50))
	(singer (name Thousand_foot_Krutch))
	(year (name 1997))
	=>
	( assert (album (name That's_what_people_do)))
  ( assert ( sendmessagehalt (str-cat "[Service]That's_what_people_do"))))

(defrule find-album39
	(declare (salience 50))
	(singer (name Nautilus_pompilius))
	(year (name 1997))
	=>
	( assert (album (name Атлантида)))
  ( assert ( sendmessagehalt (str-cat "[Service]Атлантида"))))

(defrule find-album40
	(declare (salience 50))
	(singer (name Rammstein))
	(year (name 1995))
	=>
	( assert (album (name Herzeleid)))
  ( assert ( sendmessagehalt (str-cat "[Service]Herzeleid"))))

(defrule find-album41
	(declare (salience 50))
	(singer (name Rammstein))
	(year (name 1997))
	=>
	( assert (album (name Sehnsucht)))
  ( assert ( sendmessagehalt (str-cat "[Service]Sehnsucht"))))

(defrule find-album42
	(declare (salience 50))
	(singer (name Король_и_шут))
	(year (name 1997))
	=>
	( assert (album (name Король_и_шут)))
  ( assert ( sendmessagehalt (str-cat "[Service]Король_и_шут"))))

(defrule find-album43
	(declare (salience 50))
	(singer (name Король_и_шут))
	(year (name 1999))
	=>
	( assert (album (name Акустический_альбом)))
  ( assert ( sendmessagehalt (str-cat "[Service]Акустический_альбом"))))

(defrule find-album44
	(declare (salience 50))
	(singer (name ДДТ))
	(year (name 1996))
	=>
	( assert (album (name Любовь)))
  ( assert ( sendmessagehalt (str-cat "[Service]Любовь"))))

(defrule find-album45
	(declare (salience 50))
	(singer (name ДДТ))
	(year (name 1999))
	=>
	( assert (album (name Мир_номер_ноль)))
  ( assert ( sendmessagehalt (str-cat "[Service]Мир_номер_ноль"))))

(defrule find-album46
	(declare (salience 50))
	(singer (name AC/DC))
	(year (name 1995))
	=>
	( assert (album (name Ballbreaker)))
  ( assert ( sendmessagehalt (str-cat "[Service]Ballbreaker"))))
;=============================================
;=============================================
(defrule find-singer0
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Three_days_grace)))
  ( assert ( sendmessagehalt (str-cat "[Service]Three_days_grace"))))

(defrule find-singer1
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Skillet)))
  ( assert ( sendmessagehalt (str-cat "[Service]Skillet"))))

(defrule find-singer2
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Green_day)))
  ( assert ( sendmessagehalt (str-cat "[Service]Green_day"))))

(defrule find-singer3
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Evanescence)))
  ( assert ( sendmessagehalt (str-cat "[Service] Evanescence"))))

(defrule find-singer4
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Linkin_park)))
  ( assert ( sendmessagehalt (str-cat "[Service]Linkin_park"))))

(defrule find-singer5
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Red_hot_chili_peppers)))
  ( assert ( sendmessagehalt (str-cat "[Service]Red_hot_chili_peppers"))))

(defrule find-singer6
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name System_of_a_down)))
  ( assert ( sendmessagehalt (str-cat "[Service]System_of_a_down"))))

(defrule find-singer7
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name My_chemical_romance)))
  ( assert ( sendmessagehalt (str-cat "[Service]My_chemical_romance"))))

(defrule find-singer8
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Coldplay)))
  ( assert ( sendmessagehalt (str-cat "[Service]Coldplay"))))

(defrule find-singer9
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Nickelback)))
  ( assert ( sendmessagehalt (str-cat "[Service]Nickelback"))))

(defrule find-singer10
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Bon_jovi)))
  ( assert ( sendmessagehalt (str-cat "[Service]Bon_jovi"))))

(defrule find-singer11
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name The_offspring)))
  ( assert ( sendmessagehalt (str-cat "[Service]The_offspring"))))

(defrule find-singer12
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name 30_seconds_to_mars)))
  ( assert ( sendmessagehalt (str-cat "[Service]30_seconds_to_mars"))))

(defrule find-singer13
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Thousand_foot_Krutch)))
  ( assert ( sendmessagehalt (str-cat "[Service]Thousand_foot_Krutch"))))

(defrule find-singer14
	(declare (salience 20))
	(ganre (name Альтернативный_рок))
	=>
	( assert (singer (name Nautilus_pompilius)))
  ( assert ( sendmessagehalt (str-cat "[Service]Nautilus_pompilius"))))

(defrule find-singer15
	(declare (salience 20))
	(ganre (name Русский_рок))
	=>
	( assert (singer (name Ария)))
  ( assert ( sendmessagehalt (str-cat "[Service]Ария"))))

(defrule find-singer16
	(declare (salience 20))
	(ganre (name Русский_рок))
	=>
	( assert (singer (name Черный_обелиск)))
  ( assert ( sendmessagehalt (str-cat "[Service]Черный_обелиск"))))

(defrule find-singer17
	(declare (salience 20))
	(ganre (name Русский_рок))
	=>
	( assert (singer (name Альянс)))
  ( assert ( sendmessagehalt (str-cat "[Service]Альянс"))))

(defrule find-singer18
	(declare (salience 20))
	(ganre (name Русский_рок))
	=>
	( assert (singer (name Пикник)))
  ( assert ( sendmessagehalt (str-cat "[Service]Пикник"))))

(defrule find-singer19
	(declare (salience 20))
	(ganre (name Русский_рок))
	=>
	( assert (singer (name Король_и_шут)))
  ( assert ( sendmessagehalt (str-cat "[Service]Король_и_шут"))))

(defrule find-singer20
	(declare (salience 20))
	(ganre (name Русский_рок))
	=>
	( assert (singer (name ДДТ)))
  ( assert ( sendmessagehalt (str-cat "[Service]ДДТ"))))

(defrule find-singer21
	(declare (salience 20))
	(ganre (name Hard_rock))
	=>
	( assert (singer (name Nickelback)))
  ( assert ( sendmessagehalt (str-cat "[Service]Nickelback"))))

(defrule find-singer22
	(declare (salience 20))
	(ganre (name Hard_rock))
	=>
	( assert (singer (name Bon_jovi)))
  ( assert ( sendmessagehalt (str-cat "[Service]Bon_jovi"))))

(defrule find-singer23
	(declare (salience 20))
	(ganre (name Hard_rock))
	=>
	( assert (singer (name 30_seconds_to_mars)))
  ( assert ( sendmessagehalt (str-cat "[Service]30_seconds_to_mars"))))

(defrule find-singer24
	(declare (salience 20))
	(ganre (name Hard_rock))
	=>
	( assert (singer (name Черный_обелиск)))
  ( assert ( sendmessagehalt (str-cat "[Service]Черный_обелиск"))))

(defrule find-singer25
	(declare (salience 20))
	(ganre (name Hard_rock))
	=>
	( assert (singer (name Rammstein)))
  ( assert ( sendmessagehalt (str-cat "[Service]Rammstein"))))

(defrule find-singer26
	(declare (salience 20))
	(ganre (name Hard_rock))
	=>
	( assert (singer (name AC/DC)))
  ( assert ( sendmessagehalt (str-cat "[Service]AC/DC"))))

(defrule find-singer27
	(declare (salience 20))
	(ganre (name Инди-рок))
	=>
	( assert (singer (name Bon_jovi)))
  ( assert ( sendmessagehalt (str-cat "[Service]Bon_jovi"))))

(defrule find-singer28
	(declare (salience 20))
	(ganre (name Инди-рок))
	=>
	( assert (singer (name Пикник)))
  ( assert ( sendmessagehalt (str-cat "[Service]Пикник"))))

(defrule find-singer29
	(declare (salience 20))
	(ganre (name Инди-рок))
	=>
	( assert (singer (name Red_hot_chili_peppers)))
  ( assert ( sendmessagehalt (str-cat "[Service]Red_hot_chili_peppers"))))

(defrule find-singer30
	(declare (salience 20))
	(ganre (name Инди-рок))
	=>
	( assert (singer (name Coldplay)))
  ( assert ( sendmessagehalt (str-cat "[Service]Coldplay"))))

(defrule find-singer31
	(declare (salience 20))
	(ganre (name Инди-рок))
	=>
	( assert (singer (name Poets_of_the_fall)))
  ( assert ( sendmessagehalt (str-cat "[Service]Poets_of_the_fall"))))

(defrule find-singer32
	(declare (salience 20))
	(ganre (name Инди-рок))
	=>
	( assert (singer (name Nautilus_pompilius)))
  ( assert ( sendmessagehalt (str-cat "[Service]Nautilus_pompilius"))))
;=============================================
(defrule get-singer
	( declare (salience 10) )
	( ganre ( name none) )
	=>
	( assert ( sendmessagehalt "[SelectSinger]Выберите исполнителя" ) )
	(halt)
)

(defrule get-year
	( declare (salience 10) )
  ( year (name none) )
	=>
	( assert ( sendmessagehalt "[SelectYear]Выберите год песни" ) )
	(halt)
)

(defrule get-album
	( declare (salience 10) )
	( singer ( name none) )
	=>
	( assert ( sendmessagehalt "[SelectAlbum]Выберите альбом" ) )
	(halt)
)