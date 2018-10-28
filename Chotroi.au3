#RequireAdmin

WinSetTitle('La[2]','','Boom')
While 1
ControlClick('Boom','','','left',1,122-2, 119-23)
ControlClick('Boom','','','left',1,48-2, 119-23)
Do
ControlClick('Boom','','','left',1,406-2, 423-23)
Until Hex(PixelGetColor(164,199))='00237BD4'
ControlClick('Boom','','','left',1,460-2, 196-23)
ControlClick('Boom','','','left',1,305-2, 458-23)
ControlClick('Boom','','','left',1,406-2, 423-23)
ControlClick('Boom','','','left',1,406-2, 423-23)
ControlClick('Boom','','','left',1,406-2, 423-23)
Do
ControlClick('Boom','','','left',1,406-2, 423-23)
Until Hex(PixelGetColor(164,199))='00237BD4'
WEnd
;~ ControlClick('Boom','','','left',1,48, 119)
;~ ControlClick('Boom','','','left',1,48, 119)