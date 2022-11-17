pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
function _init()
	--timer default
	td=20
	--set timer to default 
	t=td
	--pointer color for blink
	blink=7
	--game status (0=main menu, 1=game)
	status=0
	--main menu option
	mmo=1
	--text for whole game
	txt={
		a="title game",b="by k_kuri",
		c="play",d="options",e="quit",
		f="this is the game",g="here are your options"
	     } 
end
---------------------------
function _update()
 ::updatestart::
	 if (status==0) goto updatemenu
	 if (status==1) goto updategame 
	 if (status==2) goto updateoptions
 ::updatemenu::
	 if (t>=1) 		 t-=1 
	 if t==0 then 
			if blink==7 then 
    blink=0 t=td		
			elseif blink==0	then 
    blink=7 t=td 
			end
	 end
  --main menu selection setup
 	if     mmo==1 then
  	if     btnp(2) then 
    mmo=3 blink=7 t=td
 		elseif btnp(3) then
    mmo=2 blink=7 t=td
 		elseif btnp(5) then 
    status=1
 		end
 	elseif mmo==2 then
 	 if     btnp(2) then
    mmo=1 blink=7 t=td
 		elseif btnp(3) then
    mmo=3 blink=7 t=td
 		elseif btnp(5) then
    status=2
 		end
 	elseif mmo==3 then 
 	 if		   btnp(2) then
    mmo=2 blink=7 t=td
 		elseif btnp(3) then 
    mmo=1 blink=7 t=td
 	 elseif btnp(5) then
    cls() stop()
 	 end
 	end
	 goto updateend
 ::updategame::
	 if (btnp(4)) status=0
	 goto updateend

 ::updateoptions::
	 if (btnp(4)) status=0
 	goto updateend

 ::updateend::
end
---------------------------
function _draw()
 ::drawstart::
	 cls()
	 if (status==0) goto drawmm
 	if (status==1) goto drawgame
 	if (status==2) goto drawoptions
 ::drawmm::
 	print(txt.a,_hcenter(txt.a),0,8)
 	print(txt.b,_hcenter(txt.b),8,8)
 	print(txt.c,_hcenter(txt.c),61,8)
 	print(txt.d,_hcenter(txt.d),69,8)
 	print(txt.e,_hcenter(txt.e),78,8)
 	print("➡️",_hcenter(lo(mmo))-8,mmp(mmo),blink)
   goto drawend
 ::drawgame::
   print(txt.f,_hcenter(txt.f),0,7)
   goto drawend
 ::drawoptions::
   print(txt.g,_hcenter(txt.g),0,7)
 	goto drawend
 ::drawend::
end
-->8
--title--

--centers text
function _hcenter(s)
	return 64-#s*2
 --
 --
 --
 --
end
--timer for pointer blink
function _timer()
	local t=100 ts=0
	if ts==0 then
 		if (t<=1) t-=1
 	else ts+=1
 	end
 return t
end
--sets main menu pointer position
function mmp(s)
 if 		s==1 then return 61
 elseif s==2 then return 69
 elseif s==3 then return 78
 end
end

function lo(s)
	if		   s==1 then return txt.c
	elseif s==2 then return txt.d
	elseif s==3 then return txt.e
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888777777888eeeeee888eeeeee888888888888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888778887788ee88eee88ee888ee88888888888888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888777878778eeee8eee8eeeee8ee88888e88888888888888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888777878778eeee8eee8eee888ee8888eee8888888888888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888777878778eeee8eee8eee8eeee88888e88888888888888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888777888778eee888ee8eee888ee888888888888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888777777778eeeeeeee8eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111177111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1ee11ee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd11111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1ee111ee1eee1eee11ee1ee1111111111616166616611666166616661171117111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111111111616161616161616116116111711111711111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e1e1111e111e11e1e1e1e111111111616166616161666116116611711111711111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111111111616161116161616116116111711111711111111111111111111111111111111111111111111111111111111
1e1111ee1e1e11ee11e11eee1ee11e1e111116661166161116661616116116661171117111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee1111116616661666166616161166111111111cc111111eee1e1e1eee1ee1111111ee11ee1eee11ee11111616166616611666166616661166
1111111111e11e1111111611116116161161161616111777177711c1111111e11e1e1e111e1e11111e111e1e11e11e1e11111616161616161616116116111611
1111111111e11ee111111666116116661161161616661111111111c1111111e11eee1ee11e1e11111e111e1e11e11e1e11111616166616161666116116611611
1111111111e11e1111111116116116161161161611161777177711c1111111e11e1e1e111e1e11111e1e1e1e11e11e1e11111616161116161616116116111616
111111111eee1e111111166111611616116111661661111111111ccc111111e11e1e1eee1e1e11111eee1ee111e11ee111111166161116661616116116661666
11111111111111111111111111111111111111111111111111111111888881111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee1111116616661666166616161166111111111ccc88888eee1e1e1eee1ee1111111ee11ee1eee11ee11111616166616611666166616661166
1111111111e11e11111116111161161611611616161117771777111c888881e11e1e1e111e1e11111e111e1e11e11e1e11111616161616161616116116111616
1111111111e11ee11111166611611666116116161666111111111ccc888881e11eee1ee11e1e11111e111e1e11e11e1e11111616166616161666116116611616
1111111111e11e111111111611611616116116161116177717771c11888881e11e1e1e111e1e11111e1e1e1e11e11e1e11111616161116161616116116111616
111111111eee1e111111166111611616116111661661111111111ccc888881e11e1e1eee1e1e11111eee1ee111e11ee111111166161116661616116116661661
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee11111666171111111cc111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111e11e11111111611171177711c111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111e11ee1111111611117111111c111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111e11e11111111611171177711c111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1111111161171111111ccc11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111eee1e1e1eee1ee111111666111111111cc11111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11e1e1e111e1e111111611111177711c11111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11eee1ee11e1e111111611777111111c11111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11e1e1e111e1e111111611111177711c11111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11e1e1eee1e1e11111161111111111ccc1111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1ee11ee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ee11e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1e1eee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee11111666111111111ccc11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111e11e1111111161177717771c1c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111e11ee111111161111111111c1c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111e11e1111111161177717771c1c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1111111161111111111ccc11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111eee1e1e1eee1ee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11e1e1e111e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11eee1ee11e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11e1e1e111e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111e11e1e1eee1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111eee1eee1111111111111111111116661611166616611616111111111ccc11111111111111111111111111111111111111111111
11111111111111111111111111e11e11111111111111111111111616161111611616161617771777111c11111111111111111111111111111111111111111111
11111111111111111111111111e11ee1111111111111111111111661161111611616166111111111111c11111111111111111111111111111111111111111111
11111111111111111111111111e11e11111111111111111111111616161111611616161617771777111c11111111111111111111111111111111111111111111
1111111111111111111111111eee1e11111111111111111111111666166616661616161611111111111c11111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111111111111111eee1e1e1eee1ee111111666161116661661161611111ccc111116661111166611661111111111111111111111111111
1111111111111111111111111111111111e11e1e1e111e1e11111616161111611616161617771c1c111111611777116116161111111111111111111111111111
1111111111111111111111111111111111e11eee1ee11e1e11111661161111611616166111111c1c111111611111116116161111111111111111111111111111
1111111111111111111111111111111111e11e1e1e111e1e11111616161111611616161617771c1c111111611777116116161111111111111111111111111111
1111111111111111111111111111111111e11e1e1eee1e1e11111666166616661616161611111ccc111111611111116116611111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111111111111111eee1e1111ee1eee1eee1eee111116661611166616611616111111111ccc11111111111111111111111111111111111111111111
1111111111111111111111111e111e111e111e1111e11e11111116161611116116161616177717771c1c11111111111111111111111111111111111111111111
1111111111111111111111111ee11e111eee1ee111e11ee1111116611611116116161661111111111c1c11111111111111111111111111111111111111111111
1111111111111111111111111e111e11111e1e1111e11e11111116161611116116161616177717771c1c11111111111111111111111111111111111111111111
1111111111111111111111111eee1eee1ee11eee1eee1e11111116661666166616161616111111111ccc11111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111111111111111eee1e1e1eee1ee111111666161116661661161611111ccc111116661111166611661111111111111111111111111111
1111111111111111111111111111111111e11e1e1e111e1e1111161616111161161616161777111c111111611777116116161111111111111111111111111111
1111111111111111111111111111111111e11eee1ee11e1e1111166116111161161616611111111c111111611111116116161111111111111111111111111111
1111111111111111111111111111111111e11e1e1e111e1e1111161616111161161616161777111c111111611777116116161111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822882228882822282228888888888888888888888888888888888888888888888888282828282228882822282288222822288866688
82888828828282888888882882828828828288828888888888888888888888888888888888888888888888888282828282888828828288288282888288888888
82888828828282288888882882228828822282228888888888888888888888888888888888888888888888888222822282228828822288288222822288822288
82888828828282888888882888828828828282888888888888888888888888888888888888888888888888888882888288828828828288288882828888888888
82228222828282228888822288828288822282228888888888888888888888888888888888888888888888888882888282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__map__
0000000000000000000000000009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
