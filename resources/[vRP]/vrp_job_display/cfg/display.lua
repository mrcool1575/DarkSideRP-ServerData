
-- return cfg

local cfg = {}

cfg.firstjob = "Civil" -- set this to your first job, for example "citizen", or false to disable

-- text display css
cfg.display_css = [[
@font-face {
  font-family: 'hyperion';
  src: url('https://byhyperion.net/stylesheet/fonts/american_captain.ttf');
}
.div_job{
  height: 1%;
  width: 1%;
  left: 4%;
  font-size: 29px;
  font-weight: bold;
  color: white;
  text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
  font-family: "hyperion";
}
]]

-- icon display css
cfg.icon_display_css = [[
.div_job_icon{
  position: absolute;
  height: 3%;
  width: 1.8%;
  bottom: 0.2%;
  left: 16%;
}
]]

-- list of ["group"] => css for icons
cfg.group_icons = {
  ["policechief"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/utUO8MI.png);
    }
  ]],
  ["Politi Betjent"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/utUO8MI.png);
    }
  ]],
  ["Politi Elev"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/utUO8MI.png);
    }
  ]],
  ["AKS"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/utUO8MI.png);
    }
  ]],
  ["Overlæge"] = [[
    .div_job_icon{
      content: url(https://imgur.com/ipRqg4f.png);
    }
  ]],
  ["Læge"] = [[
    .div_job_icon{
      content: url(https://imgur.com/ipRqg4f.png);
    }
  ]],
  ["Lægeelev"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/ybJTX20.png);
    }
  ]],
  ["Mekaniker"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/wRiyc7u.png);
    }
  ]],
  ["Taxa"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/B9eh4TF.png);
    }
  ]],
  ["Træhugger"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/463522339263479819/529284286382211083/axe-and-wood-stump-for-forestry-and-vector-20403601.png);
    }
  ]],
  ["Advokat"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/cH4d1y3.png);
    }
  ]],
  ["Dommer"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/cH4d1y3.png);
    }
  ]],
  ["Civil"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/jvjuLDU.png);
    }
  ]],
  ["Kriminel"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/ksZCUVG.png);
    }
  ]],
  ["Johnson pizza"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/TlNBvTN.png);
    }
  ]],
  ["Postbud"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/TlNBvTN.png);
    }
  ]],
  ["Skraldemand"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/TlNBvTN.png);
    }
  ]],
  ["Lastbilchauffør"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/TlNBvTN.png);
    }
  ]],
  ["Pengetransport"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/qsiWYfl.png);
    }
  ]],
  ["Minearbejder"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/5RPLPtw.png);
    }
  ]],
  ["PET-agent"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/utUO8MI.png);
    }
  ]],
  ["Psykolog"] = [[
    .div_job_icon{
      content: url(http://api.byhyperion.net/code/gtav/jobs/psych.png);
    }
  ]],
  ["Fisker"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/uJaybAu.png);
    }
  ]],
  ["Journalist"] = [[
    .div_job_icon{
      content: url(https://i.imgur.com/jvjuLDU.png);
    }
  ]], -- this is an example, add more under it using the same model, leave the } at the end.
}
return cfg