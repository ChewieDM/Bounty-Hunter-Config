-- Author '🅱🅻🆄🅴🆈🅴🆂#1364' by Sirec Studio -- 
-- REPORT ANY BUGS ON https://discord.gg/9XNBaQSmMd --
-- Novas Missões adicionadas por ChewieDM
--  DEV, as configuraçoes de cada missão devem ser bem analisadas e pensadas antes de mudar algo, missões tem diferentes dificuldades que podem ser definidas por Horario, Numero de Inimigos e Armas que usam, evite colocar uma recompensa muito baixa para recompensas que são dificeis de completar sozinho até pra alguem experiente. O horario é uma otima maneira de limitar a Missão de recompensa alta de ser feita apenas 1-2 vezes por dia do jogo. --

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

MissionAutoTime = 3600, -- every 60 minutes a new npc mission will be added !
DieNpcTime = 10, -- (30 seconds) Delete npc's after the player who took the bounty is dead !
DieBountyTime = 10, -- (60 seconds) Delete npc's after you killed the bounty target !
AlliveNpcTime = 60, -- (90 seconds) Delete npc's after you killed them all and finished the mission!
BountyBlip = 1481032477, -- Blip Type to Kill Bounty
BountyZone = 30.0, -- Blip Zone Area 
NearZone = 120, -- When to spawn the npc near location !
TooFarAway = 350, -- Distance to Mission failed !
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
	[1] = {
		firstname = "Billy", -- First Name 
		secondname = "Kid", -- Last Name
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
		city = "Fort Wallace", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40, -- Money Minim
		moneymax = 75, -- Maxim Money
		showblips = true, -- npc blips
        timeO = 14, -- time when ped's spawn
        timeC = 19, -- time after ped's don't spawn
		pos = {350.788, 1479.769, 178.596}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 351.423, y = 1462.482, z = 182.782, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 350.788, y = 1479.769, z = 178.596, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 359.019, y = 1467.052, z = 182.745, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 358.909, y = 1472.086, z = 178.851, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 355.808, y = 1468.029, z = 178.699, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 350.765, y = 1471.688, z = 178.792, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 354.060, y = 1473.770, z = 178.708, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 357.625, y = 1476.734, z = 178.843, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 90},
			{x = 364.990, y = 1481.511, z = 179.213, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 360.272, y = 1484.737, z = 179.153, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 357.670, y = 1490.340, z = 179.121, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 352.280, y = 1493.374, z = 179.686, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 348.132, y = 1491.418, z = 178.545, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 343.162, y = 1486.257, z = 178.629, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 347.983, y = 1482.421, z = 178.638, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 348.700, y = 1475.864, z = 178.714, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 50},
			{x = 349.815, y = 1471.114, z = 178.754, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 345.663, y = 1479.426, z = 178.637, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
        	}
    	},
        [2] = {
			firstname = "Alonzo",
			secondname = "Eager",
        	image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
			city = "Fort Wallace",
			type = "killer", -- SELECT ONLY "arrest" or "killer"
       	 	moneymin = 25,
			moneymax = 40,
			showblips = true,
            timeO = 12, -- time when ped's spawn
        	timeC = 18, -- time after ped's don't spawn
			pos = {350.788, 1479.769, 178.596},
			enemies = {
        		"g_m_m_bountyhunters_01",
            	"g_m_m_unibanditos_01",
            	"re_street_fight_males_01",
            	"U_M_M_BHT_ODRISCOLLSLEEPING",
            	"re_street_fight_males_01",
            	"mp_g_m_m_bountyhunters_01",
            	"U_M_M_BHT_ODRISCOLLMAULED",
            	"U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 351.423, y = 1462.482, z = 182.782, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 50},
			{x = 350.788, y = 1479.769, z = 178.596, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 359.019, y = 1467.052, z = 182.745, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 358.909, y = 1472.086, z = 178.851, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 355.808, y = 1468.029, z = 178.699, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 350.765, y = 1471.688, z = 178.792, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 354.060, y = 1473.770, z = 178.708, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 357.625, y = 1476.734, z = 178.843, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 364.990, y = 1481.511, z = 179.213, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 360.272, y = 1484.737, z = 179.153, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 357.670, y = 1490.340, z = 179.121, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
        	}
    	},
        [3] = {
			firstname = "Austin",
			secondname = "Majestic",
            image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",
			city = "Fort Wallace",
			type = "killer", -- SELECT ONLY "arrest" or "killer"
       	 	moneymin = 25,
			moneymax = 40,
			showblips = true,
            timeO = 8, -- time when ped's spawn
        	timeC = 14, -- time after ped's don't spawn
			pos = {350.788, 1479.769, 178.596},
			enemies = {
        		"g_m_m_bountyhunters_01",
            	"g_m_m_unibanditos_01",
            	"re_street_fight_males_01",
            	"U_M_M_BHT_ODRISCOLLSLEEPING",
            	"re_street_fight_males_01",
            	"mp_g_m_m_bountyhunters_01",
            	"U_M_M_BHT_ODRISCOLLMAULED",
            	"U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 351.423, y = 1462.482, z = 182.782, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 350.788, y = 1479.769, z = 178.596, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 359.019, y = 1467.052, z = 182.745, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 358.909, y = 1472.086, z = 178.851, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 355.808, y = 1468.029, z = 178.699, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
        	}
    	}, 
     [4] = {
		firstname = "Bill",
		secondname = "Bones",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Grizzlies West",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40,
		moneymax = 75,
        showblips = true,
        timeO = 18, -- time when ped's spawn
        timeC = 23, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_rhd_bountytarget_01",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {-1894.111, 1354.839, 201.230},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -1892.049, y = 1346.595, z = 200.139, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1898.788, y = 1347.496, z = 200.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1890.823, y = 1341.068, z = 200.742, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -1884.726, y = 1334.646, z = 199.744, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -1877.963, y = 1336.746, z = 200.299, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = -1876.213, y = 1331.811, z = 201.242, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1890.364, y = 1329.424, z = 198.903, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1880.294, y = 1324.157, z = 200.388, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 90},
			{x = -1879.740, y = 1319.555, z = 201.512, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -1882.836, y = 1346.060, z = 201.475, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = -1881.891, y = 1361.354, z = 202.405, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1884.190, y = 1354.513, z = 202.296, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = -1891.196, y = 1357.857, z = 201.654, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -1899.243, y = 1358.593, z = 202.475, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
        	}
    	},
    [5] = {
		firstname = "Carson",
		secondname = "Butcher",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Grizzlies West",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40,
		moneymax = 75,
        showblips = true,
        timeO = 2, -- time when ped's spawn
        timeC = 9, -- time after ped's don't spawn
		arrestnpc = "mp_u_m_m_bountytarget_011",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {-1894.111, 1354.839, 201.230},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -1892.049, y = 1346.595, z = 200.139, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = -1898.788, y = 1347.496, z = 200.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1890.823, y = 1341.068, z = 200.742, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = -1884.726, y = 1334.646, z = 199.744, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -1877.963, y = 1336.746, z = 200.299, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = -1876.213, y = 1331.811, z = 201.242, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = -1890.364, y = 1329.424, z = 198.903, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1880.294, y = 1324.157, z = 200.388, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = -1879.740, y = 1319.555, z = 201.512, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 1, accuracy = 100},
			{x = -1882.836, y = 1346.060, z = 201.475, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = -1881.891, y = 1361.354, z = 202.405, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
        	}
    	},
	[6] = {
		firstname = "Carson",
		secondname = "Butcher",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Grizzlies West",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 50,
        showblips = true,
        timeO = 10, -- time when ped's spawn
        timeC = 18, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-1894.111, 1354.839, 201.230},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -1892.049, y = 1346.595, z = 200.139, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = -1898.788, y = 1347.496, z = 200.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1890.823, y = 1341.068, z = 200.742, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = -1884.726, y = 1334.646, z = 199.744, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 1, accuracy = 100},
			{x = -1877.963, y = 1336.746, z = 200.299, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = -1876.213, y = 1331.811, z = 201.242, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1890.364, y = 1329.424, z = 198.903, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
        	}
    	},
    [7] = {
		firstname = "Cassidy",
		secondname = "Clay",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40,
		moneymax = 75,
		showblips = true,
        timeO = 1, -- time when ped's spawn
        timeC = 8, -- time after ped's don't spawn    
		pos = {2518.337, 2284.414, 176.351},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2518.337, y = 2284.414, z = 176.351, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2518.003, y = 2287.330, z = 176.342, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2510.301, y = 2290.202, z = 176.351, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2524.073, y = 2274.322, z = 175.382, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2533.478, y = 2290.074, z = 175.553, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2531.568, y = 2298.568, z = 175.553, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 90},
			{x = 2528.675, y = 2308.762, z = 175.528, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2510.852, y = 2306.126, z = 176.155, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2502.159, y = 2290.498, z = 175.576, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2496.596, y = 2304.026, z = 178.703, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2533.478, y = 2290.074, z = 175.553, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2528.675, y = 2308.762, z = 175.528, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 60}
        	}
    	},
    [8] = {
		firstname = "Clayton",
		secondname = "Mortal",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 35,
		moneymax = 75,
		showblips = true,
        timeO = 12, -- time when ped's spawn
        timeC = 20, -- time after ped's don't spawn    
		pos = {2518.337, 2284.414, 176.351},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2518.337, y = 2284.414, z = 176.351, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2518.003, y = 2287.330, z = 176.342, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2510.301, y = 2290.202, z = 176.351, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2524.073, y = 2274.322, z = 175.382, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2533.478, y = 2290.074, z = 175.553, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2531.568, y = 2298.568, z = 175.553, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 90},
			{x = 2528.675, y = 2308.762, z = 175.528, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2518.532, y = 2313.298, z = 176.339, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2510.852, y = 2306.126, z = 176.155, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2511.879, y = 2295.396, z = 175.562, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2502.159, y = 2290.498, z = 175.576, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2500.087, y = 2281.964, z = 175.587, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2496.596, y = 2304.026, z = 178.703, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
        	}
    	},
    [9] = {
		firstname = "Coleman",
		secondname = "Dove",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Roanoke Valley",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 10,
		moneymax = 20,
		showblips = true,
        timeO = 1, -- time when ped's spawn
        timeC = 23, -- time after ped's don't spawn    
		pos = {2518.337, 2284.414, 176.351},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2518.337, y = 2284.414, z = 176.351, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2518.003, y = 2287.330, z = 176.342, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2510.037, y = 2287.429, z = 176.351, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2510.301, y = 2290.202, z = 176.351, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2513.319, y = 2275.073, z = 175.723, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
        	}
    	},
	[10] = {
		firstname = "Dallas",
		secondname = "Bo",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Roanoke Valley",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 50,
		moneymax = 85,
        showblips = true,
        timeO = 3, -- time when ped's spawn
        timeC = 7, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_014",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {2415.179, 1763.965, 88.636},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2411.156, y = 1764.061, z = 88.659, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2413.866, y = 1756.755, z = 88.641, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2417.478, y = 1756.475, z = 88.648, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2418.042, y = 1753.005, z = 88.639, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2415.475, y = 1755.973, z = 88.658, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2432.117, y = 1748.503, z = 85.395, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2430.616, y = 1739.128, z = 87.830, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 90},
			{x = 2432.646, y = 1735.200, z = 88.033, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2428.249, y = 1732.029, z = 89.903, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2421.051, y = 1736.085, z = 92.474, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2414.679, y = 1741.126, z = 97.331, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2420.652, y = 1742.413, z = 97.814, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2406.744, y = 1744.932, z = 100.674, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2419.336, y = 1746.418, z = 102.255, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2432.058, y = 1751.083, z = 103.767, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2435.551, y = 1754.996, z = 103.685, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2428.817, y = 1753.665, z = 104.450, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2428.587, y = 1758.618, z = 103.793, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2418.527, y = 1757.975, z = 104.844, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2415.475, y = 1755.973, z = 88.656, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2432.117, y = 1748.503, z = 85.395, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2430.616, y = 1739.128, z = 87.830, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2428.249, y = 1732.029, z = 89.903, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2421.051, y = 1736.085, z = 92.474, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2414.679, y = 1741.126, z = 97.331, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 60}
        	}
    	},
	[11] = {
		firstname = "Flynn",
		secondname = "Earle",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Roanoke Valley",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 75,
        showblips = true,
        timeO = 14, -- time when ped's spawn
        timeC = 21, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_PISTOL_M1899",
		pos = {2415.179, 1763.965, 88.636},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2411.156, y = 1764.061, z = 88.659, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2413.866, y = 1756.755, z = 88.641, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2417.478, y = 1756.475, z = 88.648, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2416.279, y = 1750.298, z = 88.620, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2418.042, y = 1753.005, z = 88.639, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2415.475, y = 1755.973, z = 88.658, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2432.117, y = 1748.503, z = 85.395, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2430.616, y = 1739.128, z = 87.830, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 90},
			{x = 2432.646, y = 1735.200, z = 88.033, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2428.249, y = 1732.029, z = 89.903, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2421.051, y = 1736.085, z = 92.474, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2414.679, y = 1741.126, z = 97.331, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2420.652, y = 1742.413, z = 97.814, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2406.744, y = 1744.932, z = 100.674, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
        	}
    	},
	[12] = {
		firstname = "Frank",
		secondname = "Clayton",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Roanoke Valley",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 10,
		moneymax = 30,
        showblips = true,
        timeO = 4, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_016",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {2415.179, 1763.965, 88.636},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
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
	[13] = {
		firstname = "Flynn", -- First Name 
		secondname = "West", -- Last Name
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Van Horn", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 50, -- Money Minim
		moneymax = 75, -- Maxim Money
		showblips = true, -- npc blips
        timeO = 19, -- time when ped's spawn
        timeC = 23, -- time after ped's don't spawn    
		pos = {2825.905, 276.096, 47.112}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 2830.554, y = 277.781, z = 50.086, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2828.820, y = 279.498, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2831.466, y = 275.844, z = 50.086, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2828.823, y = 272.757, z = 50.080, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2825.660, y = 269.900, z = 50.080, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2818.052, y = 269.683, z = 47.023, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 90},
			{x = 2818.395, y = 265.704, z = 46.910, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2823.057, y = 261.677, z = 46.701, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2827.988, y = 265.430, z = 46.692, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2832.753, y = 268.842, z = 46.735, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2837.588, y = 274.929, z = 46.779, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2837.262, y = 280.503, z = 46.487, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2833.758, y = 286.050, z = 46.827, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2826.362, y = 289.529, z = 48.804, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2823.990, y = 273.875, z = 47.093, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 2826.336, y = 281.973, z = 47.033, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 30},
			{x = 2820.285, y = 273.055, z = 47.097, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2817.590, y = 274.615, z = 48.079, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 80},
			{x = 2823.134, y = 266.353, z = 47.094, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
        	}
    	},
	[14] = {
		firstname = "Lawrence", -- First Name 
		secondname = "Fierce", -- Last Name
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Van Horn", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40, -- Money Minim
		moneymax = 60, -- Maxim Money
		showblips = true, -- npc blips
        timeO = 13, -- time when ped's spawn
        timeC = 21, -- time after ped's don't spawn    
		pos = {2825.905, 276.096, 47.112}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 2830.554, y = 277.781, z = 50.086, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2828.820, y = 279.498, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 2831.466, y = 275.844, z = 50.086, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2828.823, y = 272.757, z = 50.080, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2825.660, y = 269.900, z = 50.080, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2822.662, y = 266.548, z = 50.080, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2818.052, y = 269.683, z = 47.023, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 90},
			{x = 2818.395, y = 265.704, z = 46.910, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2823.057, y = 261.677, z = 46.701, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
        	}
    	},
	[15] = {
		firstname = "Luke", -- First Name 
		secondname = "Famous", -- Last Name
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Van Horn", -- Bounty Location
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 10, -- Money Minim
		moneymax = 25, -- Maxim Money
        timeO = 5, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		showblips = true, -- npc blips
		pos = {2825.905, 276.096, 47.112}, -- pos where is the selected mission !
		enemies = { -- enemies that spawn random from this list
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = { -- enemies locations, ped weapons, ped combat style, ped accuracy 
			{x = 2830.554, y = 277.781, z = 50.086, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2828.820, y = 279.498, z = 50.086, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2831.466, y = 275.844, z = 50.086, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2828.823, y = 272.757, z = 50.080, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2825.660, y = 269.900, z = 50.080, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
        	}
    	},
	[16] = {
		firstname = "Jesse",
		secondname = "James",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Kamassa",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40,
		moneymax = 75,
        showblips = true,
        timeO = 4, -- time when ped's spawn
        timeC = 8, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_016",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {2454.093, 290.076, 69.446},
		enemies = {
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2457.833, y = 285.286, z = 69.844, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 50},
			{x = 2450.265, y = 282.351, z = 69.516, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2449.772, y = 290.435, z = 69.331, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2444.760, y = 291.103, z = 69.347, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2445.225, y = 294.356, z = 69.342, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2444.941, y = 285.890, z = 69.486, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2464.516, y = 296.537, z = 69.425, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2459.933, y = 301.006, z = 73.785, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2463.902, y = 304.143, z = 75.257, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2464.764, y = 294.484, z = 73.762, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2464.505, y = 276.015, z = 77.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
        	}
    	},
    [17] = {
		firstname = "John",
		secondname = "Morgan",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Kamassa",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 50,
        showblips = true,
        timeO = 12, -- time when ped's spawn
        timeC = 19, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_017",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {2454.093, 290.076, 69.446},
		enemies = {
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2457.833, y = 285.286, z = 69.844, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2450.265, y = 282.351, z = 69.516, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2449.772, y = 290.435, z = 69.331, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2444.760, y = 291.103, z = 69.347, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2445.225, y = 294.356, z = 69.342, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2444.941, y = 285.890, z = 69.486, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2464.516, y = 296.537, z = 69.425, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 90},
        	}
    	},
    [18] = {
		firstname = "Arthur",
		secondname = "Reuben",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Kamassa",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 75,
        showblips = true,
        timeO = 1, -- time when ped's spawn
        timeC = 6, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_018",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {2454.093, 290.076, 69.446},
		enemies = {
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2457.833, y = 285.286, z = 69.844, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2450.265, y = 282.351, z = 69.516, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 2449.772, y = 290.435, z = 69.331, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2444.760, y = 291.103, z = 69.347, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2445.225, y = 294.356, z = 69.342, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2444.941, y = 285.890, z = 69.486, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2464.516, y = 296.537, z = 69.425, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2459.933, y = 301.006, z = 73.785, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2463.902, y = 304.143, z = 75.257, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2464.764, y = 294.484, z = 73.762, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2464.505, y = 276.015, z = 77.343, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2452.501, y = 277.308, z = 73.886, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2440.772, y = 279.744, z = 75.592, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2465.201, y = 303.395, z = 70.301, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2459.933, y = 301.006, z = 73.785, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
        	}
    	},
	[19] = {
		firstname = "Arthur",
		secondname = "Ranger",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Bluwater Marsh",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 75,
        showblips = true,
        timeO = 3, -- time when ped's spawn
        timeC = 12, -- time after ped's don't spawn    
		arrestnpc = "mp_g_m_m_armoredjuggernauts_01",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_CARCANO",
		pos = {2152.999, -639.030, 41.512},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2142.368, y = -641.802, z = 41.615, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2140.187, y = -650.787, z = 41.308, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2139.688, y = -630.237, z = 41.711, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2143.815, y = -630.337, z = 41.595, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2143.568, y = -624.938, z = 40.558, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2160.993, y = -619.492, z = 41.880, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2167.829, y = -617.446, z = 41.901, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2151.583, y = -608.194, z = 40.589, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2136.700, y = -620.532, z = 40.619, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2109.181, y = -622.289, z = 40.597, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2100.792, y = -611.427, z = 40.878, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2094.865, y = -611.288, z = 44.118, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2101.342, y = -604.517, z = 40.705, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2114.148, y = -592.870, z = 41.609, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
        	}
    	},
	[20] = {
		firstname = "Porter",
		secondname = "Ray",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Bluwater Marsh",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 75,
        showblips = true,
        timeO = 17, -- time when ped's spawn
        timeC = 23, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_007",
		arrestnpcwep = "WEAPON_SNIPERRIFLE_CARCANO",
		pos = {2152.999, -639.030, 41.512},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2142.368, y = -641.802, z = 41.615, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2140.187, y = -650.787, z = 41.308, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2139.688, y = -630.237, z = 41.711, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 2143.815, y = -630.337, z = 41.595, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2143.568, y = -624.938, z = 40.558, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2160.993, y = -619.492, z = 41.880, weapon ="WEAPON_RIFLE_BOLTACTION", style = 1, accuracy = 90},
			{x = 2126.144, y = -595.991, z = 41.576, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2124.218, y = -588.992, z = 41.530, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 80},
			{x = 2134.709, y = -608.390, z = 40.766, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2152.969, y = -622.403, z = 40.536, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2161.172, y = -612.075, z = 40.448, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = 2109.181, y = -622.289, z = 40.597, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2094.865, y = -611.288, z = 44.118, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 60}
        	}
    	},
	[21] = {
		firstname = "Tom",
		secondname = "Shelby",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Bluwater Marsh",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 10,
		moneymax = 20,
        showblips = true,
        timeO = 2, -- time when ped's spawn
        timeC = 23, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_006",
		arrestnpcwep = "WEAPON_REPEATER_CARBINE",
		pos = {2152.999, -639.030, 41.512},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2147.966, y = -640.914, z = 41.520, weapon ="WEAPON_PISTOL_M1899", style = 1, accuracy = 50},
			{x = 2142.368, y = -641.802, z = 41.615, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 2140.187, y = -650.787, z = 41.308, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = 2133.418, y = -640.315, z = 41.616, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2139.688, y = -630.237, z = 41.711, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
        	}
    	},
	[22] = {
		firstname = "John",
		secondname = "Wesley",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Kamassa River",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 25,
		moneymax = 40,
        showblips = true,
        timeO = 6, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_005",
		arrestnpcwep = "WEAPON_SHOTGUN_DOUBLEBARREL",
		pos = {1875.951, -739.031, 41.697},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 1893.843, y = -742.363, z = 41.269, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 1895.901, y = -737.034, z = 41.318, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 70},
			{x = 1888.955, y = -741.978, z = 40.862, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 1881.149, y = -737.367, z = 41.500, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 1876.535, y = -734.915, z = 41.647, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = 1875.951, y = -739.031, z = 41.697, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 1869.166, y = -746.279, z = 41.878, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 1873.321, y = -756.536, z = 40.205, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
        	}
    	},
	[23] = {
		firstname = "John",
		secondname = "Wyat",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Caliga Hall",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 30,
		moneymax = 50,
        showblips = true,
        timeO = 8, -- time when ped's spawn
        timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_004",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {2139.998, -1283.485, 48.648},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = 2141.893, y = -1279.383, z = 46.647, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2148.207, y = -1280.958, z = 43.877, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = 2147.214, y = -1275.279, z = 42.464, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = 2141.110, y = -1276.752, z = 40.653, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = 2137.319, y = -1286.468, z = 40.997, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = 2137.319, y = -1286.468, z = 40.997, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = 2133.597, y = -1295.544, z = 41.367, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = 2142.640, y = -1295.542, z = 41.328, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = 2140.791, y = -1303.533, z = 41.693, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
        	}
    	},
	[24] = {
		firstname = "Luke",
		secondname = "Shane",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "The Heartlands",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 40,
		moneymax = 50,
        showblips = true,
        timeO = 9, -- time when ped's spawn
        timeC = 20, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_003",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-328.724, -150.561, 50.078},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -327.0454711914063, y = -148.31842041015625, z = 50.0783805847168, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -333.52783203125, y = -150.19760131835938, z = 49.68135452270508, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -321.2986145019531, y = -139.93321228027344, z = 49.47900009155273, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -330.6002502441406, y = -131.9102325439453, z = 48.89569854736328, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -341.7316589355469, y = -153.62220764160156, z = 49.67258071899414, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = -344.3323059082031, y = -157.79139709472656, z = 49.75100708007812, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -350.87255859375, y = -149.2147216796875, z = 47.59628677368164, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -340.9605407714844, y = -130.2617645263672, z = 47.70182800292969, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
        	}
    	},
	[25] = {
		firstname = "Louis",
		secondname = "West",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "BlackWater",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 30,
		moneymax = 50,
        showblips = true,
        timeO = 6, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_bountytarget_025",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-1022.902, -1625.756, 78.019},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -1024.012939453125, y = -1629.77001953125, z = 78.01721954345703, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1029.842041015625, y = -1628.76318359375, z = 78.01721954345703, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -1033.0484619140625, y = -1627.07080078125, z = 78.0194091796875, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -1032.1298828125, y = -1623.450927734375, z = 78.01948547363281, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -1030.293701171875, y = -1616.7713623046875, z = 78.01255798339844, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = -1024.066162109375, y = -1617.6036376953125, z = 78.02774047851562, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1014.3487548828124, y = -1620.354248046875, z = 76.68476867675781, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1015.94677734375, y = -1627.70849609375, z = 76.5450668334961, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
        	}
    	},
	[26] = {
		firstname = "Harry",
		secondname = "Ruben",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Strawberry",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 30,
		moneymax = 50,
        showblips = true,
        timeO = 4, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_002",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-1822.870, -615.853, 154.015},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -1822.504150390625, y = -619.4876098632812, z = 153.72825622558597, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 50},
			{x = -1827.7020263671875, y = -623.7704467773438, z = 154.0764617919922, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -1837.4794921875, y = -619.412353515625, z = 154.27456665039065, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -1835.999267578125, y = -604.9057006835938, z = 153.50624084472656, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -1830.0870361328127, y = -598.5430297851562, z = 153.52305603027344, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = -1820.8236083984375, y = -603.2504272460938, z = 153.48550415039065, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -1823.6126708984375, y = -611.0455932617188, z = 153.57083129882812, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1820.5350341796875, y = -621.139892578125, z = 153.73394775390625, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
			{x = -1823.6126708984375, y = -611.0455932617188, z = 153.57083129882812, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -1820.5350341796875, y = -621.139892578125, z = 153.73394775390625, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
        	}
    	},
	[27] = {
		firstname = "Lawrence",
		secondname = "Holt",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Manzanita Post",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 30,
		moneymax = 50,
        showblips = true,
        timeO = 7, -- time when ped's spawn
        timeC = 23, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_09",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-2075.823, -1891.929, 112.435},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -2074.119384765625, y = -1896.96142578125, z = 112.02962493896484, weapon ="WEAPON_PISTOL_M1899", style = 3, accuracy = 50},
			{x = -2066.340576171875, y = -1890.3817138671875, z = 111.51465606689452, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -2055.09765625, y = -1889.6636962890625, z = 110.53534698486328, weapon ="WEAPON_RIFLE_BOLTACTION", style = 2, accuracy = 30},
			{x = -2050.241943359375, y = -1901.200439453125, z = 110.06202697753906, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -2058.140625, y = -1922.553466796875, z = 112.37068939208984, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 2, accuracy = 60},
			{x = -2062.079345703125, y = -1925.900146484375, z = 112.32418060302736, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -2068.0703125, y = -1921.670166015625, z = 112.24359130859376, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -2078.05224609375, y = -1917.479248046875, z = 112.83971405029295, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
			{x = -2068.0703125, y = -1921.670166015625, z = 112.24359130859376, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -2078.05224609375, y = -1917.479248046875, z = 112.83971405029295, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
        	}
    	},
	[28] = {
		firstname = "Levi",
		secondname = "Earle",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Armadillo",
		type = "arrest", -- SELECT ONLY "arrest" or "killer"
        moneymin = 30,
		moneymax = 50,
        showblips = true,
        timeO = 11, -- time when ped's spawn
        timeC = 22, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_08",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-3321.158, -2862.516, -7.218},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -3317.5146484375, y = -2857.935791015625, z = -7.12080192565918, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -3309.87158203125, y = -2852.912841796875, z = -7.10598421096801, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 70},
			{x = -3314.68896484375, y = -2859.912841796875, z = -7.08675336837768, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -3329.5693359375, y = -2863.86669921875, z = -7.08725357055664, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -3336.795166015625, y = -2858.9912109375, z = -7.12801504135131, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 1, accuracy = 60},
			{x = -3331.59326171875, y = -2874.1201171875, z = -7.05814886093139, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -3319.8515625, y = -2873.189697265625, z = -7.10785150527954, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3308.48681640625, y = -2870.483154296875, z = -7.08247709274292, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 80},
			{x = -3319.8515625, y = -2873.189697265625, z = -7.10785150527954, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3308.48681640625, y = -2870.483154296875, z = -7.08247709274292, weapon ="WEAPON_REPEATER_CARBINE", style = 1, accuracy = 80},
        	}
    	},
		[29] = {
		firstname = "Logan",
		secondname = "Riley",
        image = "https://media.discordapp.net/attachments/953700577412534352/1155490416662151188/hey_yo.png?width=700&height=676",    
		city = "Armadillo",
		type = "killer", -- SELECT ONLY "arrest" or "killer"
        moneymin = 30,
		moneymax = 50,
        showblips = true,
        timeO = 8, -- time when ped's spawn
        timeC = 17, -- time after ped's don't spawn    
		arrestnpc = "mp_u_m_m_legendarybounty_001",
		arrestnpcwep = "WEAPON_RIFLE_BOLTACTION",
		pos = {-3842.241, -3009.168, -7.8008165359497},
		enemies = {
        	"g_m_m_bountyhunters_01",
            "g_m_m_unibanditos_01",
            "re_street_fight_males_01",
            "U_M_M_BHT_ODRISCOLLSLEEPING",
            "re_street_fight_males_01",
            "mp_g_m_m_bountyhunters_01",
            "U_M_M_BHT_ODRISCOLLMAULED",
            "U_M_M_BHT_ODRISCOLLDRUNK"
        	},
        spawnenemies = {
			{x = -3845.37353515625, y = -3013.224365234375, z = -7.86573982238769, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -3848.801025390625, y = -3011.947998046875, z = -7.83977079391479, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3847.9609375, y = -3006.83447265625, z = -7.90665960311889, weapon ="WEAPON_RIFLE_BOLTACTION", style = 3, accuracy = 30},
			{x = -3842.43017578125, y = -3009.55712890625, z = -7.87518119812011, weapon ="WEAPON_SHOTGUN_DOUBLEBARREL", style = 2, accuracy = 100},
			{x = -3844.692138671875, y = -3007.11669921875, z = -7.92386531829834, weapon ="WEAPON_SNIPERRIFLE_CARCANO", style = 3, accuracy = 60},
			{x = -3846.041015625, y = -3000.040283203125, z = -7.97590065002441, weapon ="WEAPON_PISTOL_M1899", style = 2, accuracy = 50},
			{x = -3856.034423828125, y = -3005.73291015625, z = -8.25351667404174, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3855.326171875, y = -3016.58935546875, z = -8.10537910461425, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
			{x = -3856.034423828125, y = -3005.73291015625, z = -8.25351667404174, weapon ="WEAPON_REPEATER_CARBINE", style = 2, accuracy = 70},
			{x = -3855.326171875, y = -3016.58935546875, z = -8.10537910461425, weapon ="WEAPON_REPEATER_CARBINE", style = 3, accuracy = 80},
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
]]