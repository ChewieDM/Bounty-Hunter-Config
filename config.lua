-- Author '🅱🅻🆄🅴🆈🅴🆂#1364' by Sirec Studio -- 
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --
-- Novas Missões adicionadas e configuradas por ChewieDM
--  DEV, as configuraçoes de cada missão devem ser bem analisadas e pensadas antes de mudar algo, missões tem diferentes dificuldades que podem ser definidas por Quao longe é do quadro de recompensa, Horario, Numero de Inimigos, Armas que usam e comportamentos, evite colocar uma recompensa muito baixa para recompensas que são dificeis de completar sozinho até pra alguem experiente. O horario é uma otima maneira de limitar a Missão de recompensa alta de ser feita apenas 1-2 vezes por dia do jogo, controle conforme sua economia, não esqueça de levar os custos de munição e armamento gastos juntamente com o numero de pessoas necessarias para conseguir completar. --

local VorpCore = {}
TriggerEvent("getCore",function(core)
    VorpCore = core
end)

Config = {

Webhook = "https://discord.com/api/webhooks/1256044792580673607/LpiDSvhnI8dDdHqxk2y1pO2eI-N3hn_J5Ng_PIl5U7mJoxTjkMF9etEiDpMXf3NHmPVy",
AddBounty = "blubounty",
AddBountyPass = "1995",
RepSystem = true,
RepAmount = 50,

MissionAutoTime = 900, -- every 60 minutes a new npc mission will be added ! <-- Se o servidor da RR 2x por dia, são 12 missões adicionadas, 60 minutos é muito tempo e corta a variação de missões.
DieNpcTime = 10, -- (30 seconds) Delete npc's after the player who took the bounty is dead !
DieBountyTime = 10, -- (60 seconds) Delete npc's after you killed the bounty target !
AlliveNpcTime = 60, -- (90 seconds) Delete npc's after you killed them all and finished the mission!
BountyBlip = 1481032477, -- Blip Type to Kill Bounty
BountyZone = 30.0, -- Blip Zone Area 
NearZone = 120, -- When to spawn the npc near location ! <-- 120 da a distancia do centro do minimapa até a borda onde o blip do local da missão começa a aparecer, é uma boa distancia.
TooFarAway = 550, -- Distance to Mission failed ! <- Distancia de falha, se precisar correr tu vai tomar tiro nas costas, essa distancia é boa para conseguir fugir caso de ruim, aumentar ou diminuir conforme necessario.
ServerYear = 1890, -- Server Year

Texts = {
    ["tittle_notification"] = "MISSÃO DE RECOMPENSA",
    ["bm_bountyblip"] = "ZONA DE MISSÃO",
    ["bm_arrestblip"] = "RECOMPENSA DE PRISÃO",
    ["bm_startkb"] = "Você acabou de começar a missão, vá para o local para matar todos os fora-da-lei!",
    ["bm_startab"] = "Você acabou de começar a missão, vá para o local para prender a recompensa!",
    ["bm_enemiesband"] = "Complete sua missão matando todos, você chegou ao local onde está",
    ["bm_arrestband"] = "Prenda o líder para completar sua missão, você chegou ao local onde está",
    ["bm_toofar"] = "Você se afastou muito da missão, você falhou!",
    ["bm_finishoutlaw"] = "Você conseguiu matar todos os bandidos, volte para qualquer quadro de procurados para receber sua recompensa!",
    ["bm_notfinished"] = "Você não terminou nenhuma missão!",
    ["bm_finished"] = "Parabéns, você completou a missão com sucesso e recebeu",
    ["bm_webhre"] = "RECOMPENSA:",
    ["bm_webhk"] = "missão concluída e recebeu",
    ["bm_inmission"] = "Vá para o ponto de verificação marcado para completar esta recompensa!",
    ["bm_failed"] = "Você matou a recompensa e falhou nesta missão!",
    ["bm_hours"] = "Você pode encontrá-los entre as horas",
},

BountyMissions = {

	-- Dificuldades: Facil, Médio , Dificil e Lendario. --
	-- Facil: 1 a 2 pessoas, poucos inimigos e utilizam revolveres, armas brancas e repetidora carabina; Podem ser feitas durante o dia todo até a noite--
	-- Médio: 3 a 4 pessoas, alguns inimigos e utilizam repetidores e shotguns; Horarios mais curtos --
	-- Dificil: 4 a 6 pessoas, bastante inimigos e utilizam rifle de ferrolho, carcanos, e todo tipo de arma potente. Horarios perigosos e janela menor de tempo para começar, requer mais planejamento --
	-- Lendario: 6 a 10 pessoas, muitos inimigos, utilizam todo tipo de armamento e suas posições e comportamentos são pensados para o jogador utilizar estratégias e diversos tipos de equipamento para conseguir completar. Blips de inimigos não aparecem no mapa, Alvo da missão é ped "unico" e diferente. Só é possivel fazer um numero bem limitado por dia, pois a janela para começar a missão é poucas horas apenas, requerindo extremo planejamento. --

	-- Facil --
	[1] = {
		firstname = "Alonzo",
		secondname = "Eager",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Fort Wallace",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 55,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn
		pos = {350.788, 1479.769, 178.596},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
		},
	spawnenemies = {
		{x = 351.423, y = 1462.482, z = 182.782, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
		{x = 350.788, y = 1479.769, z = 178.596, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 70},
		{x = 359.019, y = 1467.052, z = 182.745, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 30},
		{x = 358.909, y = 1472.086, z = 178.851, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 70},
		{x = 355.808, y = 1468.029, z = 178.699, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 60},
		{x = 350.765, y = 1471.688, z = 178.792, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
		{x = 354.060, y = 1473.770, z = 178.708, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
		{x = 357.625, y = 1476.734, z = 178.843, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 30},
		{x = 364.990, y = 1481.511, z = 179.213, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 70},
		{x = 360.272, y = 1484.737, z = 179.153, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 60},
		{x = 357.670, y = 1490.340, z = 179.121, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 50},
		}
	},

	[2] = {
		firstname = "Austin",
		secondname = "Majestic",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Fort Wallace",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 35,
		moneymax = 45,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn
		pos = {350.788, 1479.769, 178.596},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
		},
	spawnenemies = {
		{x = 351.423, y = 1462.482, z = 182.782, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
		{x = 350.788, y = 1479.769, z = 178.596, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
		{x = 359.019, y = 1467.052, z = 182.745, weapon ="WEAPON_MELEE_KNIFE", style = 2, accuracy = 80},
		{x = 358.909, y = 1472.086, z = 178.851, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 100},
		{x = 355.808, y = 1468.029, z = 178.699, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 3, accuracy = 60},
		{x = 364.990, y = 1481.511, z = 179.213, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 70},
		{x = 360.272, y = 1484.737, z = 179.153, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 60},
		{x = 357.670, y = 1490.340, z = 179.121, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 50},
		}
	},

	[3] = {
		firstname = "Carson",
		secondname = "Butcher",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Grizzlies West",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {-1894.111, 1354.839, 201.230},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -1892.049, y = 1346.595, z = 200.139, weapon ="WEAPON_PISTOL_MAUSER", style = 1, accuracy = 50},
			{x = -1898.788, y = 1347.496, z = 200.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1890.823, y = 1341.068, z = 200.742, weapon ="WEAPON_MELEE_KNIFE", style = 2, accuracy = 60},
			{x = -1884.726, y = 1334.646, z = 199.744, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = -1877.963, y = 1336.746, z = 200.299, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 60},
			{x = -1876.213, y = 1331.811, z = 201.242, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 50},
			{x = -1890.364, y = 1329.424, z = 198.903, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			}
		},

	[4] = {
		firstname = "Coleman",
		secondname = "Dove",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 20,
		moneymax = 50,
		showblips = true,
        timeO = 8, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		pos = {2518.337, 2284.414, 176.351},
		enemies = {
        	"G_M_M_BOUNTYHUNTERS_01",
            "G_M_M_UNIBANDITOS_01",
            "RE_STREET_FIGHT_MALES_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "MP_G_M_M_BOUNTYHUNTERS_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2518.337, y = 2284.414, z = 176.351, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = 2518.003, y = 2287.330, z = 176.342, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 60},
			{x = 2510.301, y = 2290.202, z = 176.351, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
        	}
    	},
		
	[5] = {
		firstname = "Lawrence", -- First Name 
		secondname = "Fierce", -- Last Name
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Van Horn", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 35, -- Money Minim
		moneymax = 45, -- Maxim Money
		showblips = true, -- npc blips
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {2825.905, 276.096, 47.112}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 2830.554, y = 277.781, z = 50.086, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 1, accuracy = 50},
			{x = 2828.820, y = 279.498, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 2831.466, y = 275.844, z = 50.086, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 30},
			{x = 2828.823, y = 272.757, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 90},
			{x = 2825.660, y = 269.900, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 60},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2818.052, y = 269.683, z = 47.023, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 80},
			{x = 2818.395, y = 265.704, z = 46.910, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 100},
			{x = 2823.057, y = 261.677, z = 46.701, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 60},
			}
		},

	[6] = { -- adicionar mais peds -- killer
		firstname = "Frank",
		secondname = "Clayton",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 20,
		moneymax = 40,
		showblips = true,
		timeO = 4, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {2415.179, 1763.965, 88.636},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2411.156, y = 1764.061, z = 88.659, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2413.866, y = 1756.755, z = 88.641, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2417.478, y = 1756.475, z = 88.648, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			}
		},

	[7] = {
		firstname = "Luke", -- First Name 
		secondname = "Famous", -- Last Name
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Van Horn", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 15, -- Money Minim
		moneymax = 30, -- Maxim Money
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		showblips = true, -- npc blips
		pos = {2825.905, 276.096, 47.112}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 2830.554, y = 277.781, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = 2828.820, y = 279.498, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2831.466, y = 275.844, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 30},
			{x = 2828.823, y = 272.757, z = 50.080, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = 2825.660, y = 269.900, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 60},
			}
		},

	[8] = {
		firstname = "John",
		secondname = "Morgan",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Kamassa Fort",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 30,
		moneymax = 55,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_017",
		arrestnpcwep = "WEAPON_REVOLVER_CATTLEMAN",
		pos = {2454.093, 290.076, 69.446},
		enemies = {
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2457.833, y = 285.286, z = 69.844, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 50},
			{x = 2450.265, y = 282.351, z = 69.516, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2449.772, y = 290.435, z = 69.331, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 60},
			{x = 2444.760, y = 291.103, z = 69.347, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 80},
			{x = 2445.225, y = 294.356, z = 69.342, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 60},
			{x = 2444.941, y = 285.890, z = 69.486, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = 2464.516, y = 296.537, z = 69.425, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 90},
			}
		},

	[9] = {
		firstname = "Tom",
		secondname = "Shelby",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Lagras",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 20,
		moneymax = 40,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {2152.999, -639.030, 41.512},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 2142.368, y = -641.802, z = 41.615, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 2140.187, y = -650.787, z = 41.308, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 30},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 100},
			{x = 2139.688, y = -630.237, z = 41.711, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 60},
			}
		},

	[10] = {
		firstname = "John",
		secondname = "Wesley",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Kamassa River",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 40,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_005",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {1875.951, -739.031, 41.697},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1893.843, y = -742.363, z = 41.269, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 50},
			{x = 1895.901, y = -737.034, z = 41.318, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 1888.955, y = -741.978, z = 40.862, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 30},
			{x = 1881.149, y = -737.367, z = 41.500, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 90},
			{x = 1876.535, y = -734.915, z = 41.647, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 60},
			{x = 1875.951, y = -739.031, z = 41.697, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 50},
			{x = 1869.166, y = -746.279, z = 41.878, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 1873.321, y = -756.536, z = 40.205, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			}
		},

	[39] = {
		firstname = "Steve",
		secondname = "Dias",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Benedict Point",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 50,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-5226, -3468, -21},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5232, y = -3488, z = -21, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50}, 
			{x = -5221, y = -3489, z = -21, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50}, 
			{x = -5208, y = -3492, z = -22, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50}, 
			{x = -5221, y = -3503, z = -22, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50}, 
			{x = -5213, y = -3464, z = -22, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40}, 
			{x = -5221, y = -3460, z = -21, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40}, 
			{x = -5232, y = -3464, z = -21, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40}, 
			{x = -5242, y = -3467, z = -22, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40}, 
			{x = -5241, y = -3486, z = -21, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40}, 
			}
		},

	[40] = {
		firstname = "Daniel",
		secondname = "Paladíno",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Hennigan's Stead",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 50,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-2722, -2378, 45},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -2737, y = -2391, z = 45, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50}, 
			{x = -2746, y = -2384, z = 45, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50}, 
			{x = -2736, y = -2368, z = 45, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50}, 
			{x = -2730, y = -2362, z = 45, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50}, 
			{x = -2715, y = -2350, z = 46, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -2710, y = -2355, z = 46, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -2700, y = -2359, z = 47, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = -2710, y = -2367, z = 46, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = -2724, y = -2383, z = 45, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = -2726, y = -2391, z = 45, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			{x = -2720, y = -2395, z = 45, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			{x = -2737, y = -2396, z = 45, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			}
		},
	[41] = {
		firstname = "Jorge",
		secondname = "Vasquez",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Moonstone Pond",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 50,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {1255, 1153, 151},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1255, y = 1153, z = 151, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1250, y = 1160, z = 151, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1271, y = 1157, z = 150, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1249, y = 1174, z = 150, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1233, y = 1166, z = 150, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1241, y = 1155, z = 151, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1257, y = 1168, z = 149, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1300, y = 1185, z = 150, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1240, y = 1192, z = 149, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1281, y = 1164, z = 150, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			}
		},
	[42] = {
		firstname = "Donald",
		secondname = "Biden",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Eris Field",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 50,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {1201, -568, 69},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1210, y = -558, z = 70, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1209, y = -572, z = 67, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1185, y = -564, z = 70, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50}, 
			{x = 1183, y = -554, z = 71, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1175, y = -531, z = 70, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1191, y = -529, z = 71, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = 1203, y = -537, z = 71, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = 1214, y = -545, z = 71, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = 1227, y = -542, z = 70, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			{x = 1235, y = -550, z = 68, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40},
			}
		},
	-- Médio --

	[11] = {
		firstname = "Pablo",
		secondname = "Fuentes",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 50,
		moneymax = 80,
		showblips = true,
        timeO = 13, -- time when ped's spawn
        timeC = 20, -- time after ped's don't spawn    
		pos = {2518.337, 2284.414, 176.351},
		enemies = {
        	"u_m_m_riodonkeyrider_01",
            "u_m_m_bht_banditomine",
            "u_m_m_bht_banditoshack"
        	},
        spawnenemies = {
			{x = 2518.337, y = 2284.414, z = 176.351, weapon ="WEAPON_SHOTGUN_PUMP", style = 1, accuracy = 90},
			{x = 2518.003, y = 2287.330, z = 176.342, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 50},
			{x = 2510.301, y = 2290.202, z = 176.351, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 90},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_MELEE_KNIFE", style = 3, accuracy = 50},
			{x = 2524.073, y = 2274.322, z = 175.382, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 65},
			{x = 2533.478, y = 2290.074, z = 175.553, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = 2531.568, y = 2298.568, z = 175.553, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = 2528.675, y = 2308.762, z = 175.528, weapon ="WEAPON_SHOTGUN_PUMP", style = 1, accuracy = 90},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_MELEE_KNIFE", style = 3, accuracy = 50},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = 2502.159, y = 2290.498, z = 175.576, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 90},
        	}
    	},

	[12] = {
		firstname = "Jesse",
		secondname = "James",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Kamassa Fort",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 60,
		moneymax = 90,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_016",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {2454.093, 290.076, 69.446},
		enemies = {
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2457.833, y = 285.286, z = 69.844, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 70},
			{x = 2450.265, y = 282.351, z = 69.516, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2449.772, y = 290.435, z = 69.331, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 30},
			{x = 2444.760, y = 291.103, z = 69.347, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2445.225, y = 294.356, z = 69.342, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 60},
			{x = 2444.941, y = 285.890, z = 69.486, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 50},
			{x = 2464.516, y = 296.537, z = 69.425, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 90},
			{x = 2459.933, y = 301.006, z = 73.785, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = 2463.902, y = 304.143, z = 75.257, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 60},
			{x = 2464.764, y = 294.484, z = 73.762, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 50},
			{x = 2464.505, y = 276.015, z = 77.343, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 70},
			}
		},

	[13] = {
		firstname = "John",
		secondname = "O'Driscoll",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Caliga Hall",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 60,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "u_m_m_unidusterleader_01",
		arrestnpcwep = "WEAPON_REVOLVER_SCHOFIELD_GOLDEN",
		pos = {2139.998, -1283.485, 48.648},
		enemies = {
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2141.893, y = -1279.383, z = 46.647, weapon ="WEAPON_REVOLVER_SCHOFIELD_GOLDEN", style = 2, accuracy = 50},
			{x = 2148.207, y = -1280.958, z = 43.877, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2147.214, y = -1275.279, z = 42.464, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 30},
			{x = 2141.110, y = -1276.752, z = 40.653, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2137.319, y = -1286.468, z = 40.997, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 60},
			{x = 2137.319, y = -1286.468, z = 40.997, weapon ="WEAPON_REVOLVER_SCHOFIELD_GOLDEN", style = 2, accuracy = 50},
			{x = 2133.597, y = -1295.544, z = 41.367, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2142.640, y = -1295.542, z = 41.328, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = 2140.791, y = -1303.533, z = 41.693, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 30},
			}
		},

	[14] = {
		firstname = "Luke",
		secondname = "Shane",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "The Heartlands",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 60,
		moneymax = 90,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-328.724, -150.561, 50.078},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"RE_STREET_FIGHT_MALES_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -327.0454711914063, y = -148.31842041015625, z = 50.0783805847168, weapon ="WEAPON_REVOLVER_LEMAT", style = 1, accuracy = 50},
			{x = -333.52783203125, y = -150.19760131835938, z = 49.68135452270508, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -321.2986145019531, y = -139.93321228027344, z = 49.47900009155273, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = -330.6002502441406, y = -131.9102325439453, z = 48.89569854736328, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = -341.7316589355469, y = -153.62220764160156, z = 49.67258071899414, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 60},
			{x = -344.3323059082031, y = -157.79139709472656, z = 49.75100708007812, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 50},
			{x = -350.87255859375, y = -149.2147216796875, z = 47.59628677368164, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -340.9605407714844, y = -130.2617645263672, z = 47.70182800292969, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			}
		},

	[15] = {
		firstname = "Louis",
		secondname = "West",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "BlackWater",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 30,
		moneymax = 50,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		pos = {-1022.902, -1625.756, 78.019},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -1024.012939453125, y = -1629.77001953125, z = 78.01721954345703, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 90},
			{x = -1029.842041015625, y = -1628.76318359375, z = 78.01721954345703, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 90},
			{x = -1033.0484619140625, y = -1627.07080078125, z = 78.0194091796875, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 90},
			{x = -1032.1298828125, y = -1623.450927734375, z = 78.01948547363281, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 100},
			{x = -1030.293701171875, y = -1616.7713623046875, z = 78.01255798339844, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 90},
			{x = -1024.066162109375, y = -1617.6036376953125, z = 78.02774047851562, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 90},
			{x = -1014.3487548828124, y = -1620.354248046875, z = 76.68476867675781, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 90},
			{x = -1015.94677734375, y = -1627.70849609375, z = 76.5450668334961, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 90,
			}
		},
	},

	[16] = {
		firstname = "Harry",
		secondname = "Ruben",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Strawberry",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		pos = {-1822.870, -615.853, 154.015},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -1822.504150390625, y = -619.4876098632812, z = 153.72825622558597, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 50},
			{x = -1827.7020263671875, y = -623.7704467773438, z = 154.0764617919922, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -1837.4794921875, y = -619.412353515625, z = 154.27456665039065, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 50},
			{x = -1835.999267578125, y = -604.9057006835938, z = 153.50624084472656, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -1830.0870361328127, y = -598.5430297851562, z = 153.52305603027344, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 60},
			{x = -1820.8236083984375, y = -603.2504272460938, z = 153.48550415039065, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 50},
			{x = -1823.6126708984375, y = -611.0455932617188, z = 153.57083129882812, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1820.5350341796875, y = -621.139892578125, z = 153.73394775390625, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -1823.6126708984375, y = -611.0455932617188, z = 153.57083129882812, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 60},
			{x = -1820.5350341796875, y = -621.139892578125, z = 153.73394775390625, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			}
		},

	[17] = {
		firstname = "Lawrence",
		secondname = "Holt",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Manzanita Post",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 45,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_footrobbery_males_01",
		arrestnpcwep = "WEAPON_PISTOL_MAUSER",
		pos = {-2075.823, -1891.929, 112.435},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -2074.119384765625, y = -1896.96142578125, z = 112.02962493896484, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 50},
			{x = -2066.340576171875, y = -1890.3817138671875, z = 111.51465606689452, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -2055.09765625, y = -1889.6636962890625, z = 110.53534698486328, weapon ="WEAPON_SHOTGUN_SAWEDOFF", style = 3, accuracy = 30},
			{x = -2050.241943359375, y = -1901.200439453125, z = 110.06202697753906, weapon ="WEAPON_SHOTGUN_SAWEDOFF", style = 3, accuracy = 100},
			{x = -2058.140625, y = -1922.553466796875, z = 112.37068939208984, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 60},
			{x = -2062.079345703125, y = -1925.900146484375, z = 112.32418060302736, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 50},
			{x = -2068.0703125, y = -1921.670166015625, z = 112.24359130859376, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -2078.05224609375, y = -1917.479248046875, z = 112.83971405029295, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = -2068.0703125, y = -1921.670166015625, z = 112.24359130859376, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -2078.05224609375, y = -1917.479248046875, z = 112.83971405029295, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			}
		},

	[18] = {
		firstname = "Levi",
		secondname = "Earle",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Armadillo",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 45,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_lostfriend_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_SAWEDOFF",
		pos = {-3321.158, -2862.516, -7.218},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -3317.5146484375, y = -2857.935791015625, z = -7.12080192565918, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = -3309.87158203125, y = -2852.912841796875, z = -7.10598421096801, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3314.68896484375, y = -2859.912841796875, z = -7.08675336837768, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = -3329.5693359375, y = -2863.86669921875, z = -7.08725357055664, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 0, accuracy = 100},
			{x = -3336.795166015625, y = -2858.9912109375, z = -7.12801504135131, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 60},
			{x = -3331.59326171875, y = -2874.1201171875, z = -7.05814886093139, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = -3319.8515625, y = -2873.189697265625, z = -7.10785150527954, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3308.48681640625, y = -2870.483154296875, z = -7.08247709274292, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 80},
			{x = -3319.8515625, y = -2873.189697265625, z = -7.10785150527954, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3308.48681640625, y = -2870.483154296875, z = -7.08247709274292, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
			}
		},

	[19] = {
		firstname = "Logan",
		secondname = "Riley",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Armadillo",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 30,
		moneymax = 50,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn
		pos = {-3842.241, -3009.168, -7.8008165359497},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -3845.37353515625, y = -3013.224365234375, z = -7.86573982238769, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = -3848.801025390625, y = -3011.947998046875, z = -7.83977079391479, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -3847.9609375, y = -3006.83447265625, z = -7.90665960311889, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = -3842.43017578125, y = -3009.55712890625, z = -7.87518119812011, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = -3844.692138671875, y = -3007.11669921875, z = -7.92386531829834, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 60},
			{x = -3846.041015625, y = -3000.040283203125, z = -7.97590065002441, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 50},
			{x = -3856.034423828125, y = -3005.73291015625, z = -8.25351667404174, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -3855.326171875, y = -3016.58935546875, z = -8.10537910461425, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 80},
			{x = -3856.034423828125, y = -3005.73291015625, z = -8.25351667404174, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3855.326171875, y = -3016.58935546875, z = -8.10537910461425, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 80},
			}
		},

	[43] = {
		firstname = "Steve",
		secondname = "Dias",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Benedict Point",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-5226, -3468, -21},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5232, y = -3488, z = -21, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5221, y = -3489, z = -21, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5208, y = -3492, z = -22, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5221, y = -3503, z = -22, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5213, y = -3464, z = -22, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5221, y = -3460, z = -21, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5232, y = -3464, z = -21, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5242, y = -3467, z = -22, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5241, y = -3486, z = -21, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5231, y = -3505, z = -22, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5215, y = -3453, z = -15, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5214, y = -3457, z = -15, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100}, 
			{x = -5228, y = -3476, z = -20, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100}, 
			{x = -5223, y = -3475, z = -21, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100}, 
			{x = -5224, y = -3471, z = -21, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100}, 
			}
		},

	[44] = {
		firstname = "Daniel",
		secondname = "Paladíno",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Hennigan's Stead",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-2722, -2378, 45},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -2737, y = -2391, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2746, y = -2384, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2736, y = -2368, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2730, y = -2362, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2715, y = -2350, z = 46, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = -2710, y = -2355, z = 46, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2700, y = -2359, z = 47, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2710, y = -2367, z = 46, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2724, y = -2383, z = 45, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2726, y = -2391, z = 45, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75}, 
			{x = -2720, y = -2395, z = 45, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100}, 
			{x = -2737, y = -2396, z = 45, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			}
		},

	[45] = {
		firstname = "Jorge",
		secondname = "Vasquez",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Moonstone Pond",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		pos = {1255, 1153, 151},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1255, y = 1153, z = 151, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1250, y = 1160, z = 151, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1271, y = 1157, z = 150, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1249, y = 1174, z = 150, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1233, y = 1166, z = 150, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1241, y = 1155, z = 151, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1257, y = 1168, z = 149, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1300, y = 1185, z = 150, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1240, y = 1192, z = 149, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 85},
			{x = 1281, y = 1164, z = 150, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 85},
			}
		},

	[46] = {
		firstname = "Donald",
		secondname = "Biden",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Eris Field",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		pos = {1201, -568, 69},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1210, y = -558, z = 70, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1209, y = -572, z = 67, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1185, y = -564, z = 70, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65}, 
			{x = 1183, y = -554, z = 71, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1175, y = -531, z = 70, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1191, y = -529, z = 71, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1203, y = -537, z = 71, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1214, y = -545, z = 71, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1227, y = -542, z = 70, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1235, y = -550, z = 68, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			}
		},

	-- Dificil --

	[20] = {
		firstname = "Billy", -- First Name 
		secondname = "Kid", -- Last Name
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Fort Wallace", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 140, -- Money Minim
		moneymax = 200, -- Maxim Money
		showblips = true, -- npc blips
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn
		pos = {350.788, 1479.769, 178.596}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 351.423, y = 1462.482, z = 182.782, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = 350.788, y = 1479.769, z = 178.596, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 85},
			{x = 359.019, y = 1467.052, z = 182.745, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 85},
			{x = 358.909, y = 1472.086, z = 178.851, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 2, accuracy = 100},
			{x = 355.808, y = 1468.029, z = 178.699, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 85},
			{x = 350.765, y = 1471.688, z = 178.792, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = 354.060, y = 1473.770, z = 178.708, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 85},
			{x = 357.625, y = 1476.734, z = 178.843, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 85},
			{x = 364.990, y = 1481.511, z = 179.213, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100},
			{x = 360.272, y = 1484.737, z = 179.153, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 357.670, y = 1490.340, z = 179.121, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = 352.280, y = 1493.374, z = 179.686, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 85},
			{x = 348.132, y = 1491.418, z = 178.545, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 85},
			{x = 343.162, y = 1486.257, z = 178.629, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 1, accuracy = 100},
			{x = 347.983, y = 1482.421, z = 178.638, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 348.700, y = 1475.864, z = 178.714, weapon ="WEAPON_REPEATER_WINCHESTER", style = 3, accuracy = 85},
			{x = 349.815, y = 1471.114, z = 178.754, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 85},
			{x = 345.663, y = 1479.426, z = 178.637, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 85},
			}
		},

	[21] = {
		firstname = "Bill",
		secondname = "Bones",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Grizzlies West",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 230,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {-1894.111, 1354.839, 201.230},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -1892.049, y = 1346.595, z = 200.139, weapon ="WEAPON_SNIPERRIFLE_ROLLINGBLOCK", style = 2, accuracy = 90},
			{x = -1898.788, y = 1347.496, z = 200.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 90},
			{x = -1890.823, y = 1341.068, z = 200.742, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 75},
			{x = -1884.726, y = 1334.646, z = 199.744, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 2, accuracy = 100},
			{x = -1877.963, y = 1336.746, z = 200.299, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 75},
			{x = -1876.213, y = 1331.811, z = 201.242, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 2, accuracy = 100},
			{x = -1890.364, y = 1329.424, z = 198.903, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1880.294, y = 1324.157, z = 200.388, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 90},
			{x = -1879.740, y = 1319.555, z = 201.512, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 2, accuracy = 100},
			{x = -1882.836, y = 1346.060, z = 201.475, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 75},
			{x = -1881.891, y = 1361.354, z = 202.405, weapon ="WEAPON_SNIPERRIFLE_ROLLINGBLOCK", style = 2, accuracy = 75},
			{x = -1884.190, y = 1354.513, z = 202.296, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 75},
			{x = -1891.196, y = 1357.857, z = 201.654, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 75},
			{x = -1899.243, y = 1358.593, z = 202.475, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 2, accuracy = 100},
			}
		},

	[22] = {
		firstname = "Carson",
		secondname = "Butcher",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Grizzlies West",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 180,
		moneymax = 275,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn
		arrestnpc = "mp_u_m_m_bountytarget_011",
		arrestnpcwep = "WEAPON_PISTOL_SEMIAUTO",
		pos = {-1894.111, 1354.839, 201.230},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -1892.049, y = 1346.595, z = 200.139, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -1898.788, y = 1347.496, z = 200.343, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 85},
			{x = -1890.823, y = 1341.068, z = 200.742, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = -1884.726, y = 1334.646, z = 199.744, weapon ="WEAPON_PISTOL_SEMIAUTO", style = 1, accuracy = 100},
			{x = -1877.963, y = 1336.746, z = 200.299, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = -1876.213, y = 1331.811, z = 201.242, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -1890.364, y = 1329.424, z = 198.903, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 90},
			{x = -1880.294, y = 1324.157, z = 200.388, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 80},
			{x = -1879.740, y = 1319.555, z = 201.512, weapon ="WEAPON_PISTOL_SEMIAUTO", style = 1, accuracy = 100},
			{x = -1882.836, y = 1346.060, z = 201.475, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = -1881.891, y = 1361.354, z = 202.405, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			}
		},

	[23] = {
		firstname = "Cassidy",
		secondname = "Clay",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 220,
		moneymax = 300,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {2518.337, 2284.414, 176.351},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2518.337, y = 2284.414, z = 176.351, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2518.003, y = 2287.330, z = 176.342, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 75},
			{x = 2510.301, y = 2290.202, z = 176.351, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2524.073, y = 2274.322, z = 175.382, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 80},
			{x = 2533.478, y = 2290.074, z = 175.553, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2531.568, y = 2298.568, z = 175.553, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 75},
			{x = 2528.675, y = 2308.762, z = 175.528, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2510.852, y = 2306.126, z = 176.155, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2502.159, y = 2290.498, z = 175.576, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100},
			{x = 2496.596, y = 2304.026, z = 178.703, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100},
			{x = 2533.478, y = 2290.074, z = 175.553, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2528.675, y = 2308.762, z = 175.528, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_WINCHESTER", style = 3, accuracy = 60}
			}
		},

	[24] = {
		firstname = "Dallas",
		secondname = "Bo",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Roanoke Valley",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 260,
		moneymax = 310,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_014",
		arrestnpcwep = "WEAPON_SHOTGUN_REPEATING",
		pos = {2415.179, 1763.965, 88.636},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2411.156, y = 1764.061, z = 88.659, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 75},
			{x = 2413.866, y = 1756.755, z = 88.641, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 75},
			{x = 2417.478, y = 1756.475, z = 88.648, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_SHOTGUN_REPEATING", style = 3, accuracy = 100},
			{x = 2418.042, y = 1753.005, z = 88.639, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2415.475, y = 1755.973, z = 88.658, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 75},
			{x = 2432.117, y = 1748.503, z = 85.395, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 75},
			{x = 2430.616, y = 1739.128, z = 87.830, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2432.646, y = 1735.200, z = 88.033, weapon ="WEAPON_SHOTGUN_REPEATING", style = 3, accuracy = 100},
			{x = 2428.249, y = 1732.029, z = 89.903, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2421.051, y = 1736.085, z = 92.474, weapon ="WEAPON_RIFLE_SPRINGFIELD", style =1, accuracy = 75},
			{x = 2414.679, y = 1741.126, z = 97.331, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 75},
			{x = 2420.652, y = 1742.413, z = 97.814, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2406.744, y = 1744.932, z = 100.674, weapon ="WEAPON_SHOTGUN_REPEATING", style = 3, accuracy = 100},
			{x = 2419.336, y = 1746.418, z = 102.255, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2432.058, y = 1751.083, z = 103.767, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 75},
			{x = 2435.551, y = 1754.996, z = 103.685, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 75},
			{x = 2428.817, y = 1753.665, z = 104.450, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2428.587, y = 1758.618, z = 103.793, weapon ="WEAPON_SHOTGUN_REPEATING", style = 3, accuracy = 75},
			{x = 2418.527, y = 1757.975, z = 104.844, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2415.475, y = 1755.973, z = 88.656, weapon ="WEAPON_SHOTGUN_REPEATING", style = 3, accuracy = 100},
			{x = 2432.117, y = 1748.503, z = 85.395, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2430.616, y = 1739.128, z = 87.830, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 75},
			{x = 2428.249, y = 1732.029, z = 89.903, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 75},
			{x = 2421.051, y = 1736.085, z = 92.474, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2414.679, y = 1741.126, z = 97.331, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 75}
			}
		},

	[25] = {
		firstname = "Flynn", -- First Name 
		secondname = "West", -- Last Name
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Van Horn", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 150, -- Money Minim
		moneymax = 210, -- Maxim Money
		showblips = true, -- npc blips
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {2825.905, 276.096, 47.112}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 2830.554, y = 277.781, z = 50.086, weapon ="WEAPON_SNIPERRIFLE_ROLLINGBLOCK", style = 1, accuracy = 50},
			{x = 2828.820, y = 279.498, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 2831.466, y = 275.844, z = 50.086, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2828.823, y = 272.757, z = 50.080, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 100},
			{x = 2825.660, y = 269.900, z = 50.080, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_SNIPERRIFLE_ROLLINGBLOCK", style = 1, accuracy = 50},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 2818.052, y = 269.683, z = 47.023, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2818.395, y = 265.704, z = 46.910, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 100},
			{x = 2823.057, y = 261.677, z = 46.701, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2827.988, y = 265.430, z = 46.692, weapon ="WEAPON_SNIPERRIFLE_ROLLINGBLOCK", style = 1, accuracy = 50},
			{x = 2832.753, y = 268.842, z = 46.735, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 2837.588, y = 274.929, z = 46.779, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2837.262, y = 280.503, z = 46.487, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 100},
			{x = 2833.758, y = 286.050, z = 46.827, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2826.362, y = 289.529, z = 48.804, weapon ="WEAPON_SNIPERRIFLE_ROLLINGBLOCK", style = 1, accuracy = 50},
			{x = 2823.990, y = 273.875, z = 47.093, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 2826.336, y = 281.973, z = 47.033, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2820.285, y = 273.055, z = 47.097, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 100},
			{x = 2817.590, y = 274.615, z = 48.079, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 2823.134, y = 266.353, z = 47.094, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			}
		},

	[26] = {
		firstname = "Flynn",
		secondname = "Earle",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Roanoke Valley",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 150,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {2415.179, 1763.965, 88.636},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2411.156, y = 1764.061, z = 88.659, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100},
			{x = 2413.866, y = 1756.755, z = 88.641, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2417.478, y = 1756.475, z = 88.648, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = 2418.042, y = 1753.005, z = 88.639, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2415.475, y = 1755.973, z = 88.658, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 50},
			{x = 2432.117, y = 1748.503, z = 85.395, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2430.616, y = 1739.128, z = 87.830, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2432.646, y = 1735.200, z = 88.033, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = 2428.249, y = 1732.029, z = 89.903, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2421.051, y = 1736.085, z = 92.474, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 50},
			{x = 2414.679, y = 1741.126, z = 97.331, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2420.652, y = 1742.413, z = 97.814, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2406.744, y = 1744.932, z = 100.674, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			}
		},

	[27] = {
		firstname = "Arthur",
		secondname = "Reuben",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Kamassa Fort",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_018",
		arrestnpcwep = "WEAPON_SHOTGUN_REPEATING",
		pos = {2454.093, 290.076, 69.446},
		enemies = {
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2457.833, y = 285.286, z = 69.844, weapon ="WEAPON_PISTOL_VOLCANIC", style = 1, accuracy = 75},
			{x = 2450.265, y = 282.351, z = 69.516, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = 2449.772, y = 290.435, z = 69.331, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2444.760, y = 291.103, z = 69.347, weapon ="WEAPON_SHOTGUN_REPEATING", style = 1, accuracy = 100},
			{x = 2445.225, y = 294.356, z = 69.342, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2444.941, y = 285.890, z = 69.486, weapon ="WEAPON_PISTOL_VOLCANIC", style = 1, accuracy = 75},
			{x = 2464.516, y = 296.537, z = 69.425, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2459.933, y = 301.006, z = 73.785, weapon ="WEAPON_SHOTGUN_REPEATING", style = 1, accuracy = 100},
			{x = 2463.902, y = 304.143, z = 75.257, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 75},
			{x = 2464.764, y = 294.484, z = 73.762, weapon ="WEAPON_PISTOL_VOLCANIC", style = 1, accuracy = 75},
			{x = 2464.505, y = 276.015, z = 77.343, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = 2452.501, y = 277.308, z = 73.886, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 75},
			{x = 2440.772, y = 279.744, z = 75.592, weapon ="WEAPON_SHOTGUN_REPEATING", style = 1, accuracy = 100},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2459.933, y = 301.006, z = 73.785, weapon ="WEAPON_SHOTGUN_REPEATING", style = 1, accuracy = 100},
			}
		},

	[28] = {
		firstname = "Arthur",
		secondname = "Ranger",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Lagras",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_CARCANO",
		pos = {2152.999, -639.030, 41.512},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 60},
			{x = 2142.368, y = -641.802, z = 41.615, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 60},
			{x = 2140.187, y = -650.787, z = 41.308, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100},
			{x = 2139.688, y = -630.237, z = 41.711, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2143.815, y = -630.337, z = 41.595, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 60},
			{x = 2143.568, y = -624.938, z = 40.558, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 60},
			{x = 2160.993, y = -619.492, z = 41.880, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2167.829, y = -617.446, z = 41.901, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 1, accuracy = 100},
			{x = 2151.583, y = -608.194, z = 40.589, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2136.700, y = -620.532, z = 40.619, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 60},
			{x = 2109.181, y = -622.289, z = 40.597, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 60},
			{x = 2100.792, y = -611.427, z = 40.878, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2094.865, y = -611.288, z = 44.118, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 1, accuracy = 100},
			{x = 2101.342, y = -604.517, z = 40.705, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2114.148, y = -592.870, z = 41.609, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 60},
			}
		},

	[29] = {
		firstname = "Porter",
		secondname = "Ray",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Lagras",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_007",
		arrestnpcwep = "WEAPON_REPEATER_WINCHESTER",
		pos = {2152.999, -639.030, 41.512},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2142.368, y = -641.802, z = 41.615, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2140.187, y = -650.787, z = 41.308, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2139.688, y = -630.237, z = 41.711, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2143.815, y = -630.337, z = 41.595, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2143.568, y = -624.938, z = 40.558, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 50},
			{x = 2160.993, y = -619.492, z = 41.880, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2126.144, y = -595.991, z = 41.576, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2124.218, y = -588.992, z = 41.530, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2134.709, y = -608.390, z = 40.766, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2152.969, y = -622.403, z = 40.536, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2161.172, y = -612.075, z = 40.448, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2109.181, y = -622.289, z = 40.597, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 50},
			{x = 2094.865, y = -611.288, z = 44.118, weapon ="WEAPON_REPEATER_WINCHESTER", style = 3, accuracy = 50},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_REPEATER_WINCHESTER", style = 3, accuracy = 50},
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_REPEATER_WINCHESTER", style = 3, accuracy = 50}
			}
		},

	[47] = {
		firstname = "Steve",
		secondname = "Dias",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Benedict Point",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-5226, -3468, -21},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5232, y = -3488, z = -21, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5221, y = -3489, z = -21, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5208, y = -3492, z = -22, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5221, y = -3503, z = -22, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5213, y = -3464, z = -22, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5221, y = -3460, z = -21, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5232, y = -3464, z = -21, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5242, y = -3467, z = -22, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5241, y = -3486, z = -21, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85}, 
			{x = -5231, y = -3505, z = -22, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85}, 
			{x = -5215, y = -3453, z = -15, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85}, 
			{x = -5214, y = -3457, z = -15, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85}, 
			{x = -5228, y = -3476, z = -20, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 1, accuracy = 100}, 
			{x = -5223, y = -3475, z = -21, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 1, accuracy = 100}, 
			{x = -5224, y = -3471, z = -21, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 1, accuracy = 100}, 
			}
		},

	[48] = {
		firstname = "Daniel",
		secondname = "Paladíno",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Hennigan's Stead",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-2722, -2378, 45},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -2737, y = -2391, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -2746, y = -2384, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -2736, y = -2368, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 90}, 
			{x = -2730, y = -2362, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -2715, y = -2350, z = 46, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 90},
			{x = -2710, y = -2355, z = 46, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = -2700, y = -2359, z = 47, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = -2710, y = -2367, z = 46, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85},
			{x = -2724, y = -2383, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85},
			{x = -2726, y = -2391, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85}, 
			{x = -2720, y = -2395, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85}, 
			{x = -2737, y = -2396, z = 45, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85},
			}
		},

	[49] = {
		firstname = "Jorge",
		secondname = "Vasquez",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Moonstone Pond",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {1255, 1153, 151},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1255, y = 1153, z = 151, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1250, y = 1160, z = 151, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1271, y = 1157, z = 150, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1249, y = 1174, z = 150, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1233, y = 1166, z = 150, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75},
			{x = 1241, y = 1155, z = 151, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 75},
			{x = 1257, y = 1168, z = 149, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 75},
			{x = 1300, y = 1185, z = 150, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1240, y = 1192, z = 149, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1281, y = 1164, z = 150, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			}
		},

	[50] = {
		firstname = "Donald",
		secondname = "Biden",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Eris Field",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {1201, -568, 69},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = 1210, y = -558, z = 70, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1209, y = -572, z = 67, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1185, y = -564, z = 70, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = 1183, y = -554, z = 71, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1175, y = -531, z = 70, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1191, y = -529, z = 71, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1203, y = -537, z = 71, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1214, y = -545, z = 71, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1227, y = -542, z = 70, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1235, y = -550, z = 68, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			}
		},
	-- Lendario --

	[30] = {
		firstname = "Lendário",
		secondname = "Barão das Carroças",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Saint Denis",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 700,
		showblips = false,
		timeO = 13, -- time when ped's spawn
		timeC = 15, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m-m-legedarybounty_09",
		arrestnpcwep = "WEAPON_PISTOL_M1899",
		pos = {2250, -793, 44},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"u_m_m_unibountyhunter_01",
			"u_m_m_unibountyhunter_01"
			},
		spawnenemies = {
			{x = 2249, y = -783, z = 44, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2256, y = -783, z = 44, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2250, y = -786, z = 44, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100},
			{x = 2253, y = -789, z = 44, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100},
			{x = 2253, y = -789, z = 44, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100},
			{x = 2247, y = -781, z = 44, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 2260, y = -781, z = 44, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 2258, y = -799, z = 44, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 2248, y = -799, z = 44, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, -- segurança ^
			{x = 2244, y = -748, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2247, y = -734, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2278, y = -736, z = 41, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2282, y = -761, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2277, y = -764, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2276, y = -783, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2267, y = -781, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2236, y = -764, z = 44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2240, y = -760, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2251, y = -715, z = 41, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80},
			{x = 2224, y = -729, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 80}, -- perimetro ^
			{x = 2297, y = -758, z = 42, weapon ="WEAPON_PISTOL_MAUSER", style = 3, accuracy = 90},
			{x = 2294, y = -747, z = 42, weapon ="WEAPON_PISTOL_MAUSER", style = 3, accuracy = 90},
			{x = 2304, y = -743, z = 41, weapon ="WEAPON_PISTOL_MAUSER", style = 3, accuracy = 90},
			{x = 2305, y = -759, z = 42, weapon ="WEAPON_REVOLVER_SCHOFIELD_GOLDEN", style = 3, accuracy = 90},
			{x = 2296, y = -777, z = 41, weapon ="WEAPON_REVOLVER_SCHOFIELD_GOLDEN", style = 3, accuracy = 90},
			{x = 2286, y = -793, z = 41, weapon ="WEAPON_REVOLVER_SCHOFIELD_GOLDEN", style = 3, accuracy = 90},
			{x = 2279, y = -807, z = 42, weapon ="WEAPON_REVOLVER_SCHOFIELD_GOLDEN", style = 3, accuracy = 90}, -- fronte ^
			}
		},
	[31] = {
		firstname = "Lendário",
		secondname = "Olhos de Águia",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Bolger Glade",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 400,
		moneymax = 700,
		showblips = false,
		timeO = 1, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "MP_U_M_M_LEGENDARYBOUNTY_003",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
		pos = {1502, -1834, 57},
		enemies = {
			"mp_u_m_m_bountytarget_028",
			"mp_fm_knownbounty_guards_01",
			"u_m_m_orpguard_01"
			},
		spawnenemies = {
			{x = 1513, y = -1833, z = 52, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1511, y = -1823, z = 53, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},  
			{x = 1506, y = -1818, z = 54, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89}, 
			{x = 1518, y = -1816, z = 53, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89}, 
			{x = 1519, y = -1819, z = 53, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1513, y = -1819, z = 54, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1507, y = -1808, z = 54, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},  
			{x = 1512, y = -1806, z = 54, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},  
			{x = 1529, y = -1808, z = 53, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1524, y = -1805, z = 54, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1530, y = -1817, z = 52, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1519, y = -1819, z = 53, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1479, y = -1844, z = 53, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1484, y = -1852, z = 55, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89}, 
			{x = 1505, y = -1856, z = 58, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1522, y = -1827, z = 51, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1494, y = -1772, z = 57, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},  
			{x = 1474, y = -1807, z = 55, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1480, y = -1825, z = 55, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1517, y = -1867, z = 56, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1528, y = -1867, z = 54, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1478, y = -1863, z = 52, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			{x = 1456, y = -1841, z = 55, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},  
			{x = 1498, y = -1802, z = 56, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 89},
			}
		},
	[32] = {
		firstname = "Lendário",
		secondname = "Homem Lobo",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Ambarino Glacier",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 450,
		moneymax = 800,
		showblips = false,
		timeO = 8, -- time when ped's spawn
		timeC = 12, -- time after ped's don't spawn    
		arrestnpc = "MP_U_M_M_LEGENDARYBOUNTY_004",
		arrestnpcwep = "WEAPON_RIFLE_SPRINGFIELD",
		pos = {-1578, 3123, 475},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"G_M_M_UNIBANDITOS_01",
			"U_M_M_BHT_ODRISCOLLSLEEPING",
			"RE_STREET_FIGHT_MALES_01",
			"MP_G_M_M_BOUNTYHUNTERS_01",
			"U_M_M_BHT_ODRISCOLLMAULED",
			"U_M_M_BHT_ODRISCOLLDRUNK"
			},
		spawnenemies = {
			{x = -1573, y = 3141, z = 479, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1576, y = 3151, z = 481, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1557, y = 3163, z = 475, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1550, y = 3170, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1553, y = 3170, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1558, y = 3169, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1543, y = 3068, z = 467, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 2, accuracy = 85},
			{x = -1558, y = 3059, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 2, accuracy = 85},
			{x = -1562, y = 3087, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 2, accuracy = 85},
			{x = -1572, y = 3110, z = 475, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1573, y = 3166, z = 479, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1501, y = 3131, z = 492, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1503, y = 3133, z = 490, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1498, y = 3118, z = 491, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1557, y = 3149, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			{x = -1555, y = 3135, z = 475, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85},
			}
		},
	[33] = {
		firstname = "Lendária",
		secondname = "Viúva Negra",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Little Creek River",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 650,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "MP_U_F_M_LEGENDARYBOUNTY_001",
		arrestnpcwep = "WEAPON_MELEE_KNIFE",
		pos = {-2460, 842, 146},
		enemies = {
			"mp_u_f_m_bountytarget_003",
			"mp_u_f_m_bountytarget_004",
			"mp_u_f_m_bountytarget_005",
			"mp_u_f_m_bountytarget_006",
			"mp_u_f_m_bountytarget_007",
			},
		spawnenemies = {
			{x = -2459, y = 838, z = 146, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2461, y = 838, z = 146, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2463, y = 838, z = 143, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2464, y = 844, z = 144, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2457, y = 846, z = 143, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2458, y = 855, z = 145, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2471, y = 843, z = 144, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90},
			{x = -2526, y = 853, z = 158, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, -
			{x = -2527, y = 852, z = 158, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, -
			{x = -2529, y = 850, z = 158, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, -
			{x = -2531, y = 848, z = 157, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},
			{x = -2514, y = 826, z = 148, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},
			{x = -2514, y = 830, z = 148, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},
			{x = -2519, y = 810, z = 147, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},
			{x = -2516, y = 808, z = 147, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},
			{x = -2511, y = 805, z = 145, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},
			{x = -2494, y = 859, z = 148, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 75}, ----
			{x = -2495, y = 855, z = 147, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 75},
			{x = -2492, y = 862, z = 149, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 75},
			{x = -2495, y = 863, z = 151, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 75},
			{x = -2502, y = 858, z = 151, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 75},
			{x = -2500, y = 867, z = 154, weapon ="WEAPON_REVOLVER_LEMAT", style = 3, accuracy = 75},	
			}
		},
	[34] = {
		firstname = "Lendaria",
		secondname = "Toca dos Bandidos",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Thieves Landing",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 450,
		moneymax = 800,
		showblips = true,
		timeO = 4, -- time when ped's spawn
		timeC = 6, -- time after ped's don't spawn    
		pos = {-1412, -2315, 43},
		enemies = {
			"mp_u_m_m_bountytarget_015",
			"mp_u_m_m_bountytarget_021",
			"mp_u_m_m_bountytarget_025",
			"mp_u_m_m_bountytarget_052",
			},
		spawnenemies = {
			{x = -1400, y = -2322, z = 47, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1399, y = -2313, z = 47, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1403, y = -2346, z = 48, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1400, y = -2346, z = 48, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1396, y = -2346, z = 48, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1409, y = -2344, z = 46, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -1418, y = -2333, z = 43, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1396, y = -2331, z = 43, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1391, y = -2336, z = 43, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1395, y = -2325, z = 43, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1430, y = -2282, z = 43, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1430, y = -2302, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75},
			{x = -1435, y = -2307, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1442, y = -2319, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1455, y = -2324, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1450, y = -2305, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1402, y = -2288, z = 44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1389, y = -2292, z = 44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1376, y = -2289, z = 44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1373, y = -2309, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1373, y = -2319, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1379, y = -2313, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1363, y = -2335, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1362, y = -2328, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1405, y = -2339, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1426, y = -2328, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1357, y = -2288, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80},
			{x = -1356, y = -2282, z = 45, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80},
			{x = -1359, y = -2295, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80},
			{x = -1358, y = -2307, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80},
			{x = -1352, y = -2307, z = 43, weapon ="WEAPON_PISTOL_VOLCANIC", style = 0, accuracy = 85},
			{x = -1352, y = -2299, z = 43, weapon ="WEAPON_PISTOL_VOLCANIC", style = 0, accuracy = 85},
			{x = -1352, y = -2292, z = 43, weapon ="WEAPON_PISTOL_VOLCANIC", style = 0, accuracy = 85},
			}
		},
	[35] = {
		firstname = "Lendário",
		secondname = "Javier Pascual",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Twin Rocks",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 350,
		moneymax = 850,
		showblips = true,
		timeO = 10, -- time when ped's spawn
		timeC = 13, -- time after ped's don't spawn    
		arrestnpc = "CS_MP_ALFREDO_MONTEZ",
		arrestnpcwep = "WEAPON_SHOTGUN_REPEATING",
		pos = {-4430, -2182, 43},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -4420, y = -2192, z = 45, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4419, y = -2188, z = 48, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4404, y = -2182, z = 49, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4406, y = -2170, z = 53, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4420, y = -2197, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -4408, y = -2201, z = 41, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4409, y = -2207, z = 39, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4418, y = -2208, z = 39, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4419, y = -2208, z = 39, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4415, y = -2191, z = 40, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4406, y = -2199, z = 41, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4439, y = -2212, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4444, y = -2217, z = 43, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -4373, y = -2184, z = 39, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4372, y = -2184, z = 38, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4372, y = -2186, z = 38, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4374, y = -2186, z = 38, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4373, y = -2189, z = 38, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4375, y = -2188, z = 38, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4369, y = -2184, z = 39, weapon ="WEAPON_MELEE_MACHETE", style = 3, accuracy = 85}, 
			{x = -4369, y = -2186, z = 39, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			{x = -4369, y = -2189, z = 38, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			{x = -4411, y = -2204, z = 40, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			{x = -4414, y = -2204, z = 39, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			{x = -4418, y = -2204, z = 39, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			{x = -4421, y = -2204, z = 40, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			{x = -4424, y = -2205, z = 40, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75}, 
			}
		},
	[36] = {
		firstname = "Lendário",
		secondname = "Juan Montoya",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Rathskeller Fork",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 320,
		moneymax = 800,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 12, -- time after ped's don't spawn    
		arrestnpc = "re_sharpshooter_males_01",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_CARCANO",
		pos = {-5193, -2106, 12},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5187, y = -2102, z = 17, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90},
			{x = -5176, y = -2113, z = 16, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90},
			{x = -5198, y = -2104, z = 17, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90},
			{x = -5202, y = -2108, z = 17, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90},
			{x = -5221, y = -2123, z = 13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5216, y = -2119, z = 13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5210, y = -2113, z = 13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5206, y = -2109, z = 13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5199, y = -2097, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5186, y = -2107, z = 13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5179, y = -2114, z = 13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5164, y = -2105, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5155, y = -2117, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5167, y = -2128, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5176, y = -2144, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5185, y = -2152, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5195, y = -2162, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5199, y = -2157, z = 12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = -5205, y = -2151, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 85},
			{x = -5212, y = -2144, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5212, y = -2147, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5205, y = -2133, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5195, y = -2134, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5187, y = -2132, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5181, y = -2139, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5174, y = -2116, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			{x = -5160, y = -2108, z = 12, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75},
			}
		},
	[37] = {
		firstname = "Lendária",
		secondname = "Lady Muerte",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Fort Mercer",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 750,
		showblips = false,
		timeO = 8, -- time when ped's spawn
		timeC = 11, -- time after ped's don't spawn    
		arrestnpc = "MP_U_F_M_LEGENDARYBOUNTY_03",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-4226, -3451, 42},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -4165, y = -3430, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4172, y = -3421, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4183, y = -3421, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4186, y = -3417, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4182, y = -3430, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4268, y = -3477, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4263, y = -3468, z = 41, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},		
			{x = -4239, y = -3471, z = 42, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -4257, y = -3468, z = 41, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4203, y = -3443, z = 40, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4186, y = -3426, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4189, y = -3423, z = 43, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = -4198, y = -3419, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4209, y = -3427, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4215, y = -3435, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4220, y = -3447, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4217, y = -3453, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4209, y = -3456, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4201, y = -3461, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4195, y = -3453, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4191, y = -3447, z = 45, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4185, y = -3446, z = 44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4177, y = -3450, z = 42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4200, y = -3463, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4207, y = -3459, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4226, y = -3482, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4232, y = -3477, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4243, y = -3484, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4242, y = -3497, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4255, y = -3478, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4247, y = -3465, z = 37, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75},
			{x = -4219, y = -3428, z = 42, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4225, y = -3445, z = 44, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4222, y = -3456, z = 42, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4246, y = -3450, z = 37, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4233, y = -3454, z = 37, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4229, y = -3512, z = 37, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4219, y = -3506, z = 37, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4188, y = -3428, z = 37, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4208, y = -3424, z = 37, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4187, y = -3446, z = 42, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4196, y = -3420, z = 38, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			}
		},
	[38] = {
		firstname = "Lendários",
		secondname = "Homens de Lata",
		image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Brandywine Drop",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 750,
		showblips = false,
		timeO = 6, -- time when ped's spawn
		timeC = 8, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_REPEATER_HENRY",
		pos = {2926, 2344, 158},
		enemies = {
			"mp_g_m_m_armoredjuggernauts_01"
			},
		spawnenemies = {
			{x = 2928, y = 2339, z = 158, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75},
			{x = 2930, y = 2336, z = 158, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75},
			{x = 2932, y = 2330, z = 158, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75},
			{x = 2933, y = 2324, z = 158, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75},
			{x = 2923, y = 2350, z = 157, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75}, 
			{x = 2918, y = 2359, z = 157, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75},
			{x = 2914, y = 2367, z = 157, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75}, 	
			{x = 2904, y = 2374, z = 158, weapon ="WEAPON_REPEATER_HENRY", style = 3, accuracy = 75}, -- rushas dentro
			{x = 2892, y = 2373, z = 158, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, -- c 0
			{x = 2928, y = 2306, z = 157, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, -- c 0
			{x = 2926, y = 2301, z = 157, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 70},
			{x = 2916, y = 2310, z = 157, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 70},
			{x = 2882, y = 2358, z = 158, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 70},
			{x = 2869, y = 2358, z = 157, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 70},
			{x = 2870, y = 2370, z = 159, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 70},
			{x = 2858, y = 2371, z = 157, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 70}, -- w 1
			{x = 2858, y = 2336, z = 158, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 75}, 
			{x = 2851, y = 2323, z = 157, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 75},
			}
		},

	},
}

function NOTIFY(text) --SET YOUR NOTIFYCATIONS
VorpCore.NotifyLeft(Config.Texts["tittle_notification"], text, "generic_textures", "tick", 5000, "COLOR_WHITE")
end

--[[
SetPedAccuracy -- Citizen 0x7AEFB85C1D49DEB6
accuracy = 0-100, 100 being perfectly accurate 

SetPedCombatMovement: -- Citizen 0x4D9CA1009AFBD057
0 - Stationary (Will just stand in place)
1 - Defensive (Will try to find cover and very likely to blind fire)
2 - Offensive (Will attempt to charge at enemy but take cover as well)
3 - Suicidal Offensive (Will try to flank enemy in a suicidal attack)
]] --