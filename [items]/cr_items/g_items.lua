g_items = {
	[1] = { "Sosisli", "Lezzetli bir sosisli.", 1, 2215, 205, 205, 0, 0.01, weight = 0.1 },
	[2] = { "iPhone 15", "Modern ve şık bir iPhone 15.", 7, 330, 90, 90, 0, 0, weight = 0.3 },
	[3] = { "Araç Anahtarı", "Üzerinde üretici logosu bulunan bir araç anahtarı.", 2, 1581, 270, 270, 0, 0, weight = 0.1 },
	[4] = { "Ev Anahtarı", "Yeşil bir ev anahtarı.", 2, 1581, 270, 270, 0, 0, weight = 0.1 },
	[5] = { "İşyeri Anahtarı", "Mavi bir işyeri anahtarı.", 2, 1581, 270, 270, 0, 0, weight = 0.1 },
	[6] = { "Telsiz", "Siyah bir telsiz.", 7, 330, 90, 90, 0, -0.05, weight = 0.2 },
	[7] = { "Telefon Defteri", "A torn phonebook.", 5, 2824, 0, 0, 0, -0.01, weight = 2 },
	[8] = { "Sandviç", "A peynirli bir sandviç.", 1, 2355, 205, 205, 0, 0.06, weight = 0.3 },
	[9] = { "Sprunk", "Bir şişe Sprunk.", 1, 2647, 0, 0, 0, 0.12, weight = 0.2 },
	[10] = { "Zar", "A white dice with black dots on #v sides.", 4, 1271, 0, 0, 0, 0.285, weight = 0.1 },
	[11] = { "Adana Kebap", "Acılı bir porsiyon adana kebap.", 1, 2215, 205, 205, 0, 0.06, weight = 0.1 },
	[12] = { "Hamburger", "Duble boy hamburger.", 1, 2703, 265, 0, 0, 0.06, weight = 0.3 },
	[13] = { "Donut", "Şekerli ve sıcak bir donut.", 1, 2222, 0, 0, 0, 0.07, weight = 0.2 },
	[14] = { "Kurabiye", "Çikolatalı kurabiye.", 1, 2222, 0, 0, 0, 0.07, weight = 0.1 },
	[15] = { "Su", "Bir şişe mineralli su.", 1, 1484, -15, 30, 0, 0.2, weight = 1 },
	[16] = { "Kıyafet", "Bir set temiz kıyafet. ((Skin ID ##v))", 6, 2386, 0, 0, 0, 0.1, weight = 1 },
	[17] = { "Saat", "Altın kaplama bir saat.", 6, 1271, 0, 0, 0, 0.285, weight = 0.1 },
	[18] = { "City Guide", "A small city guide booklet.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[19] = { "MP3 Player", "A white, sleek looking MP3 Player. The brand reads EyePod.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 },
	[20] = { "Standart Dövüş Eğitim Kitabı", "Yeni şeyler öğrenmek için bir fırsat.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[21] = { "Kick Box Eğitim Kitabı", "Yeni şeyler öğrenmek için bir fırsat.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[22] = { "Kung Fu Eğitim Kitabı", "Yeni şeyler öğrenmek için bir fırsat.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[23] = { "Karate Eğitim Kitabı", "Yeni şeyler öğrenmek için bir fırsat.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[24] = { "Sokak Kavgası Eğitim Kitabı", "Yeni şeyler öğrenmek için bir fırsat.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[25] = { "Dirsek Hareketi Eğitim Kitabı", "Yeni şeyler öğrenmek için bir fırsat.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[26] = { "Gaz Maskesi", "Siyah gaz maskesi, gazın ve flaş patlamalarının etkilerini engeller.", 6, 2386, 0, 0, 0, 0.1, weight = 0.5 },
	[27] = { "Flashbang", "Yan tarafında FB yazan küçük bir el bombası kutusu.", 4, 343, 0, 0, 0, 0.1, weight = 0.2 },
	[28] = { "Parlak Çubuk", "Yeşil bir parlak çubuk.", 4, 343, 0, 0, 0, 0.1, weight = 0.2 },
	[29] = { "Door Ram", "Kırmızı metal bir door ram.", 4, 1587, 90, 0, 0, 0.05, weight = 3 },
	[30] = { "Cannabis Sativa", "Cannabis Sativa, when mixed can create some strong drugs.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[31] = { "Cocaine Alkaloid", "Cocaine Alkaloid, when mixed can create some strong drugs.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[32] = { "Lysergic Acid", "Lysergic Acid, when mixed can create some strong drugs.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[33] = { "Unprocessed PCP", "Unprocessed PCP, when mixed can create some strong drugs.", 3, 1279, 0, 0, 0, 0, weight = 0.1 },
	[34] = { "Kokain", "Büyük bir enerji vuruşu veren toza benzer bir madde.", 3, 1575, 0, 0, 0, 0, weight = 0.1 },
	[35] = { "Morfin", "Güçlü etkileri olan bir hap veya sıvı madde.", 3, 1578, 0, 0, 0, -0.02, weight = 0.1 },
	[36] = { "Ecstasy", "Güçlü görsellere ve coşkuya sahip haplar.", 3, 1576, 0, 0, 0, 0.07, weight = 0.1 },
	[37] = { "Heroin", "Güçlü yavaşlatıcı etkileri ve ağır öforisi olan toz benzeri veya sıvı bir madde.", 3, 1579, 0, 0, 0, 0, weight = 0.1 },
	[38] = { "Marijuana", "Yeşil, tadı güzel bir ot.", 3, 3044, 0, 0, 0, 0.04, weight = 0.1 },
	[39] = { "Metamfetamin", "Güçlü enerji tekme etkilerine sahip kristal benzeri bir madde.", 3, 1580, 0, 0, 0, 0, weight = 0.1 },
	[40] = { "Epinefrin (Adrenalin)", "Epinefrin – adrenalini artıran sıvı bir madde.", 3, 1575, 0, 0, 0, -0.02, weight = 0.1 },
	[41] = { "LSD", "Dietilamidli liserjik asit eğlenceli görseller verir.", 3, 1576, 0, 0, 0, 0, weight = 0.1 },
	[42] = { "Mantarlar", "Kuru altın öğretmen mantarları.", 3, 1577, 0, 0, 0, 0, weight = 0.1 },
	[43] = { "PCP", "Fensiklidin tozu.", 3, 1578, 0, 0, 0, 0, weight = 0.1 },
	[44] = { "Maymuncuk", "Kilit kırmaya yarayan bir çeşit alet.", 4, 1210, 90, 0, 0, 0.1, weight = 3 },
	[45] = { "Kelepçe", "Bir çift metal kelepçe.", 4, 2386, 0, 0, 0, 0.1, weight = 0.4 },
	[46] = { "Rope", "Uzun bir ip.", 4, 1271, 0, 0, 0, 0.285, weight = 0.3 },
	[47] = { "Kelepçe Anahtarı", "Bir adet kelepçe anahtarı.", 4, 2386, 0, 0, 0, 0.1, weight = 0.05 },
	[48] = { "Sırt Çantası", "Geniş bir sırt çantası.", 4, 3026, 270, 0, 0, 0, weight = 1 },
	[49] = { "Balık Oltası", "Yarı profesyönel balık olta takımı.", 4, 338, 80, 0, 0, -0.02, weight = 1.5 },
	[50] = { "Los Santos Highway Code", "The Los Santos Highway Code.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[51] = { "Chemistry 101",  "An Introduction to Useful Chemistry.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
    [147] = { "Duvar Kağıdı", "For retexturing your interior.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 }, --147
	[52] = { "Police Officer's Manual", "The Police Officer's Manual.", 5, 2824, 0, 0, 0, -0.01, weight = 0.3 },
	[53] = { "Alkol Ölçer", "Bir adet siyah alkol ölçer.", 4, 1271, 0, 0, 0, 0.285, weight = 0.2 },
	[54] = { "Ghettoblaster", "A black Ghettoblaster.", 7, 2226, 0, 0, 0, 0, weight = 3 },
	[55] = { "Business Card", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.1 }, --Steven Pullman - L.V. Freight Depot, Tel: 12555
	[56] = { "Kar Maskesi", "Bir adet kar maskesi", 1, 2386, 0, 0, 0, 0.1, weight = 0.2 },
	[57] = { "Benzin Bidonu", "Bir adet metal benzin bidonu.", 4, 1650, 0, 0, 0, 0.30, weight = 1 }, -- would prolly to make sense to make it heavier if filled
	[58] = { "Efes Pilsen Bira", "Bira bu kapağın altındadır - Efes Pilsen.", 1, 1520, 0, 0, 0, 0.15, weight = 1 },
	[59] = { "Mudkip", "So i herd u liek mudkips? mabako's Favorite.", 1, 1579, 0, 0, 0, 0, weight = 0 },
	[60] = { "Kasa", "A safe to store your items in.", 4, 2332, 0, 0, 0, 0, weight = 5 },
	[61] = { "Emergency Light Strobes", "An Emergency Light Strobe which you can put on you car.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 },
	[62] = { "İstanblue Votka", "Anlatmaya hazır mısın? - İstanblue Votka.", 1, 1512, 0, 0, 0, 0.25, weight = 1 },
	[63] = { "Jack Daniels Viski", "Asla unutmayacağınız arkadaşlarınızla geçireceğiniz asla hatırlayamayacağınız anlara.", 1, 1512, 0, 0, 0, 0.25, weight = 1 },
	[64] = { "LSPD Rozeti", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[65] = { "LSMD Rozeti", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[66] = { "Göz Bağı", "Göz bağlamak için bir bağ.", 6, 2386, 0, 0, 0, 0.1, weight = 0.1 },
	[67] = { "GPS", "((This item is currently disabled.))", 6, 1210, 270, 0, 0, 0.1, weight = 0.8 },
	[68] = { "Lottery Ticket", "A Los Santos Lottery ticket.", 6, 2894, 0, 0, 0, -0.01, weight = 0.1 },
	[69] = { "Sözlük", "Bir adet sözlük.", 5, 2824, 0, 0, 0, -0.01, weight = 1.5 },
	[70] = { "First Aid Kit", "Saves a Life. Can be used #v times.", 4, 1240, 90, 0, 0, 0.05, weight = function(v) return v/3 end },
	[73] = { "Elevator Remote", "A small remote to change an elevator's mode.", 2, 364, 0, 0, 0, 0.05, weight = 0.3 },
	[74] = { "Bomb", "What could possibly happen when you use this?", 4, 363, 270, 0, 0, 0.05, weight = 1000000 },
	[75] = { "Bomb Remote", "Has a funny red button.", 4, 364, 0, 0, 0, 0.05, weight = 100000 },
	[76] = { "Riot Shield", "A heavy riot shield.", 4, 1631, -90, 0, 0, 0.1, weight = 5 },
	[77] = { "İskambil Destesi", "A card deck to play some games.", 4,2824, 0, 0, 0, -0.01, weight = 0.1 },
	[78] = { "San Andreas Pilot Certificate", "An official permission to fly planes and helicopters.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[79] = { "Porn Tape", "A porn tape, #v", 4,2824, 0, 0, 0, -0.01, weight = 0.2 },
	[80] = { "Generic Item", "#v", 4, 1271, 0, 0, 0, 0, weight = 1 },
	[81] = { "Buzdolabı", "A fridge to store food and drinks in.", 7, 2147, 0, 0, 0, 0, weight = 0.1 --[[Just here to look pretty, but fridges ain't available to easily buy]] },
	[82] = { "Rozet", "#v.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[83] = { "Kahve", "A small cup of Coffee.", 1, 2647, 0, 0, 0, 0.12, weight = 0.25 },
	[84] = { "Escort 9500ci Radar Detector", "Detects Police within a half mile.", 7, 330, 90, 90, 0, -0.05, weight = 1 },
	[85] = { "Emergency Siren", "An emergency siren to put in your car.", 7, 330, 90, 90, 0, -0.05, weight = 0.2 },
	[86] = { "LSN Identifcation", "#v.", 10, 330, 90, 90, 0, -0.05, weight = 0.3 },
	[87] = { "Kahraman Sezon Rozeti", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[88] = { "Kulaklık", "A small earpiece, can be connected to a radio.", 7, 1581, 270, 270, 0, 0, weight = 0.15 },
	[89] = { "Yemek", "", 1, 2222, 0, 0, 0, 0.07, weight = 1 },
	[90] = { "Motocross Kaskı", "Ideal for riding bikes.", 6, 2799, 0, 0, 0, 0.2, weight = 1.5, scale = 1, hideItemValue = true },
	[91] = { "Eggnog", "Yum Yum.", 1, 2647, 0, 0, 0, 0.1, weight = 0.5 }, --91
	[92] = { "Turkey", "Yum Yum.", 1, 2222, 0, 0, 0, 0.1, weight = 3.8 },
	[93] = { "Christmas Pudding", "Yum Yum.", 1, 2222, 0, 0, 0, 0.1, weight = 0.4 },
	[94] = { "Christmas Present", "I know you want one.", 4, 1220, 0, 0, 0, 0.1, weight = 1 },
	[95] = { "İçecek", "", 1, 1484, -15, 30, 0, 0.2, weight = 1 },
	[96] = { "Macbook pro A1286 Core i7", "A top of the range Macbook to view e-mails and browse the internet.", 6, 2886, 0, 0, 180, 0.1, weight = function(v) return v == 1 and 0.2 or 1.5 end },
	[97] = { "LSFD Procedures Manual", "The Los Santos Emergency Service procedures handbook.", 5, 2824, 0, 0, 0, -0.01, weight = 0.5 },
	[98] = { "Garage Remote", "A small remote to open or close a Garage.", 2, 364, 0, 0, 0, 0.05, weight = 0.3 },
	[99] = { "Mixed Dinner Tray", "Lets play the guessing game.", 1, 2355, 205, 205, 0, 0.06, weight = 0.4 },
	[100] = { "Small Milk Carton", "Lumps included!", 1, 2856, 0, 0, 0, 0, weight = 0.2 },
	[101] = { "Small Juice Carton", "Thirsty?", 1, 2647, 0, 0, 0, 0.12, weight = 0.2 },
	[102] = { "Cabbage", "For those Vegi-Lovers.", 1, 1271, 0, 0, 0, 0.1, weight = 0.4 },
	[103] = { "Raf", "Eşya koyabilmek için büyük bir raf.", 4, 3761, -0.15, 0, 85, 1.95, weight = 0.1 --[[admins onleh]] },
	[104] = { "Taşınabilir TV", "Televizyon izleyebilmek için yanınızda taşıyabileceğiniz portatif bir araç.", 6, 1518, 0, 0, 0, 0.29, weight = 1 },
	[105] = { "Sigara Paketi", "İçerisinde #v adet sigara bulunan sigara paketi.", 6, 3044 , 270, 0, 0, 0.1, weight = function(v) return 0.1 + v*0.03 end }, -- 105
	[106] = { "Sigara", "Sigara içebileceğin bir şey.", 6, 3044 , 270, 0, 0, 0.1, weight = 0.03 }, -- 106
	[107] = { "Çakmak", "Doğru kullanırsan ateş yakıyor.", 6, 1210, 270, 0, 0, 0.1, weight = 0.05 }, -- 107
	[108] = { "Pancake", "Yummy, a pancake!.", 1, 2222, 0, 0, 0, 0.07, weight = 0.5 }, -- 108
	[109] = { "Meyve", "Sağlıklı yiyecek!.", 1, 2222, 0, 0, 0, 0.07, weight = 0.35 }, -- 109
	[110] = { "Sebze", "Sağlıklı yiyecek!.", 1, 2222, 0, 0, 0, 0.07, weight = 0.35  }, -- 110
	[111] = { "Taşınabilir GPS", "Güncel haritaların olduğu bir adet navigasyon cihazı.", 6, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 111
	[112] = { "San Andreas Highway Patrol badge", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, -- 142
	[113] = { "Pack of Glowsticks", "Pack with #v glowsticks in it, from the brand 'Friday'.", 6, 1210, 270, 0, 0, 0.1, weight = function(v) return v * 0.2 end }, -- 113
	[114] = { "Vehicle Upgrade", "#v", 4, 1271, 0, 0, 0, 0.285, weight = 1.5 }, -- 114
	[115] = { "Silah", "#v ", 8, 2886, 270, 0, 1, 0.1, 2, weight = function(v)
																		local weaponID = tonumber(explode(":", v)[1])
																		return weaponID and weaponweights[weaponID] or 1
																	end
	}, -- 115
	[116] = { "Mermi", "#v", 9, 2040, 0, 1, 0, 0.1, 3, weight = function(v) local weaponID = tonumber(explode(":", v)[1]) local ammo = tonumber(explode(":", v)[2]) return weaponID and ammo and ammoweights[weaponID] and ammoweights[weaponID] * ammo or 0.2 end }, -- 2886 / 116
	[117] = { "Rampa", "Useful for loading DFT-30s.", 4, 1210, 270, 1, 0, 0.1, 3, weight = 5 }, -- 117
	[118] = { "Toll Pass", "Aracınıza yerleştirerek gişe ücretlerini ödeyebileceğiniz bir araç.", 6, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 118
	[119] = { "Sanitary Andreas ID", "A Sanitary Andreas Identification Card.", 10, 1210, 270, 0, 0, 0.1, weight = 0.2 }, -- 119
	[120] = { "Dalış Tüpü", "Size su altında kalabileceğiniz daha fazla zaman verir.", 6, 1271, 0, 0, 0, 0.285, weight = 4 }, --120
	[121] = { "Box with supplies", "Pretty large box full with supplies!", 4, 1271, 0, 0, 0, 0.285, weight = function(v) return v * 0.07 end }, --121
	[122] = { "Açık Mavi Bandana", "Bir adet açık mavi bandana.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 122
	[123] = { "Kırmızı Bandana", "Bir adet kırmızı bandana.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 123
	[124] = { "Sarı Bandana", "Bir adet sarı bandana", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 124
	[125] = { "Mor Bandana", "Bir adet mor bandana", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 125
	[126] = { "Görev Kemeri", "Birçok tutucusu olan siyah deri görev kemeri.", 4, 2386, 270, 0, 0, 0, weight = 1 }, -- 126
	[127] = { "FAA Badge", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --127
	[128] = { "Rapid Towing", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --128 --Farid | ADD TTR FACTION BAGDE ITEM | 24.1.14
	[129] = { "Direct Imports ID", "A Direct Imports ID.", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --129
	[130] = { "Araç Alarm Sistemi", "Bir adet araç alarm sistemi.", 6, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 130
	[131] = { "LSSD Rozeti", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, -- 131
	[132] = { "Prescription Bottle", "A prescription bottle, contains prescription medicine.", 3, 1575, 0, 0, 0, 0.04, weight = 0.1 }, --132
	[133] = { "Driver's License - Automotive", "A Los Santos driving license.", 10, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Farid
	[134] = { "Amerikan Doları", "Bir miktar banknot.", 10, 1212, 0, 0, 0, 0.04, weight = 0.3 }, -- 134
	[135] = { "Mavi Bandana", "Bir adet mavi bandana.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 135
	[136] = { "Kahverengi Bandana", "Bir adet kahverengi bandana.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 136
	[137] = { "Snake Cam", "A snake cam, used in SWAT operations.", 7, 330, 90, 90, 0, -0.05, weight = 0.3 }, -- 137
	[138] = { "Bait Vehicle System", "A device used in Police operations.", 4, 1271, 0, 0, 0, 0.285, weight = 0.5 }, -- 138
	[139] = { "Araç Takip Sistemi", "Aracınızın yerini /gps komutu ile öğrenebilirsiniz.", 7, 1271, 0, 0, 0, 0.285, weight = 0.2 }, --139
	[140] = { "Orange Light Strobes", "An Orange Light Strobe which you can put on you car.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 }, --140
	[141] = { "Megafon", "A cone-shaped device used to intensify or direct your voice.", 7, 1210, 270, 0, 0, 0.1, weight = 0.1 }, --141
	[142] = { "Los Santos Cab & Bus ID", "A Los Santos Cab & Bus Identification Card.", 10, 1210, 270, 0, 0, 0.1, weight = 0.3 }, -- 142
	[143] = { "Mobile Data Terminal", "A Mobile Data Terminal.", 7, 2886, 0, 0, 180, 0.1, weight = 0.1 }, -- 143
	[144] = { "Yellow Strobe", "A yellow strobe to put on your car.", 7, 2886, 270, 0, 0, 0.1, weight = 0.1 }, -- 144
	[145] = { "El Feneri", "Lights up the environment.", 7, 1210, 0, 0, 0, 0, weight = 1 }, --145
	[146] = { "Los Santos District Court Identification Card", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[148] = { "Silah Taşıma Ruhsatı", "A firearm permit which allows a person to openly carry a firearm.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[149] = { "Silah Bulundurma Ruhsatı", "A firearm permit which allows a person to openly carry a firearm.", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[150] = { "Kredi Kartı", "A plastic card used to make transactions with a very limited amount per day from an automatic teller machine (ATM).", 10, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Farid
	[151] = { "Lift Remote", "A remote device for a vehicle lift.", 2, 364, 0, 0, 0, 0.05, weight = 0.3 },
	[152] = { "Kimlik Kartı", "Üzerinde kimlik bilgilerinizin yazdığı kimlik kartı.", 10, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Farid
	[153] = { "Driver's License - Motorbike", "A Los Santos driving license.", 10, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Farid
	[154] = { "Fishing Permit", "A Los Santos fishing permit", 10, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Farid
	[155] = { "Driver's License - Boat", "A Los Santos driving license.", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[156] = { "LAFD Rozeti", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.1 },
	[157] = { "Toolbox", "A metallic red toolbox containing various tools.", 4, 1271, 0, 0, 0, 0, weight = 0.5 },
	[158] = { "Yeşil Bandana", "Bir adet yeşil bandana.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 }, -- 158
	[159] = { "Cargo Group ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- 159 | anumaz Cargo Group ID card
	[160] = { "El Çantası", "Bir adet el çantası.", 6, 1210, 90, 0, 0, 0.1, weight = 0.4}, -- Exciter
	[161] = { "Fleming Architecture and Construction ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- 161 | anumaz Fleming Architecture and Construction ID
	[162] = { "Çelik Yelek", "Mermi geçirmeyen bir çelik yelek.", 6, 3916, 90, 0, 0, 0.1, weight = 4}, -- Exciter
	[163] = { "Spor Çantası", "Gayet geniş bir çanta.", 6, 3915, 90, 0, 0, 0.2, weight = 0.4}, -- Exciter
	[164] = { "Tıbbı Çanta", "Tıbbi araçlar içeren çanta.", 6, 3915, 0, 0, 0, 0.2, weight = 1, texture = {{":artifacts/textures/medicbag.png", "hoodyabase5"}} }, -- Exciter
	[165] = { "DVD", "A video disc.", 4, 2894, 0, 0, 0, -0.01, weight = 0.1 }, -- Exciter
	[166] = { "ClubTec VS1000", "Video System.", 4, 3388, 0, 0, 90, -0.01, weight = 5, scale = 0.6,  newPickupMethod = true }, -- Exciter
	[167] = { "Framed Picture (Golden Frame)", "Put your picture in and hang it on your wall.", 4, 2287, 0, 0, 0, 0, weight = 1, doubleSided = true, newPickupMethod = true }, -- Exciter
	[168] = { "Orange Bandana", "A orange rag.", 6, 2386, 0, 0, 0, 0.1, weight = 0.2 },
	[169] = { "Keyless Digital Door Lock", "This high-ended security system is much more secure than a traditional keyed lock because they can't be picked or bumped.", 6, 2922, 0, 0, 180, 0.2, weight = 0.5 }, --Farid
	[170] = { "Keycard", "A swipe card for #v", 2, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Exciter
	[171] = { "Biker Helmet", "Ideal for riding bikes.", 6, 3911, 0, 0, 0, 0.2, weight = 1.5, scale = 1, hideItemValue = true },
	[172] = { "Motor Kaskı", "Siyah görünümlü yeni bir kask.", 6, 3917, 0, 0, 0, 0.2, weight = 1.5, scale = 1, hideItemValue = true },
	[173] = { "Noter Satış Sözleşmesi Evrağı", "Aracınızı satmaya yarayan bir kağıt.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 }, -- Anumaz
	[174] = { "FAA Electronical Map Book", "Electronic device displaying information and maps around all San Andreas.", 4, 1271, 0, 0, 0, -0.01, weight = 0.01 }, -- Anumaz
	[175] = { "Poster", "An advertising poster.", 4, 2717, 0, 0, 0, 0.7, weight = 0.01, hideItemValue = true }, -- Exciter
	[176] = { "Hoparlör", "Büyük ses çıkaran büyük siyah hoparlör, her alanı dolduracak kadar büyük ses ve her ses seviyesinde net ses sunar.", 7, 2232, 0, 0, 0, 0.6, weight = 3 }, -- anumaz
	[177] = { "Remote Dispatch Device", "A remote dispatch device connected to Dispatch Center, powered by Tree Technology.", 7, 1581, 0, 0, 0, 0.6, weight = 0.01 }, -- anumaz
    [178] = { "Kitap", "#v", 5, 2824, 0, 0, 0, -0.1, weight = 0.1}, -- Chaos
    [179] = { "Car Motive", "A motive to decorate your car with.", 4, 2894, 0, 0, 0, -0.01, weight = 0.01 }, -- Exciter
    [180] = { "SAPT ID", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3}, -- Exciter
    [181] = { "Sarma Paketi", "Şeffaf sarma kağıtları.", 4, 3044 , 270, 0, 0, 0.1, weight = function(v) return 0.1 + v*0.03 end },
    [182] = { "Rolled Joint", "A rolled joint of pure marijuana.", 4, 1485, 270, 0, 0, 0.1, weight = 0.03 },
    [183] = { "Viozy Membership Card", "Viozy Businesses Exclusive Membership", 10, 1581, 270, 270, 0, 0, weight = 0.3 }, --  Chase
    [184] = { "HP Charcoal Window Film", "Viozy HP Charcoal Window Film ((50 /chance))", 4, 1271, 0, 0, 0, 0, weight = 0.6 }, -- Chase
    [185] = { "CXP70 Window Film", "Viozy CXP70 Window Film ((95 /chance))", 4, 1271, 0, 0, 0, 0, weight = 0.3 }, -- Chase
    [186] = { "Viozy Border Edge Cutter (Red Anodized)", "Border Edge Cutter for Tinting", 4, 1271, 0, 0, 0, 0, weight = 0.05 }, -- Chase
    [187] = { "Viozy Solar Spectrum Tranmission Meter", "Spectrum Meter for testing film before use", 7, 1271, 0, 0, 0, 0, weight = 2 }, -- Chase
    [188] = { "Viozy Tint Chek 2800", "Measures the Visible Light Transmission on any film/glass", 7, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [189] = { "Viozy Equalizer Heatwave Heat Gun", "Easy to use heat gun perfect for shrinking back windows", 7, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [190] = { "Viozy 36 Multi-Purpose Cutter Bucket", "Ideal for light cutting jobs while applying tint", 4, 1271, 0, 0, 0, 0, weight = 0.5 }, -- Chase
    [191] = { "Viozy Tint Demonstration Lamp", "Effectve presentation of tinted application", 7, 1271, 0, 0, 0, 0, weight = 0.5 }, -- Chase
    [192] = { "Viozy Triumph Angled Scraper", "6-inch Angled Scraper for applying tint", 4, 1271, 0, 0, 0, 0, weight = 0.3 }, -- Chase
    [193] = { "Viozy Performax 48oz Hand Sprayer", "Performax Hand Sprayer for tint application", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [194] = { "Viozy Vehicle Ignition - 2010 ((20 /chance))", "Vehicle Ignition made by Viozy for 2010", 4, 1271, 0, 0, 0, 0, weight = 1.5 }, -- Chase
    [195] = { "Viozy Vehicle Ignition - 2011 ((30 /chance))", "Vehicle Ignition made by Viozy for 2011", 4, 1271, 0, 0, 0, 0, weight = 1.3 }, -- Chase
    [196] = { "Viozy Vehicle Ignition - 2012 ((40 /chance))", "Vehicle Ignition made by Viozy for 2012", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase
    [197] = { "Viozy Vehicle Ignition - 2013 ((50 /chance))", "Vehicle Ignition made by Viozy for 2013", 4, 1271, 0, 0, 0, 0, weight = 0.8 }, -- Chase
    [198] = { "Viozy Vehicle Ignition - 2014 ((70 /chance))", "Vehicle Ignition made by Viozy for 2014", 4, 1271, 0, 0, 0, 0, weight = 0.6 }, -- Chase
    [199] = { "Viozy Vehicle Ignition - 2015 ((90 /chance))", "Vehicle Ignition made by Viozy for 2015", 4, 1271, 0, 0, 0, 0, weight = 0.4 }, -- Chase
    [200] = { "Viozy Vehicle Ignition - 2016", "Vehicle Ignition not yet in production", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase (not to be used)
    [201] = { "Viozy Vehicle Ignition - 2017", "Vehicle Ignition not yet in production", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase (not to be used)
    [202] = { "Viozy Vehicle Ignition - 2018", "Vehicle Ignition not yet in production", 4, 1271, 0, 0, 0, 0, weight = 1 }, -- Chase (not to be used)
    [203] = { "Viozy Hidden Vehicle Tracker 315 Pro ((Undetectable))", "GPS HVT 315 Pro, easy installation ((and undetectable)), by Viozy", 7, 1271, 0, 0, 0, 0, weight = 3 }, -- Chase
    [204] = { "Viozy Hidden Vehicle Tracker 272 Micro ((30 /chance))", "GPS HVT 272 Micro, easy installation ((30 /chance to be found)), by Viozy", 7, 1271, 0, 0, 0, 0, weight = 0.5 }, -- Chase
    [205] = { "Viozy HVT 358 Portable Spark Nano 4.0 ((50 /chance))", "GPS HVT 358 Spark Nano 4.0 Portable ((50 /chance to be found)), by Viozy", 7, 1271, 0, 0, 0, 0, weight = 0.2 }, -- Chase
	[206] = { "Wheat Seed", "A nice seed with potential", 7, 1271, 0, 0, 0, 0, weight = 0.1 }, -- Chaos
	[207] = { "Barley Seed", "A nice seed with potential", 7, 1271, 0, 0, 0, 0, weight = 0.1 }, -- Chaos
	[208] = { "Oat Seed", "A nice seed with potential", 7, 1271, 0, 0, 0, 0, weight = 0.1 }, -- Chaos
	[209] = { "FLU Device", "An eletronical device by Firearms Licensing Unit", 7, 1271, 0, 0, 0, 0, weight = 0.1}, -- anumaz
	[210] = { "Coca-Cola Christmas", "A bottle of coke, christmas edition.", 1, 2880, 180, 0, 0, 0, weight = 0.2}, -- Exciter
	[211] = { "A Christmas Lottery Ticket", "From the Coca-Cola Santa.", 10, 1581, 270, 270, 0, 0, weight = 0.1}, -- Exciter
	[212] = { "Snow Tires", "Stick to the ground like velcro!", 4, 1098, 0, 0, 0, 0, weight = 1}, -- Exciter
	[213] = { "Pinnekjott", "Exciter's christmas favourite.", 1, 2215, 205, 205, 0, 0.06, weight = 0.1, preventSpawn = true}, -- Exciter
	[214] = { "Generic Drug", "#v", 3, 1576, 0, 0, 0, 0.07, weight = 0.1}, -- Chaos
	[215] = { "Akustik Gitar", "Takamine marka akustik gitar.", 4, 1901, 0, 180, 360, 0.06, weight = 0.1}, -- okarosa
	[216] = { "Pişmiş Balık", "Denizden yakalanmış ve mangalda közlenmiş bir balık.", 1, 1271, 0, 0, 0, 0, weight = 1}, -- okarosa
	[217] = { "Hamsi", "İri ve Yağlı Hamsi", 1, 1271, 0, 0, 0, 0, weight = 1}, -- okarosa
	[218] = { "İstavrit", "Parlak ve Canlı İstavrit", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[219] = { "Çinekop", "Parlak ve İri Çinekop", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[220] = { "Zargana", "Parlak ve İri Zargana", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[221] = { "Palamut", "Parlak ve İri Palamut", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[222] = { "Uskumru", "Parak ve İri Uskumru", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[223] = { "Karagöz", "Parlak ve İri Karagöz", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[224] = { "Sudak Balığı", "Denizden yeni çıkmış taptaze bir sudak balığı.", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[225] = { "Lüfer", "Parlak ve İri Lüfer", 1, 1271, 0, 0, 0, 0, weight = function(v) return v end}, -- okarosa
	[226] = { "Atatürk Bayrağı", "Bir adet kumaş bayrak.", 1, 2914, 0, 0, 0, 0, weight = 1, hideItemValue = true }, -- okarosa
	[227] = { "Nargile", "Seri köz getir kardeşim.", 1, 1902, 0, 0, 0, 0.3, weight = 2, hideItemValue = true }, -- okarosa
	[228] = { "Fotoğraf", "Bir adet fotoğraf.", 1, 1271, 0, 0, 0, 0, weight = 0.1, hideItemValue = true }, -- okarosa
	[229] = { "Tuborg Bira", "Adam gibi bira - Tuborg.", 1, 1520, 0, 0, 0, 0, weight = 1, }, -- okarosa
	[230] = { "Yeni Rakı", "Yeni rakı.", 1, 1520, 0, 0, 0, 0, weight = 1, }, -- okarosa
	[280] = { "Rozet", "Rozet.", 7, 330, 90, 90, 0, -0.05, weight = 0.2 }, -- Bluee
	
	
	--Phencycldine
	
	[333] = { "Saksı", "Çiçek ekmenize yarıyan bir saksı .. ", 7, 2195, 90, 90, 0, -0.05, weight = 0.2 }, 
	
	-- KAHVEHANE
	[231] = { "Çay", "Tavşan kanı sıcak çay.", 1, 2647, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[232] = { "Oralet", "Portakallı sıcak oralet.", 1, 2647, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[233] = { "Kuşburnu", "İçinizi ısıtacak sıcacık kuşburnu.", 1, 2647, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	
	-- OCAKBAŞI
	[234] = { "Tavuk Döner Dürüm", "Bir dürüm tavuk döner.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[235] = { "Tavuk Döner Porsiyon", "Bir porsiyon tavuk döner.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[236] = { "Et Döner Dürüm", "Bir dürüm et döner.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[237] = { "Et Döner Porsiyon", "Bir porsiyon et döner.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[238] = { "Adana Kebap Dürüm", "Bir dürüm adana kebap.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[239] = { "Adana Kebap Porsiyon", "Bir porsiyon adana kebap.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[240] = { "Beyti", "Bir porsiyon beyti.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[241] = { "Kuzu Şiş Dürüm", "Bir dürüm kuzu şiş kebap.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[242] = { "Kuzu Şiş Porsiyon", "Bir porsiyon kuzu şiş kebap.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[243] = { "Pirzola Porsiyon", "Bir porsiyon pirzola.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[244] = { "Kuzu Ciğer Şiş Dürüm", "Bir dürüm kuzu ciğer şiş kebap.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[245] = { "Kuzu Ciğer Şiş Porsiyon", "Bir porsiyon kuzu ciğer şiş kebap.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[246] = { "Tavuk Şiş Dürüm", "Bir dürüm tavuk şiş.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	[247] = { "Tavuk Şiş Porsiyon", "Bir porsiyon tavuk şiş.", 1, 2215, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	
	[248] = { "Spor Salonu Üyelik Kartı", "Bir adet spor salonu üyelik kartı.", 1, 1581, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	
	[249] = { "Araç Ruhsatı", "Bir adet T.C. araç tescil belgesi.", 1, 1581, 0, 0, 0, 0, weight = 0.5 }, -- okarosa
	
	[250] = { "Balık Yemi", "#v adet balık yemi.", 1, 1271, 0, 0, 0, 0, weight = 1 }, -- okarosa
	
	[251] = { "Simit", "Bir adet gevrek simit.", 1, 1925, 0, 0, 0, 0, weight = 0.25 }, -- okarosa
	[252] = { "Açma", "Bir adet yumuşak açma.", 1, 1925, 0, 0, 0, 0, weight = 0.25 }, -- okarosa
	
	[253] = { "Tasma", "Bir adet evcil hayvan tasması.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- okarosa
	-- DELETE AKSESUAR
	[254] = { "Yılbaşı Şapkası", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, --	
	[255] = { "Gözlük 1", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 
	[256] = { "Gözlük 2", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 	
	[257] = { "Polis Sapka", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 
	[258] = { "Polis Cap", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 
	[259] = { "Özel Şapka", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 
	[260] = { "Motorsiklet Kask", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, --	
	[261] = { "İşçi Kaskı", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- --	
	[262] = { "Kışlık Şapka", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, 	
	[263] = { "Gözlük 3", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 	
	[264] = { "Gözlük 4", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 			
	[265] = { "Gözlük 5", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 		
	[266] = { "Motorcu Kaskı 1", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, --
	[267] = { "Motorcu Kaskı 2", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, --		
	[268] = { "Siyah Şapka", "Bir adet Aksesuar.", 1, 1271, 0, 0, 0, 0, weight = 0.25 }, -- 	
	[284] = { "Çeyrek Bilet", "#v", 6, 1271, 0, 0, 0, 0.285, weight = 0, preventSpawn = true },
	[285] = { "Yarım Bilet", "#v", 6, 1271, 0, 0, 0, 0.285, weight = 0, preventSpawn = true },
	[286] = { "Tam Bilet", "#v", 6, 1271, 0, 0, 0, 0.285, weight = 0, preventSpawn = true },
	[287] = { "At Kafası", "Maskeler #1", 6, 1914, 0, 0, 0, 0.285, weight = 0.5 },

	[290] = { "Hamsi", "Uyyy, hamsi gelmuş da.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 },
	[291] = { "Dağ Alabalığı", "Bir adet Dağ Alabalığı.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 },
	[292] = { "Deniz Alabalığı", "Bir adet Deniz Alabalığı.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, ---Delete
	[293] = { "Dere Alabalığı", "Bir adet Dere Alabalığı.", 6, 2386, 0, 0, 0, 0.1, weight = 0.1 },

	[314] = { "Hidrolik", "Bir adet hidrolik.", 1, 314, 0, 0, 0, 0, weight = 0.25 },
	
	[890] = { "Beyaz Pitbull", "((Bir adet evcil hayvan.))", 4, 310, 0, 0, 0, 0.285, weight = 1 },
	[891] = { "Siyah Pitbull", "((Bir adet evcil hayvan.))", 4, 311, 0, 0, 0, 0.285, weight = 1 },
	[892] = { "Gri Pitbull", "((Bir adet evcil hayvan.))", 4, 304, 0, 0, 0, 0.285, weight = 1 },
	[893] = { "German Boxer", "((Bir adet evcil hayvan.))", 4, 298, 0, 0, 0, 0.285, weight = 1 },
	[894] = { "Alman Kurdu", "((Bir adet evcil hayvan.))", 4, 301, 0, 0, 0, 0.285, weight = 1 },
	[895] = { "Husky", "((Bir adet evcil hayvan.))", 4, 302, 0, 0, 0, 0.285, weight = 1 },
	[896] = { "Rottweiler", "((Bir adet evcil hayvan.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[897] = { "Köpek Maması", "Köpeklere yemek vermeye yarar", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[898] = { "French Bulldog2", "((Bir adet evcil hayvan.))", 4, 31, 0, 0, 0, 0.285, weight = 1 },		

	[404] = { "Sırdan", "Büyük, kalın bir şırdan.", 1, 2215, 205, 205, 0, 0.01, weight = 0.1 },
	[405] = { "Midye", "Lezzetli bir midye.", 1, 2215, 205, 205, 0, 0.01, weight = 0.1 },

	[347] = { "Tohum", "Saksıya koymak için.", 4, 1342, 270, 0, 0, 0, weight = 0 },
	[401] = { "Kenevir", "İşlenmeyi bekleyen Kenevir.", 4, 3044, 270, 0, 0, 0, weight = 0.1 }, --C4N
	[348] = { "Saksı", "Tohum ekmek için.", 4, 1342, 270, 0, 0, 0.1, weight = 0.1 },

	[345] = { "Nargile", "Bir adet nargile.", 1, 1271, 0, 0, 0, 0, weight = 0.25 },
	[406] = { "Sosisli Tezgahı", "Sosisli tezgahı. (/tezgahkur - /tezgahkaldir)", 4, 301, 0, 0, 0, 0.285, weight = 0.1 },
	[407] = { "Dondurma Tezgah", "Dondurma tezgahı. (/tezgahkur - /tezgahkaldir)", 4, 301, 0, 0, 0, 0.285, weight = 0.1 },
	[408] = { "Çin Yemeği Tezgahı", "Çin Yemeği tezgahı. (/tezgahkur - /tezgahkaldir)", 4, 301, 0, 0, 0, 0.285, weight = 0.1 },
	[272] = { "Maymuncuk", "Kilit Kırmaya Yarayan Bir Çeşit Alet.", 6, 3915, 90, 0, 0, 0.2, weight = 0.4}, -- Exciter
	[273] = { "Mataryal", "Bir Çeşit Materyal.", 6, 3915, 90, 0, 0, 0.2, weight = 0.4}, -- Exciter
	[409] = { "Barbekü Tezgahı", "Barbekü tezgahı. (/barbekukur - /barbekukaldir)", 4, 301, 0, 0, 0, 0.285, weight = 0.1 },	
	
	[282] = { "Pitbul", "Bir adet köpek", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[283] = { "Tasma", "Bir adet köpek tasması", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[410] = { "Beyaz Pitbull", "((Bir adet evcil hayvan.))", 4, 310, 0, 0, 0, 0.285, weight = 1 },
	[411] = { "Siyah Pitbull", "((Bir adet evcil hayvan.))", 4, 311, 0, 0, 0, 0.285, weight = 1 },
	[412] = { "Gri Pitbull", "((Bir adet evcil hayvan.))", 4, 304, 0, 0, 0, 0.285, weight = 1 },
	[413] = { "German Boxer", "((Bir adet evcil hayvan.))", 4, 298, 0, 0, 0, 0.285, weight = 1 },
	[414] = { "Alman Kurdu", "((Bir adet evcil hayvan.))", 4, 301, 0, 0, 0, 0.285, weight = 1 },
	[415] = { "Husky", "((Bir adet evcil hayvan.))", 4, 302, 0, 0, 0, 0.285, weight = 1 },
	[416] = { "Rottweiler", "((Bir adet evcil hayvan.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[417] = { "Köpek Maması", "Köpeklere yemek vermeye yarar", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[418] = { "Havalı Korna #1", "((Aracın envanterine koyunuz.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[419] = { "Havalı Korna #2", "((Aracın envanterine koyunuz.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[420] = { "Havalı Korna #3", "((Aracın envanterine koyunuz.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[421] = { "Havalı Korna #4", "((Aracın envanterine koyunuz.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[422] = { "Havalı Korna #5", "((Aracın envanterine koyunuz.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[423] = { "Havalı Korna #6", "((Aracın envanterine koyunuz.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[424] = { "Piyango Bileti", "((Sabırla bekleyin.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },
	[450] = { "Sezon Rozeti", "#v", 10, 1581, 270, 270, 0, 0, weight = 0.3 },
	[451] = { "Malzeme #1", "((Hele bi kontağı çevir hele.))", 4, 10, 0, 0, 0, 0.285, weight = 1 },

    -- Aksesuar Delete
	[452] = { "Domuz Maskesi", "Bir Domuz Maskesi.", 4, 2710, 270, 0, 0, 0.1, weight = 0.1 },
	[453] = { "Yaratık Maskesi", "Bir Yaratık Maskesi.", 4, 2396, 270, 0, 0, 0.1, weight = 0.1 },
	[454] = { "Hokey Maskesi", "Bir Hokey Maskesi.", 4, 2397, 270, 0, 0, 0.1, weight = 0.1 },
	[455] = { "Maymun Maskesi", "Bir maymun maskesi.", 4, 2398, 270, 0, 0, 0.1, weight = 0.1 },
	[456] = { "Smoking Monkey Mask", "Bir sigara içen maymun maskesi.", 4, 2399, 270, 0, 0, 0.1, weight = 0.1 },
	[457] = { "Karnaval Maskesi", "Bir karnaval maskesi.", 4, 2407, 270, 0, 0, 0.1, weight = 0.1 },
	[458] = { "Fedora", "Fötr Şapka.", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[459] = { "Saç Stili", "Saç Stili - 1", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[460] = { "Saç Stili", "Saç Stili - 2", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[461] = { "Saç Stili", "Saç Stili - 3", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[462] = { "Saç Stili", "Saç Stili - 4", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[463] = { "Saç Stili", "Saç Stili - 5", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[464] = { "Saç Stili", "Saç Stili (Beyaz) - 1", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[465] = { "Saç Stili", "Saç Stili (Beyaz) - 2", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[466] = { "Saç Stili", "Saç Stili (Beyaz) - 3", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[467] = { "Saç Stili", "Saç Stili (Beyaz) - 4", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[468] = { "Sakal Stili", "Sakal Stili - 1", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[469] = { "Sakal Stili", "Sakal Stili - 2", 4, 1241, 270, 0, 0, 0.1, weight = 0.1 },
	[470] = { "Gözlük", "Siyah Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[471] = { "Gözlük", "Siyah Gözlük - 2", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[472] = { "Gözlük", "Mavi Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[473] = { "Gözlük", "Turuncu Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[474] = { "Gözlük", "Yeşil Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[475] = { "Gözlük", "Pembe Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[476] = { "Gözlük", "Mor Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[477] = { "Gözlük", "Kırmızı Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[478] = { "Gözlük", "Sarı Gözlük - 1", 4, 1666, 270, 0, 0, 0.1, weight = 0.1 },
	[479] = { "Şapka", "HatMan Şapka - 1", 4, 1277, 270, 0, 0, 0.1, weight = 0.1 },
	[480] = { "Şapka", "HatMan Şapka - 2", 4, 2918, 270, 0, 0, 0.1, weight = 0.1 },
	[481] = { "Şapka", "Yeşil Uzun Bere - 1", 4, 1310, 270, 0, 0, 0.1, weight = 0.1 },
	[482] = { "Şapka", "Siyah Uzun Bere - 1", 4, 954, 270, 0, 0, 0.1, weight = 0.1 },
	[483] = { "Şapka", "Siyah Uzun Bere - 2", 4, 2976, 270, 0, 0, 0.1, weight = 0.1 },
	[484] = { "Şapka", "Beyaz Oval Şapka - 1", 4, 1253, 270, 0, 0, 0.1, weight = 0.1 },
	[485] = { "Şapka", "Sarı Kovboy Şapkası", 4, 2037, 270, 0, 0, 0.1, weight = 0.1 },
	[486] = { "Şapka", "Siyah Büyük Şapka - 1", 4, 2709, 270, 0, 0, 0.1, weight = 0.1 },
	[489] = { "Şapka", "Siyah Kovboy Şapka - 1", 4, 2045, 270, 0, 0, 0.1, weight = 0.1 },
	[490] = { "Göz Bandı", "Siyah Göz Bandı", 4, 1313, 270, 0, 0, 0.1, weight = 0.1 },
	[491] = { "Kol Bandı", "Beyaz Kol Bandı - 1", 4, 1213, 270, 0, 0, 0.1, weight = 0.1 },
	[492] = { "Kulaklık", "Siyah Kulaklık - 1", 4, 1654, 270, 0, 0, 0.1, weight = 0.1 },
	[493] = { "Kulaklık", "Beyaz Kulaklık - 1", 4, 2035, 270, 0, 0, 0.1, weight = 0.1 },
	[494] = { "Gitar", "Siyah Warlock Gitar - 1", 4, 2036, 270, 0, 0, 0.1, weight = 0.1 },
	[495] = { "Gitar", "Beyaz Bass Gitar - 1", 4, 2061, 270, 0, 0, 0.1, weight = 0.1 },
	[496] = { "Dağcı Çantası", "Büyük Dağcı Çantası", 4, 2116, 270, 0, 0, 0.1, weight = 0.1 },
	[497] = { "[LSPD] Operasyon Kaskı", "Polis Departmanı Aksesuar Eşyası", 4,1611, 270, 0, 0, 0.1, weight = 0.1 },
	[498] = { "[LSPD] Operasyon Yeleği", "Polis Departmanı Aksesuar Eşyası", 4, 1252, 270, 0, 0, 0.1, weight = 0.1 },
	[499] = { "[LSPD] Memur Şapkası", "Polis Departmanı Aksesuar Eşyası", 4, 1559, 270, 0, 0, 0.1, weight = 0.1 },
	[500] = { "[LSPD] Memur Şapkası - 2", "Polis Departmanı Aksesuar Eşyası", 4, 2985, 270, 0, 0, 0.1, weight = 0.1 },
	[501] = { "[LSPD] Memur Şapkası - 3", "Polis Departmanı Aksesuar Eşyası", 4, 2054, 270, 0, 0, 0.1, weight = 0.1 },
	[502] = { "Yeni", "Büyük Dağcı Çantası", 4, 2710, 270, 0, 0, 0.1, weight = 0.1 },
	[515] = { "Tamir Kiti", "İçerisinde tamir için gerekli aletler kiti.", 1, 1581, 270, 270, 0, 0, weight = 0.1 }, -- Farid
	[519] = { "Süt", "Keçi Sütü", 4, 2710, 270, 0, 0, 0.1, weight = 0.1 },
	[520] = { "Keçi", "Süt sağarak keçi sütü elde edebilirsin.", 4, 2710, 270, 0, 0, 0.1, weight = 0.1 },
	[521] = { "Koyun", "Keserek et elde edebilirsin ve satabilirsin.", 4, 2710, 270, 0, 0, 0.1, weight = 0.1 },
	[550] = { "Birlik Kasasi", "Keserek et elde edebilirsin ve satabilirsin.", 4, 2710, 270, 0, 0, 0.1, weight = 0.1 },
	[551] = { "Meslek Kazanım #25", "Belirtilen konuma götürülerek, para elde edebilirsiniz .. ", 4, 2710, 270, 0, 0, 0.1, weight = 0.1,  preventSpawn = true  },
	[552] = { "Meslek Kazanım #50", "Belirtilen konuma götürülerek, para elde edebilirsiniz .. ", 4, 2710, 270, 0, 0, 0.1, weight = 0.1, preventSpawn = true },
	[553] = { "Meslek Kazanım #75", "Belirtilen konuma götürülerek, para elde edebilirsiniz .. ", 4, 2710, 270, 0, 0, 0.1, weight = 0.1, preventSpawn = true },
	[554] = { "Meslek Kazanım #100", "Belirtilen konuma götürülerek, para elde edebilirsiniz .. ", 4, 2710, 270, 0, 0, 0.1, weight = 0.1,  preventSpawn = true },
	[555] = { "İstiridye", "/istiridyeac yazarak istiridyeyi açabilirsin.", 4, 2386, 0, 0, 0, 0.285, weight = 2 }, --LordArsen
	[556] = { "Kırmızı İnci", "Muazzam parlayan bir kırmızı inci.", 4, 2386, 0, 0, 0, 0.285, weight = 2 }, --LordArsen
	[557] = { "Mavi İnci", "Muazzam parlayan bir mavi inci.", 4, 2386, 0, 0, 0, 0.285, weight = 2 }, --LordArsen
	[558] = { "Yeşil İnci", "Muazzam parlayan bir yeşil inci.", 4, 2386, 0, 0, 0, 0.285, weight = 2 }, --LordArsen
	[559] = { "Beyaz İnci", "Muazzam parlayan bir beyaz inci.", 4, 2386, 0, 0, 0, 0.285, weight = 2 }, --LordArsen
	[560] = { "Çeyrek Altın", "Döviz bürosunda bozdurabileceğiniz Çeyrek Altın.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [561] = { "Cumhuriyet Altın", "Döviz bürosunda bozdurabileceğiniz Cumhuriyet Altın.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [562] = { "Altın Bilezik", "Döviz bürosunda bozdurabileceğiniz Altın Bilezik.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [563] = { "Kazı Kazan", "Kazı ve Kazan!", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [568] = { "İşlenmemiş Taş", "Fabrikada işleyebileceğiniz bir taş parçası.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [569] = { "İşlenmemiş Kömür", "Fabrikada işleyebileceğiniz bir kömür parçası.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [570] = { "İşlenmemiş Bakır", "Fabrikada işleyebileceğiniz bir bakır parçası.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [571] = { "İşlenmemiş Demir", "Fabrikada işleyebileceğiniz bir demir parçası.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [572] = { "İşlenmemiş Altın", "Fabrikada işleyebileceğiniz bir altın parçası.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [573] = { "İşlenmiş Taş", "Borsa bürosunda bozdurabileceğiniz işlenmiş bir taş.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [574] = { "İşlenmiş Kömür", "Borsa bürosunda bozdurabileceğiniz işlenmiş bir kömür.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [575] = { "İşlenmiş Bakır", "Borsa bürosunda bozdurabileceğiniz işlenmiş bir bakır.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa
    [576] = { "Hediye Kutusu", "Los Santos tarafından hediye edilen sürpriz kutu. ((/kutuac))", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --Farid
    [577] = { "İşlenmiş Altın", "Borsa bürosunda bozdurabileceğiniz işlenmiş bir altın.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa	
    [578] = { "Kazma", "Kazı yaparken kullanabileceğiniz bir eşya.", 4, 2386, 0, 0, 0, 0.285, weight = 0.1 }, --oKarosa	
	[579] = { "Can", "Canınızı 100% olarak ayarlar.", 3, 3044, 0, 0, 0, 0.04, weight = 0.1 },
	[580] = { "Zırh", "Zırhınızı 100% olarak ayarlar.", 3, 3044, 0, 0, 0, 0.04, weight = 0.1 },
	[581] = { "Bronz Şans Kutusu", "Boş - (50,000$ - 100,000$) - 3 günlük VIP 2 - 7 günlük VIP 2 - TEC9 Çıkabilir.", 4, 1271, 0, 0, 0, 0, weight = 0 },
	[582] = { "Gümüş Şans Kutusu", "Boş - (150,000$ - 250,000$) - 15 günlük VIP 2 - 3 günlük VIP 3 - MP5 Çıkabilir.", 4, 1271, 0, 0, 0, 0, weight = 0 },
	[583] = { "Altın Şans Kutusu", "Boş - (300,000$ - 500,000$) - 7 günlük VIP 3 - 15 günlük VIP 3 - AK47 Çıkabilir.", 4, 1271, 0, 0, 0, 0, weight = 0 },
	[584] = { "Elmas Şans Kutusu", "Boş - (550,000$ - 750,000$) - 3 günlük VIP 4 - 7 günlük VIP 4 - M4 Çıkabilir.", 4, 1271, 0, 0, 0, 0, weight = 0 },
	[585] = { "Yılbaşı Kutusu", "Boş - (500,000$ - 1,000,000$) - (3 - 7) günlük VIP 3 - (3 - 7) günlük VIP 4 - (5 TL - 10 TL) - (Tec-9, MP5, AK47, M4) Çıkabilir.", 4, 1271, 0, 0, 0, 0, weight = 0 },
}

	-- name, description, category, model, rx, ry, rz, zoffset
	
	-- categories:
	-- 1 = Food & Drink
	-- 2 = Keys
	-- 3 = Drugs
	-- 4 = Other
	-- 5 = Books
	-- 6 = Clothing & Accessories
	-- 7 = Electronics
	-- 8 = guns
	-- 9 = bullets
	-- 10 = wallet

weaponmodels = {
	[1]=331, [2]=333, [3]=326, [4]=335, [5]=336, [6]=337, [7]=338, [8]=339, [9]=341,
	[15]=326, [22]=346, [23]=347, [24]=348, [25]=349, [26]=350, [27]=351, [28]=352,
	[29]=353, [32]=372, [30]=355, [31]=356, [33]=357, [34]=358, [35]=359, [36]=360,
	[37]=361, [38]=362, [16]=342, [17]=343, [18]=344, [39]=363, [41]=365, [42]=366,
	[43]=367, [10]=321, [11]=322, [12]=323, [14]=325, [44]=368, [45]=369, [46]=371,
	[40]=364, [100]=373
}

-- other melee weapons?
weaponweights = {
	[22] = 1.14, [23] = 1.24, [24] = 2, [25] = 3.1, [26] = 2.1, [27] = 4.2, [28] = 3.6, [29] = 2.640, [30] = 4.3, [31] = 2.68, [32] = 3.6, [33] = 4.0, [34] = 4.3
}

ammoweights =
{
	[22] = 0.0224, [23] = 0.0224, [24] = 0.017, [25] = 0.037, [26] = 0.037, [27] = 0.037, [28] = 0.009, [29] = 0.012, [30] = 0.0165, [31] = 0.0112, [32] = 0.009, [33] = 0.0128, [34] = 0.027
}

--
-- Vehicle upgrades as names
--
vehicleupgrades = {
	"Pro Spoiler", "Win Spoiler", "Drag Spoiler", "Alpha Spoiler", "Champ Scoop Hood",
	"Fury Scoop Hood", "Roof Scoop", "Right Sideskirt", "5x Nitro", "2x Nitro",
	"10x Nitro", "Race Scoop Hood", "Worx Scoop Hood", "Round Fog Lights", "Champ Spoiler",
	"Race Spoiler", "Worx Spoiler", "Left Sideskirt", "Upswept Exhaust", "Twin Exhaust",
	"Large Exhaust", "Medium Exhaust", "Small Exhaust", "Fury Spoiler", "Square Fog Lights",
	"Offroad Wheels", "Right Alien Sideskirt (Sultan)", "Left Alien Sideskirt (Sultan)",
	"Alien Exhaust (Sultan)", "X-Flow Exhaust (Sultan)", "Left X-Flow Sideskirt (Sultan)",
	"Right X-Flow Sideskirt (Sultan)", "Alien Roof Vent (Sultan)", "X-Flow Roof Vent (Sultan)",
	"Alien Exhaust (Elegy)", "X-Flow Roof Vent (Elegy)", "Right Alien Sideskirt (Elegy)",
	"X-Flow Exhaust (Elegy)", "Alien Roof Vent (Elegy)", "Left X-Flow Sideskirt (Elegy)",
	"Left Alien Sideskirt (Elegy)", "Right X-Flow Sideskirt (Elegy)", "Right Chrome Sideskirt (Broadway)",
	"Slamin Exhaust (Chrome)", "Chrome Exhaust (Broadway)", "X-Flow Exhaust (Flash)", "Alien Exhaust (Flash)",
	"Right Alien Sideskirt (Flash)", "Right X-Flow Sideskirt (Flash)", "Alien Spoiler (Flash)",
	"X-Flow Spoiler (Flash)", "Left Alien Sideskirt (Flash)", "Left X-Flow Sideskirt (Flash)",
	"X-Flow Roof (Flash)", "Alien Roof (Flash)", "Alien Roof (Stratum)", "Right Alien Sideskirt (Stratum)",
	"Right X-Flow Sideskirt (Stratum)", "Alien Spoiler (Stratum)", "X-Flow Exhaust (Stratum)",
	"X-Flow Spoiler (Stratum)", "X-Flow Roof (Stratum)", "Left Alien Sideskirt (Stratum)",
	"Left X-Flow Sideskirt (Stratum)", "Alien Exhaust (Stratum)", "Alien Exhaust (Jester)",
	"X-FLow Exhaust (Jester)", "Alien Roof (Jester)", "X-Flow Roof (Jester)", "Right Alien Sideskirt (Jester)",
	"Right X-Flow Sideskirt (Jester)", "Left Alien Sideskirt (Jester)", "Left X-Flow Sideskirt (Jester)",
	"Shadow Wheels", "Mega Wheels", "Rimshine Wheels", "Wires Wheels", "Classic Wheels", "Twist Wheels",
	"Cutter Wheels", "Switch Wheels", "Grove Wheels", "Import Wheels", "Dollar Wheels", "Trance Wheels",
	"Atomic Wheels", "Stereo System", "Hydraulics", "Alien Roof (Uranus)", "X-Flow Exhaust (Uranus)",
	"Right Alien Sideskirt (Uranus)", "X-Flow Roof (Uranus)", "Alien Exhaust (Uranus)",
	"Right X-Flow Sideskirt (Uranus)", "Left Alien Sideskirt (Uranus)", "Left X-Flow Sideskirt (Uranus)",
	"Ahab Wheels", "Virtual Wheels", "Access Wheels", "Left Chrome Sideskirt (Broadway)",
	"Chrome Grill (Remington)", "Left 'Chrome Flames' Sideskirt (Remington)",
	"Left 'Chrome Strip' Sideskirt (Savanna)", "Covertible (Blade)", "Chrome Exhaust (Blade)",
	"Slamin Exhaust (Blade)", "Right 'Chrome Arches' Sideskirt (Remington)",
	"Left 'Chrome Strip' Sideskirt (Blade)", "Right 'Chrome Strip' Sideskirt (Blade)",
	"Chrome Rear Bullbars (Slamvan)", "Slamin Rear Bullbars (Slamvan)", false, false, "Chrome Exhaust (Slamvan)",
	"Slamin Exhaust (Slamvan)", "Chrome Front Bullbars (Slamvan)", "Slamin Front Bullbars (Slamvan)",
	"Chrome Front Bumper (Slamvan)", "Right 'Chrome Trim' Sideskirt (Slamvan)",
	"Right 'Wheelcovers' Sideskirt (Slamvan)", "Left 'Chrome Trim' Sideskirt (Slamvan)",
	"Left 'Wheelcovers' Sideskirt (Slamvan)", "Right 'Chrome Flames' Sideskirt (Remington)",
	"Bullbar Chrome Bars (Remington)", "Left 'Chrome Arches' Sideskirt (Remington)", "Bullbar Chrome Lights (Remington)",
	"Chrome Exhaust (Remington)", "Slamin Exhaust (Remington)", "Vinyl Hardtop (Blade)", "Chrome Exhaust (Savanna)",
	"Hardtop (Savanna)", "Softtop (Savanna)", "Slamin Exhaust (Savanna)", "Right 'Chrome Strip' Sideskirt (Savanna)",
	"Right 'Chrome Strip' Sideskirt (Tornado)", "Slamin Exhaust (Tornado)", "Chrome Exhaust (Tornado)",
	"Left 'Chrome Strip' Sideskirt (Tornado)", "Alien Spoiler (Sultan)", "X-Flow Spoiler (Sultan)",
	"X-Flow Rear Bumper (Sultan)", "Alien Rear Bumper (Sultan)", "Left Oval Vents", "Right Oval Vents",
	"Left Square Vents", "Right Square Vents", "X-Flow Spoiler (Elegy)", "Alien Spoiler (Elegy)",
	"X-Flow Rear Bumper (Elegy)", "Alien Rear Bumper (Elegy)", "Alien Rear Bumper (Flash)",
	"X-Flow Rear Bumper (Flash)", "X-Flow Front Bumper (Flash)", "Alien Front Bumper (Flash)",
	"Alien Rear Bumper (Stratum)", "Alien Front Bumper (Stratum)", "X-Flow Rear Bumper (Stratum)",
	"X-Flow Front Bumper (Stratum)", "X-Flow Spoiler (Jester)", "Alien Rear Bumper (Jester)",
	"Alien Front Bumper (Jester)", "X-Flow Rear Bumper (Jester)", "Alien Spoiler (Jester)",
	"X-Flow Spoiler (Uranus)", "Alien Spoiler (Uranus)", "X-Flow Front Bumper (Uranus)",
	"Alien Front Bumper (Uranus)", "X-Flow Rear Bumper (Uranus)", "Alien Rear Bumper (Uranus)",
	"Alien Front Bumper (Sultan)", "X-Flow Front Bumper (Sultan)", "Alien Front Bumper (Elegy)",
	"X-Flow Front Bumper (Elegy)", "X-Flow Front Bumper (Jester)", "Chrome Front Bumper (Broadway)",
	"Slamin Front Bumper (Broadway)", "Chrome Rear Bumper (Broadway)", "Slamin Rear Bumper (Broadway)",
	"Slamin Rear Bumper (Remington)", "Chrome Front Bumper (Remington)", "Chrome Rear Bumper (Remington)",
	"Slamin Front Bumper (Blade)", "Chrome Front Bumper (Blade)", "Slamin Rear Bumper (Blade)",
	"Chrome Rear Bumper (Blade)", "Slamin Front Bumper (Remington)", "Slamin Rear Bumper (Savanna)",
	"Chrome Rear Bumper (Savanna)", "Slamin Front Bumper (Savanna)", "Chrome Front Bumper (Savanna)",
	"Slamin Front Bumper (Tornado)", "Chrome Front Bumper (Tornado)", "Chrome Rear Bumper (Tornado)",
	"Slamin Rear Bumper (Tornado)"
}

--
-- Badges
--

function getBadges()
	return {
		-- [itemID] = {elementData, name, factionIDs, color, iconID}
		[156]  = { "LSFD Rozeti", 		"LSFD Rozeti",			{[50] = true},				 	 {175, 50, 50}, 2},
		[64]  = { "LSPD Rozeti", 		"LSPD Rozeti",			{[1] = true},				 	{48, 128, 255, true},	2},
		[65]  = { "LSMD Rozeti", 		"LSMD Rozeti",			{[2] = true},				 	{175, 50, 50},	2},
		[131] = { "LSSD Rozeti",        "LSSD Rozeti",        {[3] = true},                    {74, 104, 44, 200},    1},
		[86]  = { "LSTV Rozeti",		"LSTV Rozeti",				{[20] = true},					{255, 127, 0},	1},
		[450]  = { "Sezon Rozeti",		"Sezon Rozeti",				{[-1] = true},					{245, 204, 35},	2},
		[87]  = { "Kahraman Sezon Rozeti",		"Kahraman Sezon Rozeti",		{[-1] = true},					{245, 35, 35},	2},
		--[119] = { "SA ID",		"a Sanitary Andreas ID",				{[125] = true},					{150,255,255},	1},
		[122] = { "light blue bandana", "a light blue bandana",				{[-1] = true},					{0,185,200},	122},
		[123] = { "red bandana", "a red bandana",				{[-1] = true},					{190,0,0},	123},
		[124] = { "yellow bandana", "a yellow bandana",				{[-1] = true},					{255,250,0},	124},
		[125] = { "purple bandana", "a purple bandana",				{[-1] = true},					{220,0,255},	125},
		[135] = { "blue bandana", "a blue bandana",				{[-1] = true},					{0,100,255},	135},
		[136] = { "brown bandana", "a brown bandana",				{[-1] = true},					{125,63,50},	136},
		[158] = { "green bandana", "a green bandana",				{[-1] = true},					{50,150,50},	158},
		[168] = { "orange bandana", "a orange bandana",				{[-1] = true},					{210,105,30},	168},
		[127] = { "FAA badge",		"a FAA badge",	{[64] = true},	{255,140,0},	2},
		[82] = { "Rozet", "Rozet",	{[-1] = true},	{255, 255, 255},	1},
		[159] = { "Cargo Group ID", "An ID from Cargo Group", {[56] = true},  {255, 102, 0}, 1}, -- anumaz, Cargo Group ID
		[180] = { "SAPT ID", "An ID from San Andreas Public Transport", {[64] = true},  {73, 136, 245}, 1}, -- Exciter
		-- [161] = { "FAC ID", "an ID from Fleming Architecture and Construction", {[51] = true}, {171, 97, 0}, 1} -- anumaz, BCC ID
		-- [129] = { "Direct Imports ID",		"a Direct Imports ID",	{[7] = true},	{88, 130, 250},	1},
		-- [131] = { "LSSD badge",        "an LSSD badge",                {[15] = true},                    {210, 180, 140},    1}, -- Adams added the LSSD badge / 03/02/14
		-- [146] = { "Los Santos District Court Identification Card",		"a Los Santos District Court Identification Card",					{[46] = true}, 				{128,0,128},	1},
	}
end

-- badges/IDs should generally be in the wallet.
for k, v in pairs(getBadges()) do
	if not v[3][-1] and g_items[k][3] ~= 10 then
		outputDebugString('Badge/ID' .. k .. ' is not in wallet.')
	end
end

--
-- Mask Data
--
function getMasks()
	return {
		-- [itemID] = { elementData, textWhenPuttingOn, textWhentakingOff, hideIdentity }
		[26]  = {"gasmask",			"slips a black gas mask over their face",	"slips a black gas mask off their face",	true},
		[56]  = {"mask",			"",				"",				true},
		[90]  = {"helmet",			"puts a #name over their head",				"takes a #name off their head",				false},
		[120] = {"scuba",			"puts scuba gear on",						"takes scuba gear off",						true},
		[171] = {"bikerhelmet",		"puts a #name over their head",				"takes a #name off their head",				false},
		[172] = {"fullfacehelmet",	"puts a #name over their head",				"takes a #name off their head",				true},
	}
end

--
--Silah Hak (OzulusTR)
--
restrictedWeapons = {}
for i=0, 15 do
	restrictedWeapons[i] = true
end
