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

MissionAutoTime = 1800, -- every 60 minutes a new npc mission will be added ! <-- Se o servidor da RR 2x por dia, são 12 missões adicionadas, 60 minutos é muito tempo e corta a variação de missões.
DieNpcTime = 30, -- (30 seconds) Delete npc's after the player who took the bounty is dead !
DieBountyTime = 10, -- (60 seconds) Delete npc's after you killed the bounty target !
AlliveNpcTime = 60, -- (90 seconds) Delete npc's after you killed them all and finished the mission!
BountyBlip = 1481032477, -- Blip Type to Kill Bounty
BountyZone = 100.0, -- Blip Zone Area 
NearZone = 120, -- When to spawn the npc near location ! <-- 120 da a distancia do centro do minimapa até a borda onde o blip do local da missão começa a aparecer, é uma boa distancia.
TooFarAway = 550, -- Distance to Mission failed ! <- Distancia de falha, se precisar correr tu vai tomar tiro nas costas, essa distancia é boa para conseguir fugir caso de ruim, aumentar ou diminuir conforme necessario.
ServerYear = 1890, -- Server Year

Texts = {
    ["tittle_notification"] = "MISSÃO DE RECOMPENSA",
    ["bm_bountyblip"] = "ZONA DE MISSÃO",
    ["bm_arrestblip"] = "RECOMPENSA DE PRISÃO",
    ["bm_startkb"] = "Você acabou de começar a missão, vá para o local e elimine os fora-da-lei!",
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
    ["bm_failed"] = "Você matou a recompensa, ou morreu, e falhou nesta missão!",
    ["bm_hours"] = "Você pode encontrá-los entre as horas",
},

BountyMissions = {

	-- Dificuldades: Facil, Médio , Dificil e Lendário. --
	-- Facil: 1 a 2 pessoas, poucos inimigos e utilizam revolveres, armas brancas e repetidora carabina; Podem ser feitas durante o dia todo até a noite--
	-- Médio: 3 a 4 pessoas, alguns inimigos e utilizam repetidores e shotguns; Horarios mais curtos --
	-- Dificil: 4 a 6 pessoas, bastante inimigos e utilizam rifle de ferrolho, carcanos, e todo tipo de arma potente. Horarios perigosos e janela menor de tempo para começar, requer mais planejamento --
	-- Lendário: 6 a 10 pessoas, muitos inimigos, utilizam todo tipo de armamento e suas posições e comportamentos são pensados para o jogador utilizar estratégias e diversos tipos de equipamento para conseguir completar. Blips de inimigos não aparecem no mapa, Alvo da missão é ped "unico" e diferente. Só é possivel fazer um numero bem limitado por dia, pois a janela para começar a missão é poucas horas apenas, requerindo extremo planejamento. --
	-- Comportamento de NPC:
	-- 0 - Parado (Fica no Lugar) - Otimo para snipers e emboscadas de 12 -
 	-- 1 - Defensive (Vai procurar cbertura e atirar sem se expor muito)
 	-- 2 - Ofensiva (Vai rushar no player e procurar cobertura ao mesmo tempo)
	-- 3 - Ofensiva Suicida (Vai tentar flanquear o player em um ataque suicida)
	
	-- Facil --
	[1] = {
		firstname = "Alonzo",
		secondname = "Eager",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
        image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Kamassa River",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 40,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "re_darkalleystabbing_males_01",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Benedict Point",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 20,
		moneymax = 40,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-5225.37, 3471.41, -20.50},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5229.12, y = -3480.48, z = -20.51, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50},
			{x = -5221.94, y = -3482.74, z = -20.50, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50},
			{x = -5220.44, y = -3477.02, z = -20.51, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50},
			{x = -5222.37, y = -3457.53, z = -21.28, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 50},
			{x = -5224.78, y = -3475.49, z = -20.50, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40},
			{x = -5224.78, y = -3475.49, z = -20.50, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40},
			{x = -5227.63, y = -3471.22, z = -20.50, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40},
			{x = -5238.09, y = -3482.66, z = -21.17, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40},
			{x = -5239.03, y = -3467.87, z = -21.37, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 40},
			}
		},

	[40] = {
		firstname = "Daniel",
		secondname = "Paladíno",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Hennigan's Stead",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 35,
		moneymax = 70,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-2995.50, -2265.73, 50.47},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -2992.45, y = -2271.27, z = 49.64, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -2988.78, y = -2283.21, z = 48.46, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -2987.15, y = -2307.09, z = 48.58, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -2974.16, y = -2324.69, z = 49.11, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -2977.18, y = -2301.14, z = 49.30, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -3007.30, y = -2279.84, z = 47.96, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 50},
			{x = -3022.56, y = -2298.23, z = 46.39, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 40},
			{x = -2999.42, y = -2285.40, z = 40.56, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 40},
			{x = -2986.55, y = -2295.45, z = 40.94, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 40},
			{x = -2993.68, y = -2300.55, z = 40.40, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 40},
			{x = -2999.32, y = -2306.71, z = 39.90, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 40},
			{x = -2979.10, y = -2271.50, z = 41.67, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 2, accuracy = 40},
			}
		},
	[41] = {
		firstname = "Jorge",
		secondname = "Vasquez",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Moonstone Pond",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 50,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {1252.17, 1156.65, 151.26},
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
			{x = 1259.23, y = 1140.70, z = 149.09, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50}, 
			{x = 1253.83, y = 1151.07, z = 150.53, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1240.53, y = 1167.64, z = 150.06, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1239.24, y = 1182.96, z = 149.79, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1234.85, y = 1209.42, z = 150.22, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 1, accuracy = 50},
			{x = 1295.82, y = 1230.71, z = 153.20, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1315.40, y = 1204.66, z = 154.58, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1318.67, y = 1159.11, z = 156.72, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1329.89, y = 1185.73, z = 157.55, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			{x = 1307.55, y = 1202.80, z = 152.17, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 35},
			}
		},
	[42] = {
		firstname = "Donald",
		secondname = "Biden",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Eris Field",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 25,
		moneymax = 40,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 22, -- time after ped's don't spawn    
		pos = {1200.41, -568.0, 68.47}, 
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
			{x = 1216.10, y = -585.46, z = 70.00, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1205.16, y = -599.73, z = 70.49, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1187.19, y = -605.46, z = 71.51, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1180.98, y = -593.82, z = 69.92, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1182.78, y = -568.12, z = 69.77, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 50},
			{x = 1183.95, y = -556.50, z = 70.67, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			{x = 1173.74, y = -550.69, z = 72.59, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			{x = 1172.44, y = -538.12, z = 70.88, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			{x = 1176.78, y = -528.17, z = 69.91, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			{x = 1187.39, y = -527.46, z = 71.09, weapon ="WEAPON_REVOLVER_CATTLEMAN", style = 3, accuracy = 40}, 
			}
		},
	-- Médio --

	[11] = {
		firstname = "Pablo",
		secondname = "Fuentes",
        image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Armadillo",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 30,
		moneymax = 50,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn
		pos = {-3842.241, -3009.168, -7.8008165359497},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Benedict Point",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 70,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-5226.7, -3468.1, -20.50},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01" 
			},
		spawnenemies = {
			{x = -5231.75, y = -3475.24, z = -20.50, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5231.75, y = -3475.24, z = -20.50, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5231.75, y = -3475.24, z = -20.50, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5231.75, y = -3475.24, z = -20.50, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5231.77, y = -3468.33, z = -20.51, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5223.68, y = -3456.71, z = -21.30, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5216.85, y = -3456.87, z = -21.75, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -5217.18, y = -3487.64, z = -21.49, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5224.15, y = -3494.32, z = -21.52, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5218.97, y = -3498.39, z = -21.91, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5224.19, y = -3502.72, z = -22.09, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 85}, 
			{x = -5223.72, y = -3475.74, z = -20.52, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = -5227.71, y = -3475.39, z = -20.50, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = -5227.50, y = -3471.40, z = -20.49, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			{x = -5224.28, y = -3471.74, z = -20.50, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			}
		},

	[44] = {
		firstname = "Daniel",
		secondname = "Paladíno",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Hennigan's Stead",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 100,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-2995.50, -2265.73, 50.47},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -2992.45, y = -2271.27, z = 49.64, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2988.78, y = -2283.21, z = 48.46, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2987.15, y = -2307.09, z = 48.58, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2974.16, y = -2324.69, z = 49.11, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65}, 
			{x = -2977.18, y = -2301.14, z = 49.30, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = -3007.30, y = -2279.84, z = 47.96, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -3022.56, y = -2298.23, z = 46.39, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2999.42, y = -2285.40, z = 40.56, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2986.55, y = -2295.45, z = 40.94, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75},
			{x = -2993.68, y = -2300.55, z = 40.40, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 75}, 
			{x = -2999.32, y = -2306.71, z = 39.90, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100}, 
			{x = -2979.10, y = -2271.50, z = 41.67, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 100},
			}
		},

	[45] = {
		firstname = "Jorge",
		secondname = "Vasquez",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Moonstone Pond",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		pos = {1252.17, 1156.65, 151.26},
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
			{x = 1259.23, y = 1140.70, z = 149.09, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1253.83, y = 1151.07, z = 150.53, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1240.53, y = 1167.64, z = 150.06, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1239.24, y = 1182.96, z = 149.79, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1234.85, y = 1209.42, z = 150.22, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1295.82, y = 1230.71, z = 153.20, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1315.40, y = 1204.66, z = 154.58, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1318.67, y = 1159.11, z = 156.72, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1329.89, y = 1185.73, z = 157.55, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 85},
			{x = 1307.55, y = 1202.80, z = 152.17, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 3, accuracy = 85},
			}
		},

	[46] = {
		firstname = "Donald",
		secondname = "Biden",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Eris Field",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 40,
		moneymax = 80,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		pos = {1200.41, -568.0, 68.47},
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
			{x = 1216.10, y = -585.46, z = 70.00, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1205.16, y = -599.73, z = 70.49, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1187.19, y = -605.46, z = 71.51, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65}, 
			{x = 1180.98, y = -593.82, z = 69.92, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 65},
			{x = 1182.78, y = -568.12, z = 69.77, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1183.95, y = -556.50, z = 70.67, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1173.74, y = -550.69, z = 72.59, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1172.44, y = -538.12, z = 70.88, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1176.78, y = -528.17, z = 69.91, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			{x = 1187.39, y = -527.46, z = 71.09, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 65},
			}
		},

	-- Dificil --

	[20] = {
		firstname = "Billy", -- First Name 
		secondname = "Kid", -- Last Name
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Grizzlies West",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 230,
		showblips = true,
		arrestnpc = "mp_u_m_m_bountytarget_011",
		arrestnpcwep = "WEAPON_PISTOL_SEMIAUTO",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Lagras",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "re_darkalleystabbing_males_01",
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
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Benedict Point",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 140,
		moneymax = 190,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-5226.69, -3468.03, -20.50},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5230.76, y = -3491.03, z = -21.24, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5232.08, y = -3475.25, z = -20.49, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5230.93, y = -3464.45, z = -20.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5230.05, y = -3452.33, z = -21.47, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5208.92, y = -3461.28, z = -21.95, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5204.31, y = -3472.87, z = -21.92, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5203.49, y = -3482.43, z = -21.96, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5213.11, y = -3494.68, z = -21.92, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85},
			{x = -5270.07, y = -3453.91, z = -14.31, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = -5270.51, y = -3457.24, z = -14.61, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = -5232.69, y = -3447.05, z = -16.42, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = -5227.83, y = -3480.60, z = -17.32, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = -5213.54, y = -3456.58, z = -15.08, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = -5225.76, y = -3478.98, z = -20.51, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100},
			{x = -5231.87, y = -3484.09, z = -20.49, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100},
			{x = -5223.16, y = -3455.30, z = -21.46, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100},
			}
		},

	[48] = {
		firstname = "Daniel",
		secondname = "Paladíno",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Hennigan's Stead",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 120,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "re_crashedwagon_males_01",
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-2995.50, -2265.73, 50.47},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -2992.45, y = -2271.27, z = 49.64, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -2988.78, y = -2283.21, z = 48.46, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -2987.15, y = -2307.09, z = 48.58, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 90}, 
			{x = -2974.16, y = -2324.69, z = 49.11, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -2977.18, y = -2301.14, z = 49.30, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 90},
			{x = -3007.30, y = -2279.84, z = 47.96, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = -3022.56, y = -2298.23, z = 46.39, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = -2999.42, y = -2285.40, z = 40.56, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85},
			{x = -2986.55, y = -2295.45, z = 40.94, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85},
			{x = -2993.68, y = -2300.55, z = 40.40, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85}, 
			{x = -2999.32, y = -2306.71, z = 39.90, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85}, 
			{x = -2979.10, y = -2271.50, z = 41.67, weapon ="WEAPON_REPEATER_HENRY", style = 2, accuracy = 85},
			}
		},

	[49] = {
		firstname = "Jorge",
		secondname = "Vasquez",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Moonstone Pond",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 160,
		moneymax = 210,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {1252.17, 1156.65, 151.26},
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
			{x = 1259.23, y = 1140.70, z = 149.09, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 1253.83, y = 1151.07, z = 150.53, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 1240.53, y = 1167.64, z = 150.06, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 1239.24, y = 1182.96, z = 149.79, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 1234.85, y = 1209.42, z = 150.22, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 85},
			{x = 1295.82, y = 1230.71, z = 153.20, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = 1315.40, y = 1204.66, z = 154.58, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 85},
			{x = 1318.67, y = 1159.11, z = 156.72, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1329.89, y = 1185.73, z = 157.55, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1307.55, y = 1202.80, z = 152.17, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1279.63, y = 1210.09, z = 149.29, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1237.19, y = 1230.93, z = 152.62, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1230.84, y = 1189.66, z = 151.88, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1232.26, y = 1169.08, z = 149.97, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			{x = 1238.76, y = 1164.50, z = 150.21, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},
			}
		},

	[50] = {
		firstname = "Donald",
		secondname = "Biden",
		image = "https://i.ibb.co/6NCpmLh/bounties.png",
		city = "Eris Field",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 120,
		moneymax = 180,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		pos = {1200.41, -568.0, 68.47},
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
			{x = 1216.10, y = -585.46, z = 70.00, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1205.16, y = -599.73, z = 70.49, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1187.19, y = -605.46, z = 71.51, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = 1180.98, y = -593.82, z = 69.92, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1182.78, y = -568.12, z = 69.77, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85},
			{x = 1183.95, y = -556.50, z = 70.67, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1173.74, y = -550.69, z = 72.59, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1172.44, y = -538.12, z = 70.88, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1176.78, y = -528.17, z = 69.91, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			{x = 1187.39, y = -527.46, z = 71.09, weapon ="WEAPON_REPEATER_HENRY", style = 1, accuracy = 85},
			}
		},
	-- Lendário --

	[30] = {
		firstname = "Lendário",
		secondname = "Barão das Carroças",
		image = "https://i.ibb.co/4fRnhWV/barao.png",
		city = "Saint Denis",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 700,
		showblips = true,
		timeO = 13, -- time when ped's spawn
		timeC = 15, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m-m-legedarybounty_09",
		arrestnpcwep = "WEAPON_PISTOL_M1899",
		pos = {2719.28, -1049.31, 46.94},
		enemies = {
			"G_M_M_BOUNTYHUNTERS_01",
			"u_m_m_unibountyhunter_01",
			"u_m_m_unibountyhunter_01"
			},
		spawnenemies = {
			{x = 2714.83, y = -1050.28, z = 46.96, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2730.25, y = -1053.82, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2726.26, y = -1046.83, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2708.65, y = -1050.56, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2699.74, y = -1052.40, z = 46.95, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2715.57, y = -1060.15, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2750.21, y = -1041.80, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2745.84, y = -1059.09, z = 46.95, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2782.05, y = -1051.19, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2784.53, y = -1088.21, z = 46.88, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2777.22, y = -1095.35, z = 46.80, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2776.78, y = -1090.70, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2780.62, y = -1087.45, z = 46.91, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2729.47, y = -1092.59, z = 47.91, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2720.84, y = -1092.12, z = 47.91, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2687.81, y = -1105.14, z = 48.96, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2695.74, y = -1104.96, z = 48.87, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2689.12, y = -1099.37, z = 48.93, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2694.95, y = -1099.49, z = 48.93, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2691.49, y = -1101.24, z = 48.93, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2673.94, y = -1076.96, z = 46.95, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2672.23, y = -1067.71, z = 46.93, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2676.43, y = -1072.45, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2675.33, y = -1069.76, z = 46.94, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100},  -- 12
			{x = 2761.87, y = -1057.27, z = 50.07, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2777.31, y = -1066.73, z = 51.30, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2777.71, y = -1063.11, z = 51.30, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2782.01, y = -1054.85, z = 51.27, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2767.64, y = -1039.38, z = 51.30, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2754.80, y = -1086.70, z = 49.52, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2723.08, y = -1072.24, z = 46.97, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2728.10, y = -1072.09, z = 46.93, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2723.89, y = -1067.16, z = 47.45, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2726.64, y = -1067.06, z = 47.45, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2720.43, y = -1077.93, z = 50.47, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = 2708.25, y = -1064.04, z = 49.65, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100},  -- Carcano
			{x = 2733.96, y = -1067.37, z = 46.93, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2739.99, y = -1067.50, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2746.58, y = -1067.59, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2753.48, y = -1067.44, z = 46.90, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2762.31, y = -1069.24, z = 46.91, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2768.05, y = -1076.10, z = 46.91, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2713.73, y = -1067.34, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2705.04, y = -1067.38, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2697.90, y = -1067.33, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100}, 
			{x = 2687.70, y = -1068.51, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 100},  -- win 1
			{x = 2723.72, y = -1044.73, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2718.80, y = -1044.42, z = 46.87, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2751.20, y = -1038.05, z = 46.89, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2785.31, y = -1036.21, z = 46.91, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2786.41, y = -1060.17, z = 46.91, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2779.04, y = -1071.38, z = 46.94, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2772.14, y = -1068.43, z = 46.98, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2737.51, y = -1081.40, z = 47.55, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2699.83, y = -1089.79, z = 46.94, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2704.24, y = -1089.81, z = 46.94, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2690.12, y = -1090.38, z = 46.94, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2692.77, y = -1090.19, z = 46.94, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2676.02, y = -1079.15, z = 46.98, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = 2773.27, y = -1057.15, z = 46.94, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			}
		},
	[31] = {
		firstname = "Lendário",
		secondname = "Olhos de Águia",
		image = "https://i.ibb.co/rwPLK03/olhos.png",
		city = "Bolger Glade",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 400,
		moneymax = 850,
		showblips = false,
		timeO = 1, -- time when ped's spawn
		timeC = 3, -- time after ped's don't spawn    
		arrestnpc = "rcsp_formyart_males_01",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
		pos = {1502.19, -1831.63, 57.86},
		enemies = {
			"mp_u_m_m_bountytarget_028",
			"mp_fm_knownbounty_guards_01",
			"u_m_m_orpguard_01"
			},
		spawnenemies = {
			{x = 1494.62, y = -1835.02, z = 55.93, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1499.60, y = -1839.39, z = 56.82, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1506.66, y = -1835.42, z = 56.01, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1503.87, y = -1825.45, z = 56.21, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1491.57, y = -1816.65, z = 54.09, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1495.70, y = -1815.23, z = 54.20, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1505.56, y = -1810.92, z = 54.18, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1520.15, y = -1808.36, z = 53.59, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1529.61, y = -1815.16, z = 52.41, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1517.27, y = -1817.53, z = 53.45, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1486.73, y = -1825.84, z = 53.96, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1474.86, y = -1839.58, z = 52.78, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1483.41, y = -1841.91, z = 52.84, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1504.71, y = -1854.72, z = 58.37, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1518.89, y = -1852.81, z = 56.18, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1520.81, y = -1827.96, z = 50.75, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1512.51, y = -1835.15, z = 52.23, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1497.13, y = -1842.25, z = 54.48, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1480.09, y = -1824.90, z = 55.33, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1519.73, y = -1813.89, z = 54.60, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1476.47, y = -1851.84, z = 55.63, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1470.46, y = -1846.69, z = 55.92, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1475.10, y = -1807.57, z = 55.20, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, 
			{x = 1526.79, y = -1803.83, z = 53.40, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 95}, -- Snipers
			{x = 1540.38, y = -1778.83, z = 54.83, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95}, 
			{x = 1546.19, y = -1782.32, z = 54.04, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1554.00, y = -1787.22, z = 53.03, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1569.82, y = -1796.82, z = 51.78, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1576.95, y = -1801.41, z = 51.46, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1553.90, y = -1853.40, z = 50.42, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1549.09, y = -1858.47, z = 50.85, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1517.32, y = -1882.58, z = 54.73, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1490.02, y = -1886.89, z = 50.17, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1572.68, y = -1817.74, z = 51.33, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1558.36, y = -1839.55, z = 50.41, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1554.21, y = -1844.90, z = 50.79, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95},
			{x = 1490.07, y = -1859.51, z = 53.02, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 95}, -- repetidor
			{x = 1510.91, y = -1823.57, z = 52.92, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100},
			{x = 1517.85, y = -1827.77, z = 51.39, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100},
			{x = 1523.54, y = -1817.62, z = 52.95, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100},
			{x = 1513.00, y = -1811.43, z = 52.88, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, -- 12
			{x = 1462.30, y = -1784.59, z = 57.05, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 95},
			{x = 1460.23, y = -1804.44, z = 55.61, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 95},
			{x = 1450.49, y = -1814.87, z = 56.14, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 95},
			{x = 1467.42, y = -1770.33, z = 58.93, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 0, accuracy = 95},
			{x = 1524.98, y = -1768.84, z = 56.28, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},-- rush inicio
			{x = 1494.78, y = -1773.10, z = 57.11, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1470.84, y = -1791.69, z = 56.12, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1466.96, y = -1831.31, z = 53.62, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1498.20, y = -1803.43, z = 55.22, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1521.40, y = -1797.29, z = 54.10, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1505.27, y = -1798.48, z = 54.98, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1500.70, y = -1801.71, z = 55.31, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1496.61, y = -1805.43, z = 54.92, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1489.10, y = -1811.81, z = 54.54, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1483.93, y = -1814.69, z = 54.48, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1478.81, y = -1817.33, z = 54.84, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95},
			{x = 1536.42, y = -1808.21, z = 52.50, weapon ="WEAPON_PISTOL_MAUSER", style = 2, accuracy = 95}, -- rush fim
			{x = 1488.25, y = -1763.16, z = 58.84, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 89}, 
			{x = 1475.35, y = -1777.76, z = 57.75, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 89}, 
			{x = 1471.38, y = -1790.49, z = 56.32, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 89}, 
			{x = 1459.76, y = -1803.84, z = 55.62, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 89}, 
			{x = 1505.89, y = -1777.41, z = 56.28, weapon ="WEAPON_REPEATER_WINCHESTER,", style = 0, accuracy = 89}, 
			{x = 1515.20, y = -1767.84, z = 57.06, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 89}, -- estatico
			{x = 1587.56, y = -1839.04, z = 58.55, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 100}, -- bolt janela
			}
		},
	[32] = {
		firstname = "Lendário",
		secondname = "Homem Lobo",
		image = "https://i.ibb.co/BrYKmsc/lobo.png",
		city = "Ambarino Glacier",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 450,
		moneymax = 600,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 12, -- time after ped's don't spawn    
		arrestnpc = "MP_U_M_M_LEGENDARYBOUNTY_004",
		arrestnpcwep = "WEAPON_RIFLE_SPRINGFIELD",
		pos = {-1574.86, 3127.67, 474.64}, {x = -1578.22, y = 3160.59, z = 480.26}
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
			{x = -1575.86, y = 3150.79, z = 480.61, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1572.23, y = 3162.85, z = 479.83, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1574.25, y = 3158.93, z = 480.32, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1555.85, y = 3166.26, z = 474.63, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1546.46, y = 3142.11, z = 474.64, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1575.25, y = 3122.98, z = 474.64, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1577.45, y = 3137.02, z = 478.35, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 2, accuracy = 85}, 
			{x = -1574.13, y = 3143.05, z = 478.93, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 2, accuracy = 85}, 
			{x = -1562.50, y = 3147.68, z = 477.49, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 2, accuracy = 85}, --
			{x = -1511.19, y = 3116.89, z = 489.68, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1517.70, y = 3123.58, z = 485.74, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1499.19, y = 3118.55, z = 491.48, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1494.80, y = 3108.83, z = 488.39, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1522.36, y = 3132.41, z = 480.83, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1532.11, y = 3129.24, z = 478.49, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1540.10, y = 3122.35, z = 476.04, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1551.94, y = 3109.58, z = 475.79, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 85}, 
			{x = -1562.27, y = 3087.10, z = 475.41, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1553.35, y = 3090.32, z = 474.80, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1563.45, y = 3105.31, z = 474.64, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1563.01, y = 3116.36, z = 474.59, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1511.61, y = 3116.82, z = 489.60, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1507.05, y = 3116.39, z = 490.02, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			{x = -1507.05, y = 3116.39, z = 490.02, weapon ="WEAPON_RIFLE_SPRINGFIELD", style = 1, accuracy = 85}, 
			}
		},
	[33] = {
		firstname = "Lendária",
		secondname = "Viúva Negra",
		image = "https://i.ibb.co/6DvvzKn/viuva.png",
		city = "Big Valley",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 400,
		moneymax = 650,
		showblips = true,
		timeO = 18, -- time when ped's spawn
		timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "mp_u_f_m_bountytarget_013",
		arrestnpcwep = "WEAPON_SHOTGUN_SEMIAUTO",
		pos = {-2349.08, 111.57, 218.45},
		enemies = {
			"mp_u_f_m_bountytarget_003",
			"mp_u_f_m_bountytarget_004",
			"mp_u_f_m_bountytarget_005",
			"mp_u_f_m_bountytarget_006",
			"mp_u_f_m_bountytarget_007",
			},
		spawnenemies = {
			{x = -2366.43, y = 110.83, z = 216.83, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90}, 
			{x = -2370.64, y = 116.51, z = 216.81, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90}, 
			{x = -2349.91, y = 109.42, z = 218.48, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90}, 
			{x = -2343.62, y = 111.10, z = 220.56, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 90}, 
			{x = -2336.33, y = 107.00, z = 222.75, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 90},
			{x = -2334.63, y = 102.89, z = 222.58, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 90}, 
			{x = -2328.58, y = 98.67, z = 221.86, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 90}, 
			{x = -2311.39, y = 79.75, z = 229.17, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = -2301.32, y = 95.45, z = 232.12, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = -2317.76, y = 97.60, z = 231.16, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = -2326.29, y = 95.17, z = 232.16, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = -2341.10, y = 90.44, z = 233.34, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = -2302.98, y = 57.69, z = 227.31, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = -2375.49, y = 63.03, z = 206.56, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2378.20, y = 66.29, z = 207.02, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2382.02, y = 67.41, z = 206.30, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2378.27, y = 68.89, z = 208.10, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2387.70, y = 69.57, z = 205.08, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2392.02, y = 71.03, z = 204.25, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2396.16, y = 71.75, z = 203.77, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2399.11, y = 72.19, z = 203.53, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2402.45, y = 68.42, z = 202.37, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100},  
			{x = -2408.57, y = 92.34, z = 208.86, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2411.98, y = 88.08, z = 206.93, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2414.72, y = 85.42, z = 205.62, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2406.17, y = 84.78, z = 206.70, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2405.81, y = 78.34, z = 204.09, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2411.29, y = 79.64, z = 204.04, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2414.66, y = 77.66, z = 202.95, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2419.79, y = 78.58, z = 202.36, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100}, 
			{x = -2399.47, y = 79.97, z = 205.75, weapon ="WEAPON_REVOLVER_LEMAT", style = 2, accuracy = 100},  -- rush
			{x = -2352.31, y = 50.05, z = 214.71, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 100}, 
			{x = -2355.23, y = 46.08, z = 215.44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 100}, 
			{x = -2360.56, y = 51.31, z = 211.78, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 100}, 
			{x = -2361.39, y = 54.61, z = 210.18, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 100}, 
			{x = -2365.78, y = 52.54, z = 209.75, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 100}, 
			{x = -2346.92, y = 58.90, z = 214.10, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 100},  -- repetidor rush
			{x = -2370.91, y = 37.26, z = 220.33, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100},
			{x = -2362.54, y = 36.86, z = 218.05, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2381.24, y = 24.10, z = 215.69, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2385.75, y = 32.67, z = 217.01, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2387.12, y = 21.21, z = 213.79, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2373.93, y = 42.69, z = 215.57, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2377.47, y = 44.05, z = 213.81, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100},  
			{x = -2306.74, y = 86.87, z = 228.58, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2309.30, y = 84.02, z = 228.84, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2311.90, y = 75.81, z = 228.74, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2323.84, y = 76.73, z = 220.71, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2322.86, y = 96.81, z = 221.64, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2314.51, y = 90.36, z = 222.98, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2318.35, y = 92.30, z = 222.03, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2322.17, y = 82.28, z = 220.86, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2327.25, y = 96.03, z = 232.46, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -2382.32, y = 47.21, z = 211.14, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100},  -- carcano
			}
		},
	[34] = {
		firstname = "Lendaria",
		secondname = "Toca dos Bandidos",
		image = "https://i.ibb.co/phmp8cP/toca.png",
		city = "Thieves Landing", 
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 500,
		showblips = false,
		timeO = 4, -- time when ped's spawn
		timeC = 6, -- time after ped's don't spawn    
		pos = {-1408.69, -2307.29, 43.16},
		enemies = {
			"mp_u_m_m_bountytarget_015",
			"mp_u_m_m_bountytarget_021",
			"mp_u_m_m_bountytarget_025",
			"mp_u_m_m_bountytarget_052",
			},
		spawnenemies = {
			{x = -1402.25, y = -2345.87, z = 47.54, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1408.91, y = -2343.35, z = 46.51, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1395.25, y = -2346.14, z = 47.51, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1399.89, y = -2321.66, z = 46.65, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1399.00, y = -2313.10, z = 46.65, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1433.47, y = -2278.95, z = 46.41, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -1397.57, y = -2304.96, z = 43.04, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1391.72, y = -2335.70, z = 42.89, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1387.55, y = -2316.71, z = 43.69, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1406.94, y = -2286.16, z = 43.03, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1419.71, y = -2332.79, z = 43.04, weapon ="WEAPON_SHOTGUN_REPEATING", style = 0, accuracy = 100}, 
			{x = -1434.18, y = -2282.39, z = 43.08, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1404.37, y = -2292.49, z = 43.57, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1383.81, y = -2289.15, z = 43.57, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1389.75, y = -2302.77, z = 41.91, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1373.36, y = -2310.07, z = 42.19, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1372.41, y = -2318.87, z = 42.19, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1361.03, y = -2330.50, z = 42.90, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1368.58, y = -2337.22, z = 42.88, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1379.76, y = -2337.75, z = 42.88, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1399.65, y = -2330.75, z = 43.11, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1407.17, y = -2340.88, z = 43.10, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1418.07, y = -2341.48, z = 42.97, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1443.16, y = -2319.74, z = 43.21, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1445.94, y = -2303.15, z = 43.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1434.32, y = -2299.50, z = 43.17, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -1358.36, y = -2294.44, z = 43.46, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80}, 
			{x = -1355.90, y = -2281.51, z = 44.63, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80}, 
			{x = -1358.12, y = -2288.03, z = 43.57, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80}, 
			{x = -1358.43, y = -2307.71, z = 43.46, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 80}, 
			{x = -1351.93, y = -2304.66, z = 43.46, weapon ="WEAPON_PISTOL_VOLCANIC", style = 0, accuracy = 85}, 
			{x = -1351.77, y = -2299.69, z = 43.46, weapon ="WEAPON_PISTOL_VOLCANIC", style = 0, accuracy = 85}, 
			{x = -1351.73, y = -2292.48, z = 43.46, weapon ="WEAPON_PISTOL_VOLCANIC", style = 0, accuracy = 85}, 
			}
		},
	[35] = {
		firstname = "Lendário",
		secondname = "Javier Pascual",
		image = "https://i.ibb.co/F09KZ1V/javier.png",
		city = "Twin Rocks",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 450,
		moneymax = 750,
		showblips = true,
		timeO = 10, -- time when ped's spawn
		timeC = 13, -- time after ped's don't spawn    
		arrestnpc = "CS_MP_ALFREDO_MONTEZ",
		arrestnpcwep = "WEAPON_SHOTGUN_REPEATING",
		pos = {-4414.83, -2191.02, 39.79},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -4412.95, y = -2191.97, z = 45.40, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4415.74, y = -2181.01, z = 49.31, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4435.01, y = -2196.61, z = 48.66, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4405.09, y = -2201.24, z = 40.88, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4406.47, y = -2181.98, z = 49.00, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4389.80, y = -2166.07, z = 48.90, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4399.72, y = -2166.52, z = 53.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4406.15, y = -2198.87, z = 40.90, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4408.70, y = -2207.07, z = 39.57, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4419.81, y = -2206.71, z = 39.10, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4416.79, y = -2207.70, z = 38.84, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4425.94, y = -2186.53, z = 43.32, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4420.49, y = -2191.93, z = 44.83, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -4382.75, y = -2192.29, z = 38.28, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4380.67, y = -2193.03, z = 37.66, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4378.36, y = -2194.53, z = 37.38, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4383.65, y = -2194.29, z = 38.35, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4381.41, y = -2196.60, z = 37.74, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4378.30, y = -2201.16, z = 36.69, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4384.63, y = -2199.64, z = 37.69, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 85}, 
			{x = -4411.56, y = -2202.60, z = 39.80, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			{x = -4411.82, y = -2205.35, z = 39.59, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			{x = -4414.11, y = -2203.27, z = 39.39, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			{x = -4416.47, y = -2203.48, z = 39.25, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			{x = -4420.33, y = -2203.84, z = 39.48, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			{x = -4422.51, y = -2206.37, z = 39.61, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			{x = -4415.98, y = -2196.76, z = 40.04, weapon ="WEAPON_PISTOL_VOLCANIC", style = 3, accuracy = 75},
			}
		},
	[36] = {
		firstname = "Lendário",
		secondname = "Juan Montoya",
		image = "https://i.ibb.co/znJ53W9/juan.png",
		city = "Rathskeller Fork",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 320,
		moneymax = 560,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 12, -- time after ped's don't spawn    
		arrestnpc = "re_sharpshooter_males_01",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_CARCANO",
		pos = {-5194.92, -2099.81, 12.44},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -5176.07, y = -2112.24, z = 16.38, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = -5190.89, y = -2103.59, z = 16.31, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = -5208.45, y = -2105.82, z = 17.07, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = -5221.32, y = -2118.84, z = 17.09, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = -5221.00, y = -2123.33, z = 12.73, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5217.19, y = -2119.95, z = 12.73, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5210.09, y = -2113.19, z = 12.73, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5185.63, y = -2108.13, z = 12.66, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5179.16, y = -2114.39, z = 12.66, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5177.24, y = -2142.70, z = 12.12, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5166.16, y = -2127.06, z = 12.27, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5168.00, y = -2110.30, z = 12.32, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5184.56, y = -2148.82, z = 12.13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5209.67, y = -2148.76, z = 12.02, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5226.08, y = -2131.43, z = 12.13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5195.80, y = -2107.17, z = 12.44, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5188.52, y = -2111.81, z = 12.41, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5196.30, y = -2127.78, z = 12.24, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 85}, 
			{x = -5167.72, y = -2121.38, z = 12.15, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 85}, 
			{x = -5172.99, y = -2125.05, z = 12.04, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5180.62, y = -2135.71, z = 12.05, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5192.20, y = -2132.14, z = 12.10, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5198.22, y = -2136.18, z = 12.10, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5214.74, y = -2145.83, z = 11.95, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5218.78, y = -2139.53, z = 11.90, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5215.68, y = -2142.74, z = 11.97, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			{x = -5217.44, y = -2127.79, z = 12.31, weapon ="WEAPON_REVOLVER_SCHOFIELD", style = 3, accuracy = 75}, 
			}
		},
	[37] = {
		firstname = "Lendária",
		secondname = "Lady Muerte",
		image = "https://i.ibb.co/QC8gBN5/lady.png",
		city = "Fort Mercer",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
		moneymin = 450,
		moneymax = 800,
		showblips = true,
		timeO = 8, -- time when ped's spawn
		timeC = 11, -- time after ped's don't spawn    
		arrestnpc = "MP_U_F_M_LEGENDARYBOUNTY_03", -- não buga (amém)
		arrestnpcwep = "WEAPON_SHOTGUN_PUMP",
		pos = {-4215.32, -3458.79, 41.53},
		enemies = {
			"mp_fm_bounty_horde_males_01",
			"u_m_m_bht_banditomine",
			"u_m_m_bht_banditoshack",
			"MP_FM_BOUNTYTARGET_MALES_DLC008_01",
			"u_m_m_riodonkeyrider_01"
			},
		spawnenemies = {
			{x = -4259.59, y = -3470.22, z = 41.25, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4268.02, y = -3477.80, z = 42.54, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4251.25, y = -3451.23, z = 42.54, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4236.40, y = -3424.48, z = 45.53, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4235.21, y = -3417.17, z = 42.63, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4197.12, y = -3407.48, z = 45.35, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4211.18, y = -3406.14, z = 41.76, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85},	
			{x = -4186.23, y = -3417.92, z = 42.55, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4184.08, y = -3420.95, z = 42.53, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4188.78, y = -3423.36, z = 42.63, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4166.15, y = -3428.42, z = 42.56, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4185.81, y = -3442.43, z = 41.90, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4203.71, y = -3443.87, z = 40.13, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4207.69, y = -3437.67, z = 37.14, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4217.54, y = -3476.34, z = 41.00, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 85}, 
			{x = -4222.92, y = -3486.07, z = 37.25, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4234.22, y = -3476.43, z = 37.11, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4245.47, y = -3487.68, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4238.83, y = -3465.38, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4216.79, y = -3437.69, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4210.49, y = -3426.57, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4185.14, y = -3438.61, z = 37.18, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4195.13, y = -3445.46, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4198.38, y = -3458.74, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4212.68, y = -3450.81, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4217.96, y = -3435.15, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4214.11, y = -3430.09, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4225.51, y = -3455.86, z = 37.13, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4225.31, y = -3471.20, z = 37.10, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4214.50, y = -3477.20, z = 37.08, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4203.89, y = -3419.43, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4220.73, y = -3444.23, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4213.22, y = -3456.14, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4200.65, y = -3461.78, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, -- win 1
			{x = -4177.18, y = -3420.60, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 75},
			{x = -4186.05, y = -3410.66, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 75},
			{x = -4194.47, y = -3404.87, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 75},
			{x = -4169.18, y = -3419.22, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 75},
			{x = -4161.67, y = -3410.27, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 75},
			{x = -4189.68, y = -3407.18, z = 37.14, weapon ="WEAPON_REPEATER_WINCHESTER", style = 2, accuracy = 75}, -- win 2
			{x = -4213.56, y = -3432.24, z = 41.54, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75},
			{x = -4215.79, y = -3436.23, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4217.69, y = -3440.78, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4219.34, y = -3444.23, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4221.62, y = -3448.93, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4217.91, y = -3453.20, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4212.49, y = -3455.31, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4206.97, y = -3457.90, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75},
			{x = -4202.78, y = -3460.01, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 75}, -- win 0
			{x = -4200.65, y = -3461.78, z = 41.53, weapon ="WEAPON_REPEATER_WINCHESTER", style = 1, accuracy = 75}, 
			{x = -4188.33, y = -3429.18, z = 37.14, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4206.61, y = -3422.79, z = 37.14, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4233.08, y = -3454.35, z = 37.16, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4227.85, y = -3511.85, z = 37.13, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4218.95, y = -3506.56, z = 37.16, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4222.46, y = -3427.41, z = 41.53, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4191.63, y = -3457.26, z = 41.53, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4208.75, y = -3435.78, z = 37.14, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4225.29, y = -3459.05, z = 37.12, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4224.96, y = -3480.87, z = 37.14, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4247.64, y = -3455.79, z = 41.31, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4203.55, y = -3420.11, z = 37.09, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = -4194.35, y = -3462.16, z = 37.28, weapon ="WEAPON_REPEATER_WINCHESTER", style = 0, accuracy = 100}, 
			{x = -4178.56, y = -3454.95, z = 41.47, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4214.59, y = -3502.30, z = 42.65, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4188.11, y = -3449.20, z = 44.55, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4194.47, y = -3452.61, z = 44.56, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4204.78, y = -3461.95, z = 45.35, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4200.93, y = -3465.20, z = 45.28, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4217.06, y = -3461.00, z = 44.90, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 100}, 
			{x = -4232.24, y = -3455.63, z = 40.50, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4241.91, y = -3455.05, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4252.26, y = -3460.72, z = 37.10, weapon ="WEAPON_SHOTGUN_PUMP", style = 0, accuracy = 100}, 
			{x = -4216.54, y = -3409.69, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4220.84, y = -3415.07, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4206.04, y = -3400.54, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4237.41, y = -3419.55, z = 36.92, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4242.87, y = -3422.52, z = 36.72, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4166.40, y = -3436.27, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4171.57, y = -3446.35, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			{x = -4174.58, y = -3454.29, z = 37.09, weapon ="WEAPON_SHOTGUN_PUMP", style = 2, accuracy = 100}, 
			}
		},

	[38] = {
		firstname = "Lendários",
		secondname = "Homens de Lata",
		image = "https://i.ibb.co/ys6fvkv/lata.png",
		city = "Brandywine Drop",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
		moneymin = 300,
		moneymax = 500,
		showblips = true,
		timeO = 6, -- time when ped's spawn
		timeC = 8, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_REPEATER_HENRY",
		pos = {2846.72, 2257.79, 157.07},
		enemies = {
			"mp_g_m_m_armoredjuggernauts_01"
			},
		spawnenemies = {
			{x = 2836.79, y = 2247.42, z = 156.98, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2831.75, y = 2242.29, z = 156.77, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2827.57, y = 2236.77, z = 156.80, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2822.86, y = 2230.08, z = 156.99, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2819.12, y = 2223.13, z = 156.95, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2811.85, y = 2210.04, z = 156.67, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2812.00, y = 2200.57, z = 156.85, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2818.49, y = 2195.92, z = 156.72, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2823.34, y = 2200.95, z = 156.58, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2830.96, y = 2210.58, z = 156.70, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2836.48, y = 2215.70, z = 156.64, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2840.18, y = 2221.33, z = 156.86, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2845.19, y = 2229.37, z = 156.71, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2848.57, y = 2238.55, z = 156.87, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2849.62, y = 2246.51, z = 156.83, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2833.14, y = 2170.17, z = 159.99, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2831.24, y = 2173.61, z = 159.98, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2829.43, y = 2176.25, z = 159.97, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2827.00, y = 2179.54, z = 159.96, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2824.64, y = 2182.56, z = 159.96, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2821.58, y = 2185.99, z = 159.97, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2810.40, y = 2196.89, z = 160.00, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2815.24, y = 2192.40, z = 159.98, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2803.92, y = 2201.99, z = 160.02, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2796.46, y = 2207.49, z = 160.03, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2787.51, y = 2212.98, z = 160.05, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85}, 
			{x = 2780.97, y = 2216.94, z = 160.06, weapon ="WEAPON_RIFLE_BOLTACTION", style = 0, accuracy = 85},  -- bolt
			{x = 2776.12, y = 2222.56, z = 156.61, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2771.11, y = 2211.76, z = 156.71, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100}, 
			{x = 2838.46, y = 2167.23, z = 156.82, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 0, accuracy = 100},  -- 12
			{x = 2841.93, y = 2250.61, z = 156.99, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2844.48, y = 2248.51, z = 157.06, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2843.55, y = 2242.61, z = 156.87, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2838.70, y = 2243.40, z = 157.03, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2834.40, y = 2239.90, z = 156.76, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2837.59, y = 2230.19, z = 157.04, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2829.58, y = 2228.97, z = 157.02, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2829.30, y = 2222.44, z = 157.23, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2827.86, y = 2216.03, z = 157.14, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95}, 
			{x = 2816.35, y = 2204.62, z = 156.78, weapon ="WEAPON_REVOLVER_DOUBLEACTION", style = 2, accuracy = 95},  -- rush
			{x = 2876.82, y = 2267.63, z = 156.79, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2801.90, y = 2299.44, z = 157.89, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2777.85, y = 2275.37, z = 158.33, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2782.06, y = 2299.65, z = 158.34, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2859.69, y = 2190.85, z = 157.09, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2862.49, y = 2211.31, z = 157.54, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2870.80, y = 2249.96, z = 156.89, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90}, 
			{x = 2872.45, y = 2246.56, z = 156.93, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 0, accuracy = 90},  -- carcano tatico
			{x = 2898.63, y = 2272.03, z = 157.52, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, 
			{x = 2901.15, y = 2263.70, z = 157.78, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, 
			{x = 2905.06, y = 2277.08, z = 157.47, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, 
			{x = 2811.29, y = 2321.40, z = 157.41, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, 
			{x = 2812.40, y = 2314.43, z = 157.34, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, 
			{x = 2808.68, y = 2316.72, z = 157.76, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, 
			{x = 2814.65, y = 2306.11, z = 156.93, weapon ="WEAPON_SHOTGUN_SEMIAUTO", style = 3, accuracy = 100}, -- 12 rush
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