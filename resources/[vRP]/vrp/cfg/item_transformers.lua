local cfg = {}

cfg.item_transformers = {
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
	-- FITNESS
	["Fitness"] = {
		def = {
			name="Fitness", -- menu name
			permissions = {}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=320,
			units_per_minute=100,
			x=0,y=0,z=0, -- pos
			radius=7.5, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="fitness", -- Unique id for blip
			blipicon=311,
			blipcolor=17,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Træn styrke"] = { -- action name
					description="Forsøg din styrke.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={}, -- items given per unit
					aptitudes={ -- optional
						["physical.strength"] = 1 -- "group.aptitude", give 1 exp per unit
					}
				}
			}
		},
		positions = {
			{-1202.96252441406,-1566.14086914063,4.61040639877319}
		},
		duration = 90 -- 5 days (time before switching position, min 5 mins.)
	},
	["FængselFitness"] = {
		def = {
			name="FængselFitness", -- menu name
			permissions = {}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=320,
			units_per_minute=80,
			x=0,y=0,z=0, -- pos
			radius=9.5, height=1.5, -- area
			blip=false, -- Should transformer have blip
			blipid="fitness", -- Unique id for blip
			blipicon=311,
			blipcolor=17,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Træn styrke"] = { -- action name
					description="Forsøg din styrke.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={}, -- items given per unit
					aptitudes={ -- optional
						["physical.strength"] = 1 -- "group.aptitude", give 1 exp per unit
					}
				}
			}
		},
		positions = {
			{1644.39453125,2528.6154785156,45.564876556396}
		},
		duration = 90 -- 5 days (time before switching position, min 5 mins.)
	},
	
	-- FØRSTEHJÆLP  
	["Førstehjælpskursus"] = {
		def = {
			name="Førstehjælpskursus", -- menu name
			permissions = {}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=320,
			units_per_minute=100,
			x=0,y=0,z=0, -- pos
			radius=5, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="firstaidcourse", -- Unique id for blip
			blipicon=489,
			blipcolor=59,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Lær om førstehjælp"] = { -- action name
					description="Bliv klogere på hvordan du yder førstehjælp. Det kan blive brugbart senere.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={}, -- items given per unit
					aptitudes={ -- optional
						["lifesaving.firstaid"] = 1 -- "group.aptitude", give 1 exp per unit
					}
				}
			}
		},
		positions = {
			{255.10076904297,-1383.5374755859,39.534378051758}
		},
		duration = 90 -- 5 days (time before switching position, min 5 mins.)
	},
  
  -- TRÆHUGGER
	["Træfarm"] = {
		def = {
			name="Træfarm", -- menu name
			permissions = {"tree.cutter"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=350,
			units_per_minute=20,
			x=0,y=0,z=0, -- pos
			radius=10, height=10.5, -- area
			blip=true, -- Should transformer have blip
			blipid="treepark", -- Unique id for blip
			blipicon=238,
			blipcolor=69,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fæld træer"] = { -- action name
					description="Fæld træer og få stammer ud af dem.", -- action description
					work=10,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["tree"] = 1,
					}
				}
			}
		},
		positions = {
			{-636.44482421875,5471.7973632813,53.17057800293}
		},
		duration = 65 -- 5 days (time before switching position, min 5 mins.)
	},
	["Savværk"] = {
		def = {
			name="Savværk", -- menu name
			permissions = {"tree.cutter"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=350,
			units_per_minute=35,
			x=0,y=0,z=0, -- pos
			radius=8, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="treebranch", -- Unique id for blip
			blipicon=473,
			blipcolor=21,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Beskær stammer"] = { -- action name
					description="Skær dine stammer om til planker.", -- action description
					work=5,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["tree"] = 1,
					},
					products={ -- items given per unit
						["planks"] = 5,
					}
				}
			}
		},
		positions = {
			{-513.70294189453,5246.7944335938,80.209884643555}
		},
		duration = 70 -- 5 days (time before switching position, min 5 mins.)
	},
	["Byggepladser"] = {
		def = {
			name="Byggeplads", -- menu name
			permissions = {"tree.cutter"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=350,
			units_per_minute=35,
			x=0,y=0,z=0, -- pos
			radius=7, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="treesell", -- Unique id for blip
			blipicon=473,
			blipcolor=22,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Aflever planker"] = { -- action name
					description="Lever dine planker til byggepladsen.", -- action description
					work=4,
					in_money=0, -- money taken per unit
					out_money=1150, -- money earned per unit
					reagents={ -- items taken per unit
						["planks"] = 3,
					},
					products={}
				}
			}
		},
		positions = {
			{-497.61245727539,-954.251953125,23.958311080933},
			{112.97249603271,-398.65274047852,41.264019012451},
			{-125.31127929688,-1044.7413330078,27.096048355103}
		},
		duration = 20 -- 5 days (time before switching position, min 5 mins.)
	},
  
  -- FISK
	["Fiskeri"] = {
		def = {
			name="Fiskeri", -- menu name
			permissions = {"fisher.fish"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=500,
			units_per_minute=25,
			x=0,y=0,z=0, -- pos
			radius=75, height=25.5, -- area
			blip=true, -- Should transformer have blip
			blipid="fishery", -- Unique id for blip
			blipicon=68,
			blipcolor=18,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fang fisk"] = { -- action name
					description="Her fanger du dine fisk.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["raw_fish"] = 1,
					}
				}
			}
		},
		positions = {
			{947.22039794922,-3857.2875976563,-3.4147789478302,269.56408691406},
			{608.37310791016,-4117.2944335938,-2.946501493454,91.564018249512},
			{-80.243598937988,-4184.619140625,-1.1860280036926,113.50563812256},
			{-1674.3238525391,-4221.841796875,-5.6642241477966,84.322784423828}
		},
		duration = 45 -- 5 days (time before switching position, min 5 mins.)
	},
	["Fiske behandling"] = {
		def = {
			name="Fiske behandling", -- menu name
			permissions = {"fisher.process"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=200,
			units_per_minute=60,
			x=0,y=0,z=0, -- pos
			radius=10, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="fishprocess", -- Unique id for blip
			blipicon=68,
			blipcolor=18,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Klarggør fisk"] = { -- action name
					description="Behandling af fisk.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["raw_fish"] = 3
					},
					products={ -- items given per unit
						["processed_fish"] = 3
					}
				}
			}
		},
		positions = {
			{52.237197875977,-2682.4226074219,6.0090689659119}
		},
		duration = 80 -- 5 days (time before switching position, min 5 mins.)
	},
	["Fiske køber"] = {
		def = {
			name="Salg af fisk", -- menu name
			permissions = {"fisher.sell"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=350,
			units_per_minute=80,
			x=0,y=0,z=0, -- pos
			radius=5, height=2.5, -- area
			blip=true, -- Should transformer have blip
			blipid="fishersheller", -- Unique id for blip
			blipicon=280,
			blipcolor=2,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg fisk"] = { -- action name
					description="Sælg fisk.", -- action description
					work=1,
					in_money=0, -- money taken per unit
					out_money=450, -- money earned per unit
					reagents={ -- items taken per unit
						["processed_fish"] = 2
					},
					products={} -- items given per unit
				}
			}
		},
		positions = {
			{-1468.5388183594,-325.75839233398,44.846920013428}
		},
		duration = 80 -- 5 days (time before switching position, min 5 mins.)
	},

	-- GULD
	["Guldmine"] = {
		def = {
			name="Guldmine", -- menu name
			permissions = {"mining.harvest"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=175,
			units_per_minute=10,
			x=0,y=0,z=0, -- pos
			radius=5, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="goldmine", -- Unique id for blip
			blipicon=501,
			blipcolor=70,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Hak guldmalm"] = { -- action name
					description="Udvind guld fra guldmalm.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["guldmalm"] = 1,
					}
				}
			}
		},
		positions = {
			{-596.28533935547,2089.5959472656,131.41285705566}
		},
		duration = 90 -- 5 days (time before switching position, min 5 mins.)
	},
	["Guld fremstilling"] = {
		def = {
			name="Guld fremstilling", -- menu name
			permissions = {"mining.process"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=175,
			units_per_minute=10,
			x=0,y=0,z=0, -- pos
			radius=5, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="goldprocess", -- Unique id for blip
			blipicon=501,
			blipcolor=70,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fremstil guld"] = { -- action name
					description="Brug guldmalm til at fremstille guld.", -- action description
					work=35,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["guldmalm"] = 10
					},
					products={ -- items given per unit
						["guld"] = 1
					}
				}
			}
		},
		positions = {
			{2781.2080078125,1710.5539550781,24.627914428711}
		},
		duration = 100 -- 5 days (time before switching position, min 5 mins.)
	},
	["Guldsmed"] = {
		def = {
			name="Guldsmed", -- menu name
			permissions = {"mining.sell"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=200,
			units_per_minute=20,
			x=0,y=0,z=0, -- pos
			radius=5, height=2.5, -- area
			blip=true, -- Should transformer have blip
			blipid="goldseller", -- Unique id for blip
			blipicon=431,
			blipcolor=70,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg guld"] = { -- action name
					description="Sælg guld.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=5000, -- money earned per unit
					reagents={ -- items taken per unit
						["guld"] = 1
					},
					products={} -- items given per unit
				}
			}
		},
		positions = {
			{112.92890930176,-919.72497558594,29.946001052856}
		},
		duration = 110 -- 5 days (time before switching position, min 5 mins.)
	},
	
	-- JERN
	["Jernmine"] = {
		def = {
			name="Jernmine", -- menu name
			permissions = {"mining.harvest"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=175,
			units_per_minute=10,
			x=0,y=0,z=0, -- pos
			radius=5, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="ironmine", -- Unique id for blip
			blipicon=501,
			blipcolor=22,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Hak jernmalm"] = { -- action name
					description="Jernmalm bruges til at fremstille jern.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["jernmalm"] = 1,
					}
				}
			}
		},
		positions = {
			{2997.3598632813,2751.0842285156,44.208843231201}
		},
		duration = 90 -- 5 days (time before switching position, min 5 mins.)
	},
	["Jern fremstilling"] = {
		def = {
			name="Jern fremstilling", -- menu name
			permissions = {"mining.process"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=175,
			units_per_minute=10,
			x=0,y=0,z=0, -- pos
			radius=5, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="ironprocess", -- Unique id for blip
			blipicon=501,
			blipcolor=22,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fremstil jern"] = { -- action name
					description="Udvind jern fra jernmalm.", -- action description
					work=20,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={
						["jernmalm"] = 5
					}, -- items taken per unit
					products={ -- items given per unit
						["jern"] = 1
					}
				}
			}
		},
		positions = {
			{2714.560546875,1710.1124267578,24.633918762207}
		},
		duration = 100 -- 5 days (time before switching position, min 5 mins.)
	},
	["Jern forhandler"] = {
		def = {
			name="Jern forhandler", -- menu name
			permissions = {"mining.sell"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=200,
			units_per_minute=20,
			x=0,y=0,z=0, -- pos
			radius=5, height=2.5, -- area
			blip=true, -- Should transformer have blip
			blipid="jernseller", -- Unique id for blip
			blipicon=431,
			blipcolor=22,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg jern"] = { -- action name
					description="Sælg jern.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=3000, -- money earned per unit
					reagents={ -- items taken per unit
						["jern"] = 1
					},
					products={} -- items given per unit
				}
			}
		},
		positions = {
			{844.42065429688,-2361.8388671875,30.343671798706}
		},
		duration = 110 -- 5 days (time before switching position, min 5 mins.)
	},
  
	-- DIAMANTER
	["Kulmine"] = {
		def = {
			name="Kulmine", -- menu name
			permissions = {"mining.harvest"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=175,
			units_per_minute=10,
			x=0,y=0,z=0, -- pos
			radius=5, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="coalmine", -- Unique id for blip
			blipicon=501,
			blipcolor=40,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Hak kul"] = { -- action name
					description="Udvind kul for at fremstille diamanter.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["kul"] = 1,
					}
				}
			}
		},
		positions = {
			{2908.2556152344,2787.9638671875,46.201290130615}
		},
		duration = 90 -- 5 days (time before switching position, min 5 mins.)
	},
	["Kul fremstilling"] = {
		def = {
			name="Kul fremstilling", -- menu name
			permissions = {"mining.process"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=175,
			units_per_minute=10,
			x=0,y=0,z=0, -- pos
			radius=5, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="coalprocess", -- Unique id for blip
			blipicon=501,
			blipcolor=40,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fremstil diamanter"] = { -- action name
					description="Brug kul til at fremstille diamanter.", -- action description
					work=45,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["kul"] = 15
					},
					products={ -- items given per unit
						["diamant"] = 1
					}
				}
			}
		},
		positions = {
			{2776.9641113281,1427.2604980469,24.520523071289}
		},
		duration = 100 -- 5 days (time before switching position, min 5 mins.)
	},
	["Smykkeforretning"] = {
		def = {
			name="Smykkeforretning", -- menu name
			permissions = {"mining.sell"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=200,
			units_per_minute=20,
			x=0,y=0,z=0, -- pos
			radius=5, height=2.5, -- area
			blip=true, -- Should transformer have blip
			blipid="diamondseller", -- Unique id for blip
			blipicon=431,
			blipcolor=67,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg diamanter"] = { -- action name
					description="Sælg diamanter.", -- action description
					work=3,
					in_money=0, -- money taken per unit
					out_money=7500, -- money earned per unit
					reagents={ -- items taken per unit
						["diamant"] = 1
					},
					products={} -- items given per unit
				}
			}
		},
		positions = {
			{-620.74896240234,-228.5858001709,38.057048797607}
		},
		duration = 110 -- 5 days (time before switching position, min 5 mins.)
	},
  
	-- LSD
	["Syre produktion"] = {
		def = {
			name="Syre produktion", -- menu name
			permissions = {"drugseller.harvest"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=1000,
			units_per_minute=0,
			x=0,y=0,z=0, -- pos
			radius=5.5, height=3, -- area
			blip=false, -- Should transformer have blip
			blipid="acidfarm", -- Unique id for blip
			blipicon=310,
			blipcolor=1,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Producer syre"] = { -- action name
					description="Producer syre som bruges til at fremstille LSD.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["acid"] = 1,
					}
				}
			}
		},
		positions = {
			{1392.2579345703,3604.951171875,38.941940307617},
			{31.499965667725,3671.5454101563,40.44057846069},
			{2433.4699707031,4968.4106445313,42.34756469726}
		},
		duration = math.random(120,300) -- 5 days (time before switching position, min 5 mins.)
	},
	["LSD fremstilling"] = {
		def = {
			name="LSD fremstilling", -- menu name
			permissions = {"drugseller.process"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=250,
			units_per_minute=35,
			x=0,y=0,z=0, -- pos
			radius=5, height=2, -- area
			blip=true, -- Should transformer have blip
			blipid="acidprocess", -- Unique id for blip
			blipicon=310,
			blipcolor=2,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fremstil LSD"] = { -- action name
					description="Brug syre til at fremstille LSD.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["acid"] = 2
					},
					products={ -- items given per unit
						["lsd"] = 1
					}
				}
			}
		},
		positions = {
			{3560.1772460938,3673.3359375,29.121829986572}
		},
		duration = 65 -- 5 days (time before switching position, min 5 mins.)
	},
	["Lars LS Dary"] = { -- LSD dealer
		def = {
			name="Lars LS Dary", -- menu name
			permissions = {"drugseller.sell"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=250,
			units_per_minute=50,
			x=0,y=0,z=0, -- pos
			radius=5, height=2.5, -- area
			blip=true, -- Should transformer have blip
			blipid="lsdselling", -- Unique id for blip
			blipicon=280,
			blipcolor=1,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg LSD"] = { -- action name
					description="Sælg noget LSD.", -- action description
					work=1,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["lsd"] = 1
					},
					products={ -- items given per unit
						["dirty_money"] = 900
					}
				}
			}
		},
		positions = {
			{-607.15863037109,-1630.9095458984,27.010799407959},
			{-2187.2780761719,4250.37545684648,48.939949035645}
		},
		duration = math.random(60,240) -- 5 days (time before switching position, min 5 mins.)
	},
	
	-- HASH
	["Hampblad farm"] = {
		def = {
			name="Hampblad farm", -- menu name
			permissions = {"drugseller.harvest"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=1000,
			units_per_minute=0,
			x=0,y=0,z=0, -- pos
			radius=10, height=5.5, -- area
			blip=true, -- Should transformer have blip
			blipid="weedfarm", -- Unique id for blip
			blipicon=469,
			blipcolor=2,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Høst hampblade"] = { -- action name
					description="Høst hampblade til at fremstille hash.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["weed"] = 1,
					}
				}
			}
		},
		positions = {
			{3404.9577636718,5501.369140625,24.236604690552,70.638534545898}
		},
		duration = math.random(120,300) -- 5 days (time before switching position, min 5 mins.)
	},
	["Hash fremstilling"] = {
		def = {
			name="Hash fremstilling", -- menu name
			permissions = {"drugseller.process"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=420,
			units_per_minute=50,
			x=0,y=0,z=0, -- pos
			radius=3.1, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="hashfremstil", -- Unique id for blip
			blipicon=140,
			blipcolor=2,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fremstil hash"] = { -- action name
					description="Lav hampblade om til joints.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["weed"] = 2,
						["jointpapir"] = 1
					},
					products={ -- items given per unit
						["hash"] = 1,
					}
				}
			}
		},
		positions = {
			{2330.0776367188,2571.5844726563,46.679084777832}
		},
		duration = 65 -- 5 days (time before switching position, min 5 mins.)
	},
	["Henning Hamphry"] = { -- Hash dealer
		def = {
			name="Henning Hamphry", -- menu name
			permissions = {"drugseller.sell"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=420,
			units_per_minute=50,
			x=0,y=0,z=0, -- pos
			radius=6, height=2.5, -- area
			blip=true, -- Should transformer have blip
			blipid="weedselling", -- Unique id for blip
			blipicon=140,
			blipcolor=25,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg hash"] = { -- action name
					description="Sælg dine joints.", -- action description
					work=1,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["hash"] = 1
					},
					products={ -- items given per unit
						["dirty_money"] = 800
					}
				}
			}
		},
		positions = {
			{1124.9066162109,-981.99243164063,45.783157348633,40.590618133545},
			{-1171.3946533203,-1569.5324707031,4.6636214256287,40.590618133545}
		},
		duration = math.random(60,240) -- 5 days (time before switching position, min 5 mins.)
	},
	
	-- KOKAIN
	["Kokaplante farm"] = {
		def = {
			name="Kokaplante farm", -- menu name
			permissions = {"drugseller.harvest"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=1000,
			units_per_minute=0,
			x=0,y=0,z=0, -- pos
			radius=12, height=5.5, -- area
			blip=false, -- Should transformer have blip
			blipid="cocafarm", -- Unique id for blip
			blipicon=501,
			blipcolor=1,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Samle kokaplanter"] = { -- action name
					description="Samle kokaplanter til at fremstille Kokain.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["cocaineplant"] = 1,
					}
				}
			}
		},
		positions = {
			{1919.9481201172,4808.8583984375,44.653816223145},
			{2286.9584960938,4763.3662109375,38.611709594726,217.32481384278}
		},
		duration = math.random(120,300) -- 5 days (time before switching position, min 5 mins.)
	},
	["Kokain fremstilling"] = {
		def = {
			name="Kokain fremstilling", -- menu name
			permissions = {"drugseller.process"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=200,
			units_per_minute=35,
			x=0,y=0,z=0, -- pos
			radius=5.5, height=1.5, -- area
			blip=false, -- Should transformer have blip
			blipid="cocaprocess", -- Unique id for blip
			blipicon=497,
			blipcolor=1,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Fremstil kokain"] = { -- action name
					description="Omdan kokaplanter til kokain.", -- action description
					work=2,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["cocaineplant"] = 2,
					},
					products={ -- items given per unit
						["cocaine"] = 1,
					}
				}
			}
		},
		positions = {
			{1593.9842529297,3588.7055664063,38.766490936279}
		},
		duration = 65 -- 5 days (time before switching position, min 5 mins.)
	},
	["Fernandez Cokeandez"] = { -- Coke dealer
		def = {
			name="Fernandez Cokeandez", -- menu name
			permissions = {"drugseller.sell"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=200,
			units_per_minute=35,
			x=0,y=0,z=0, -- pos
			radius=5, height=2.5, -- area
			blip=false, -- Should transformer have blip
			blipid="cocaineselling", -- Unique id for blip
			blipicon=280,
			blipcolor=1,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Sælg kokain"] = { -- action name
					description="Sælg dit kokain.", -- action description
					work=1,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["cocaine"] = 1
					},
					products={ -- items given per unit
						["dirty_money"] = 950
					}
				}
			}
		},
		positions = {
			{-1608.5828857422,-999.53784179688,7.6085529327392},
			{-1888.9588623047,2091.6857910156,141.80706787109}
		},
		duration = math.random(60,240) -- 5 days (time before switching position, min 5 mins.)
	},
	
	-- HVIDVASKER
	["Hvidvasker"] = {
		def = {
			name="Hvidvasker", -- menu name
			permissions = {"money.launder"}, -- you can add permissions
			r=200,g=0,b=0, -- color
			max_units=250,
			units_per_minute=35,
			x=0,y=0,z=0, -- pos
			radius=11.5, height=1.0, -- area
			blip=true, -- Should transformer have blip
			blipid="hvidvasker", -- Unique id for blip
			blipicon=500,
			blipcolor=4,
			marker=false,
			markerid=0,
			markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Hvidvask penge (10000)"] = { -- action name
				description="Hvidvask 10000 sorte penge (80% udbytte)", -- action description
				work=4,
				in_money=0, -- money taken per unit
				out_money=8000, -- money earned per unit
				reagents={ -- items taken per unit
					["dirty_money"] = 10000
				}, -- items taken per unit
				products={}
				}
			}
		},
		positions = {
			{-185.70574951172,6142.1762695313,36.8630027771}
		},
		duration = 120 -- 5 days (time before switching position, min 5 mins.)
	},
	
	-- HACKING
	["Hacker"] = {
		def = {
			name="Hacker", -- menu name
			permissions = {"hacker.0day"}, -- you can add permissions
			r=255,g=125,b=0, -- color
			max_units=5,
			units_per_minute=5,
			x=0,y=0,z=0, -- pos
			radius=2, height=1.0, -- area
			blip=true, -- Should transformer have blip
			blipid="hackerjob", -- Unique id for blip
			blipicon=521,
			blipcolor=4,
			marker=false,
			markeridmarkerid="hacker0day",
			markerdata={707.26550292969,-966.63708496094,29.453418731689,1.0,1.0,1.0,0,255,125,125,150}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Hack 0days"] = { -- action name
					description="Hack dig frem til 0day exploits.", -- action description
					work=25,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={}, -- items taken per unit
					products={ -- items given per unit
						["0day"] = 1,
					},
					aptitudes={ -- optional
						["hacker.hacking"] = 1 -- "group.aptitude", give 1 exp per unit
					}
				}
			}
		},
		positions = {
			{707.357238769531,-966.98876953125,30.4128551483154}
		},
		duration = 80 -- 5 days (time before switching position, min 5 mins.)
	},
	["Sårbar hæveautomat"] = {
		def = {
			name="Sårbar hæveautomat", -- menu name
			permissions = {"hacker.0day"}, -- you can add permissions
			r=0,g=200,b=0, -- color
			max_units=2,
			units_per_minute=0,
			x=0,y=0,z=0, -- pos
			radius=4, height=1.5, -- area
			blip=true, -- Should transformer have blip
			blipid="hackableatm", -- Unique id for blip
			blipicon=434,
			blipcolor=2,
			marker=true,
			markerid="hackableatm",
			markerdata={1,1,0.5,133,187,101,125,150}, -- sx,sy,sz,r,g,b,a,vis_distance
			recipes = {
				["Hack hæveautomat"] = { -- action name
					description="Hack hæveautomaten for at få penge ud.", -- action description
					work=25,
					in_money=0, -- money taken per unit
					out_money=0, -- money earned per unit
					reagents={ -- items taken per unit
						["0day"] = 1
					},
					products={ -- items given per unit
						["dirty_money"] = 4000
					}
				}
			}
		},
		positions = {
			{-386.733,6045.953,31.501},
			{-284.037,6224.385,31.187},
			{-284.037,6224.385,31.187},
			{-135.165,6365.738,31.101},
			{-110.753,6467.703,31.784},
			{-94.9690,6455.301,31.784},
			{155.4300,6641.991,31.784},
			{174.6720,6637.218,31.784},
			{1735.114,6411.035,35.164},
			{1702.842,4933.593,42.051},
			{1967.333,3744.293,32.272},
			{1821.917,3683.483,34.244},
			{1174.532,2705.278,38.027},
			{540.0420,2671.007,42.177},
			{2564.399,2585.100,38.016},
			{2558.683,349.6010,108.050},
			{2558.051,389.4817,108.660},
			{1077.692,-775.796,58.218},
			{1139.018,-469.886,66.789},
			{1168.975,-457.241,66.641},
			{1153.884,-326.540,69.245},
			{381.2827,323.2518,103.270},
			{236.4638,217.4718,106.840},
			{265.0043,212.1717,106.780},
			{285.2029,143.5690,104.970},
			{157.7698,233.5450,106.450},
			{-164.568,233.5066,94.919},
			{-1827.04,785.5159,138.020},
			{-1409.39,-99.2603,52.473},
			{-1205.35,-325.579,37.870},
			{-1215.64,-332.231,37.881},
			{-2072.41,-316.959,13.345},
			{-2975.72,379.7737,14.992},
			{-2962.60,482.1914,15.762},
			{-2955.70,488.7218,15.486},
			{-3044.22,595.2429,7.595},
			{-3144.13,1127.415,20.868},
			{-3241.10,996.6881,12.500},
			{-3241.11,1009.152,12.877},
			{-1305.40,-706.240,25.352},
			{-538.225,-854.423,29.234},
			{-711.156,-818.958,23.768},
			{-717.614,-915.880,19.268},
			{-526.566,-1222.90,18.434},
			{-256.831,-719.646,33.444},
			{-203.548,-861.588,30.205},
			{112.4102,-776.162,31.427},
			{112.9290,-818.710,31.386},
			{119.9000,-883.826,31.191},
			{149.4551,-1038.95,29.366},
			{-846.304,-340.402,38.687},
			{-1204.35,-324.391,37.877},
			{-1216.27,-331.461,37.773},
			{-56.1935,-1752.53,29.452},
			{-261.692,-2012.64,30.121},
			{-273.001,-2025.60,30.197},
			{314.187,-278.621,54.170},
			{-351.534,-49.529,49.042},
			{24.589,-946.056,29.357},
			{-254.112,-692.483,33.616},
			{-1570.197,-546.651,34.955},
			{-1415.909,-211.825,46.500},
			{-1430.112,-211.014,46.500},
			{33.232,-1347.849,29.497},
			{129.216,-1292.347,29.269},
			{287.645,-1282.646,29.659},
			{289.012,-1256.545,29.440},
			{295.839,-895.640,29.217},
			{1686.753,4815.809,42.008},
			{-302.408,-829.945,32.417},
			{5.134,-919.949,29.557}
		},
		duration = 15 -- 10 minutes (time before switching position, min 5 mins.)
	}
}

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {

  ["Syre produktion"] = 45000,
  ["Kokaplante farm"] = 65000,
  ["Kokain fremstilling"] = 25000,
  ["Fernandez Cokeandez"] = 25000,
  },
  positions = {
    {467.53570556641,-729.20050048828,27.364074707031},
	{-30.707229614258,-1978.7349853516,5.4116673469543},
	{-838.40179443359,-134.61755371094,28.18497657775},
  }, 
  interval = 20, -- interval in minutes for the reseller respawn
  duration = 10, -- duration in minutes of the spawned reseller
  blipid = 458,
  blipcolor = 83

}

return cfg