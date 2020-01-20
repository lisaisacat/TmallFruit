-- Create By TouchSpriteStudio on 11:14:10
-- Copyright © TouchSpriteStudio . All rights reserved.

--local ts = require"ts"
require"TSLib"
w,h = getScreenSize()
fms = 1000
--1080P 15 号字高 70，宽 40
--iPhone 6 15 号字高 40，宽 30
--iPhone 6P 15 号字高 60，宽 50
if w == 1080 and h == 1920 then
	lx0,ly0,rx0,ry0 = 10,220,1070,300
	lx,ly,rx,ry = 0,0,1050,70
elseif w == 720 and h == 1280 then
	lx0,ly0,rx0,ry0 = 10,120,710,200
	lx,ly,rx,ry = 0,0,700,80
elseif w == 640 and h == 1136 then
	lx0,ly0,rx0,ry0 = 10,130,630,180
	lx,ly,rx,ry = 0,0,620,40
elseif w == 1242 and h == 2208 then
	lx0,ly0,rx0,ry0 = 10,200,1232,260
	lx,ly,rx,ry = 0,0,1222,60
else
	mLog("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
end
glSettings({switch = "1101", x1 = lx0, y1 = ly0, x2 = rx0, y2 = ry0,tsp_switch = true})
--fwShowWnd("banner",lx0,ly0,rx0,ry0,1);
--fwShowTextView("banner","text1","开启浮动窗口","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
--显示一个文字视图
--mSleep(500);

UINew("天猫农场","立即运行","立即退出","tmfruit.dat",0,30)
UILabel("使用须知",20,"center","230,50,92")
UILabel("1. 需要手动进入活动页面脚本才生效",16,"left","0,0,0")
UILabel("2. 目前已兼容分辨率：安卓 1920x1080",16,"left","0,0,0")
UILabel("您当前设备的分辨率为"..h.."x"..w,16,"left","0,0,0")
UILabel("农场任务",20,"center","230,50,92")
UIRadio("types","偷阳光,领阳光,领福气","0")
UILabel("【领阳光】任务（从下往上数）",20,"center","230,50,92")
UICheck("sun2,sun3,sun4","倒数第二,倒数第三,倒数第四","0@2")
UILabel("【福气】任务（从下往上数）",20,"center","230,50,92")
UICheck("task1,task2,task3,task4,task5,task6","任务1,任务2,任务3,任务4,任务5,任务6","1@2@3@4@5")
UILabel("【福气】任务类型",20,"center","230,50,92")
UIRadio("mode","只找浏览任务,全部任务类型","1")
UIShow()

function window()
	ss = 30
	for i = 1,30 do
		ss = ss-1
		mLog("倒计时 "..ss)
		mSleep(fms)
	end
end

t0 = os.time()

function finish()
	t1 = os.time()
	if t1-t0 >= 30 then
		mLog("倒计时完成，已获得福气")
		mSleep(fms)
		if w == 640 and h == 1136 then
			multiColTap({
					{   44,   70, 0xffffff},
					{   35,   79, 0xffffff},
					{   42,   95, 0xffffff},
					{   38,   89, 0xff6483},
					{   31,   83, 0xffffff},
				})
			multiColTap({
					{  591,   74, 0xf9eff2},
					{  585,   72, 0xfaf0f3},
					{  587,   71, 0xf5eef0},
					{  587,   69, 0xfdfbfc},
					{  586,   69, 0xfdf9fa},
				})--关闭
			multiColTap({
					{   31,   64, 0xf9f9f9},
					{   42,   78, 0xf9f9f9},
					{   38,   83, 0xf9f9f9},
					{   38,   91, 0x444444},
					{   38,   76, 0x444444},
					{   31,   83, 0x444444},
				})--白底左上角<
			multiColTap({
					{   37,   67, 0xff4151},
					{   43,   83, 0xff384e},
					{   39,  100, 0xff304a},
					{   43,   95, 0xffffff},
					{   41,   74, 0xffffff},
					{   32,   83, 0xffffff},
				})--红底左上角<
			multiColTap({
					{   44,   77, 0xda1b39},
					{   27,   74, 0xda1b39},
					{   30,   91, 0xd71a3a},
					{   39,   92, 0xffffff},
					{   39,   75, 0xffffff},
					{   31,   83, 0xffffff},
				})--红底左上角<
		elseif w == 1242 and h == 2208 then
			multiColTap({{   69,  103, 0xffffff},{   62,  109, 0xffffff},{   64,  144, 0xffffff},{   55,  135, 0xffffff},{   46,  126, 0xffffff},})
		elseif w == 1080 and h == 1920 then
			os.execute("input keyevent KEYCODE_BACK")
			mSleep(1000)
		elseif w == 720 and h == 1280 then
			os.execute("input keyevent KEYCODE_BACK")
			mSleep(1000)
		else
			mLog("暂不支持您的手机分辨率")
			mSleep(3000)
		end
		t0 = os.time()
	end
end

if w == 1080 and h == 1920 then
	mLog("分辨率："..w.."x"..h)
	mSleep(fms)
	while true do
		if types == "偷阳光" then
			x, y = findImageInRegionFuzzy("集阳光兑好礼.png", 90,  849, 957, 1070, 1020, 0xe4f0a1,2);
			if x ~= -1 and y ~= -1 then
				tap(x,y+20)
				mLog("集阳光兑好礼")
				mSleep(fms)
			end 
			x, y = findImageInRegionFuzzy("偷阳光.png", 90,  891, 1278, 1068, 1452, 0x9cd345,2);
			if x ~= -1 and y ~= -1 then
				tap(x+50,y+50)
				mLog("偷阳光")
				mSleep(fms)
			end
			x, y = findImageInRegionFuzzy("偷阳光列表.png", 90,  398, 461, 675, 563, 0x9cd345,2);
			if x ~= -1 and y ~= -1 then
				mLog("偷阳光列表")
				mSleep(fms)
				x, y = findImageInRegionFuzzy("可偷取.png", 90,  741, 728, 959, 815, 0xffb10b,2);
				if x ~= -1 and y ~= -1 then
					tap(x+100,y+30)
					mLog("可偷取")
					mSleep(5000)
				end
			end
			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-18|3|0xffffff,19|3|0xffffff,-1|6|0xffffff,-11|33|0xffffff,18|33|0xffffff,36|26|0xffffff,55|-5|0xffffff,53|20|0xffffff,71|29|0xffffff", 90, 106, 104, 412, 172)
			if x ~= -1 and y ~= -1 then
				point = findMultiColor( 0xf9c94e, "17|-2|0xfcd347,-15|-14|0xfeb308,-6|21|0xffb302,5|-6|0xfcdb63,0|7|0xf9c24b", 90, 13, 470, 1057, 900,{orient = 1,miss = 10 })
				if #point ~= 0 then  --如返回的table不为空（至少找到一个符合条件的点）
					for var = 1,#point do
						nLog(point[var].x..":"..point[var].y)
						tap(point[var].x,point[var].y)
						mLog("收取阳光")
						mSleep(fms)
					end
				else
					mSleep(5000)
					if multiColor({
							{ 1039, 1513, 0xf68574},
							{  972, 1493, 0x76dfff},
							{  937, 1546, 0xffffff},
							{  977, 1544, 0xfdde7a},
							}) == false then
						os.execute("input keyevent KEYCODE_BACK")
						mLog("没有阳光啦！返回")
						mSleep(fms)
					end
				end
			end
		elseif types == "领阳光" then
			multiColTap({
					{ 1039, 1513, 0xf68574},
					{  972, 1493, 0x76dfff},
					{  937, 1546, 0xffffff},
					{  977, 1544, 0xfdde7a},
				})--领阳光
			if task4=="倒数第四" then
				if multiColor({
						{  911,  962, 0xffffff},
						{  853, 1045, 0xff0036},
						{  943, 1045, 0xff0036},
						{  988, 1002, 0xfff0f3},
						{  906, 1033, 0xfff0f3},
						}) then--倒数第四
					mLog("点击倒数第四任务")
					mSleep(fms)
					tap(975, 1006)
					t0 = os.time()
					window()
					finish()
				end
			end
			if task3=="倒数第三" then
				if multiColor({
						{  793, 1198, 0xff0036},
						{  815, 1197, 0xfff0f3},
						{  918, 1160, 0xff0036},
						{  925, 1243, 0xffffff},
						{  927, 1225, 0xfff0f3},
						}) then--倒数第三
					mLog("点击倒数第三任务")
					mSleep(fms)
					tap(927, 1225)
					t0 = os.time()
					window()
					finish()
				end
			end
			if task2=="倒数第二" then
				if multiColor({
						{  794, 1390, 0xff0036},
						{  806, 1386, 0xfff0f3},
						{  900, 1440, 0xffffff},
						{  904, 1424, 0xfff0f3},
						{ 1015, 1392, 0xff0036},
						{  926, 1363, 0xfff0f3},
						}) then--倒数第二
					mLog("点击倒数第二任务")
					mSleep(fms)
					tap(926, 1363)
					t0 = os.time()
					window()
					finish()
				end
			end
			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-136|55|0xff0036,72|122|0xffffff,333|79|0xff0036,428|57|0xff0036", 90, 156, 1127, 937, 1370)
			if x ~= -1 then
				mLog("获得阳光按钮")
				mSleep(fms)
				tap(x,y)
				mSleep(fms)
				os.execute("input keyevent KEYCODE_BACK")
				mSleep(1000)
			end
		elseif types == "领福气" then
			x, y = findImageInRegionFuzzy("__encrypt__天猫农场1.png", 90,  675, 650, 843, 782, 0xf6f7f6,2);
			if x ~= -1 and y ~= -1 then
				tap(x+50,y+50)
				mSleep(ms)
				mLog("天猫农场-1")
			end
			x, y = findImageInRegionFuzzy("__encrypt__天猫农场2.png", 90,  680, 681, 819, 787, 0xf6f7f6,2);
			if x ~= -1 and y ~= -1 then
				tap(x+50,y+50)
				mSleep(fms)
				mLog("天猫农场-2")
			end
			x, y = findImageInRegionFuzzy("__encrypt__立即去收.png", 90,  215, 1447, 853, 1625, 0x3b4319,2);
			if x ~= -1 and y ~= -1 then
				tap(x+300,y+80)
				mSleep(fms)
				mLog("丰收时刻")
			end
			x, y = findImageInRegionFuzzy("__encrypt__免费领水果.png", 90,  0, 1599, 254, 1684, 0xb0da58,2);
			if x ~= -1 and y ~= -1 then
				tap(x+100,y+10)
				mSleep(fms)
				mLog("免费领水果")
			end
			x, y = findImageInRegionFuzzy("__encrypt__集福气.png", 90,  857, 1510, 1075, 1748, 0xe5473f,2);
			if x ~= -1 and y ~= -1 then
				tap(x+100,y+70)
				mSleep(fms)
				mLog("集福气")
			end
			x, y = findImageInRegionFuzzy("__encrypt__立即签到.png", 90,  236, 1247, 842, 1366, 0xb0da58,2);
			if x ~= -1 and y ~= -1 then
				tap(x+300,y+20)
				mLog("淘宝人生立即签到")
				mSleep(fms)
			end
			x, y = findImageInRegionFuzzy("__encrypt__获得纽扣确定.png", 90,  260, 1200, 820, 1316, 0xb0da58,2);
			if x ~= -1 and y ~= -1 then
				tap(x+300,y+20)
				mLog("淘宝人生获得金币")
				mSleep(fms)
			end
			x, y = findImageInRegionFuzzy("__encrypt__回到淘宝.png", 90,  238, 1125, 838, 1243, 0xb0da58,2);
			if x ~= -1 and y ~= -1 then
				tap(x+300,y+20)
				mLog("回到淘宝")
				mSleep(fms)
			end
			multiColTap({
					{  953, 1625, 0xe10600},
					{  975, 1576, 0xffeab3},
					{  982, 1618, 0xcf1705},
					{ 1066, 1698, 0xe30100},
				})--右下角入口
			x,y = findMultiColorInRegionFuzzy( 0xfd613f, "63|-13|0xff0036,-99|-18|0xfedfdf,72|-7|0xff0036", 90, 777,  488,994, 1354)--签到
			if x ~= -1 then
				tap(x+100,y+40)
				mLog("签到")
				mSleep(fms)
			end
			ret = imageBinaryzation("__encrypt__去浏览.png",125)
			if task1 == "任务1" then
				if mode == "只找浏览任务" then
					x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 775, 1617, 995, 1712,0x7c4343,2)
					if x ~= -1 then
						tap(x+100,y+40)
						t0 = os.time()
						mLog("点击浏览任务")
						mSleep(fms)
						window()
						finish()
					end
				else
					x,y = findMultiColorInRegionFuzzy( 0xfe6240, "-70|30|0xfd5440,1|65|0xfa453e,87|32|0xfd533f,-1|-20|0xffffff,5|85|0xffffff", 90, 775, 1615, 994, 1712)
					if x ~= -1 then
						tap(x,y)
						t0 = os.time()
						mLog("任务1")
						mSleep(fms)
						window()
						finish()
					end
				end
			end
			if task2 == "任务2" then
				if mode == "只找浏览任务" then
					x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 778, 1426, 991, 1523,0x7c4343,2)
					if x ~= -1 then
						mLog("点击浏览任务")
						mSleep(fms)
						tap(x+100,y+40)
						t0 = os.time()
						window()
						finish()
					end
				else
					x,y = findMultiColorInRegionFuzzy( 0xfe6240, "-70|30|0xfd5440,1|65|0xfa453e,87|32|0xfd533f,-1|-10|0xffffff,5|75|0xffffff", 90, 778, 1396, 991, 1555)
					if x ~= -1 then
						tap(x,y)
						t0 = os.time()
						mLog("任务2")
						mSleep(fms)
						window()
						finish()
					else
						mLog("颜色是："..getColor(906, 1517))
					end
				end
			end
			if task3 == "任务3" then
				if mode == "只找浏览任务" then
					x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 779, 1242, 988, 1338,0x7c4343,2)
					if x ~= -1 then
						mLog("点击浏览任务")
						mSleep(fms)
						tap(x+100,y+40)
						t0 = os.time()
						window()
						finish()
					end
				else
					x,y = findMultiColorInRegionFuzzy( 0xfe6240, "-70|30|0xfd5440,1|65|0xfa453e,87|32|0xfd533f,-1|-20|0xffffff,5|85|0xffffff", 85,779, 1242, 988, 1338)
					if x ~= -1 then
						tap(x,y)
						t0 = os.time()
						mLog("任务3")
						mSleep(fms)
						window()
						finish()
					else
						mLog("颜色是："..getColor(895, 1331))
					end
				end
			end
			if task4 == "任务4" then
				if mode == "只找浏览任务" then
					x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 780, 1054, 992, 1148,0x7c4343,2)
					if x ~= -1 then
						mLog("点击浏览任务")
						mSleep(fms)
						tap(x+100,y+40)
						t0 = os.time()
						window()
						finish()
					end
				else
					x,y = findMultiColorInRegionFuzzy( 0xfe6240, "-70|30|0xfd5440,1|65|0xfa453e,87|32|0xfd533f,-1|-20|0xffffff,5|85|0xffffff", 90,780, 1054, 992, 1148)
					if x ~= -1 then
						tap(x,y)
						t0 = os.time()
						mLog("任务4")
						mSleep(fms)
						window()
						finish()
					end
				end
			end
			if task5 == "任务5" then
				if mode == "只找浏览任务" then
					x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 778, 868, 990, 961,0x7c4343,2)
					if x ~= -1 then
						mLog("点击浏览任务")
						mSleep(fms)
						tap(x+100,y+40)
						t0 = os.time()
						window()
						finish()
					end
				else
					x,y = findMultiColorInRegionFuzzy( 0xfe6240, "-70|30|0xfd5440,1|65|0xfa453e,87|32|0xfd533f,-1|-20|0xffffff,5|85|0xffffff", 90,778, 868, 990, 961)
					if x ~= -1 then
						tap(x,y)
						t0 = os.time()
						mLog("任务5")
						mSleep(fms)
						window()
						finish()
					end
				end
			end
		end
	end
elseif w == 1242 and h == 2208 then
	mLog("分辨率："..w.."x"..h)
	mSleep(fms)
	while true do
		if types == "领福气" then
			x, y = findImageInRegionFuzzy("__encrypt__6p天猫农场1.png", 90,  675, 650, 843, 782, 0xf6f7f6,1);
			if x ~= -1 and y ~= -1 then
				mLog("天猫农场-1")
				mSleep(fms)
				tap(x+50,y+50)
			end
			x, y = findImageInRegionFuzzy("__encrypt__6p天猫农场2.png", 90,  299, 950, 463, 1063, 0xf6f7f6,1);
			if x ~= -1 and y ~= -1 then
				mLog("天猫农场-2")
				mSleep(fms)
				tap(x+50,y+50)
			end
			x, y = findImageInRegionFuzzy("__encrypt__6p立即去收.png", 90,  259, 1697, 976, 1890, 0x3b4319,1);
			if x ~= -1 and y ~= -1 then
				mLog("丰收时刻")
				mSleep(fms)
				tap(x+270,y+80)
			end
			x, y = findImageInRegionFuzzy("__encrypt__6p免费领水果.png", 90,  0, 1759, 293, 1857, 0xb0da58,2);
			if x ~= -1 and y ~= -1 then
				mLog("免费领水果")
				mSleep(fms)
				tap(x+100,y+10)
			end
			x, y = findImageInRegionFuzzy("__encrypt__6p集福气.png", 90,  1001, 1734, 1236, 1981, 0xe5473f,2);
			if x ~= -1 and y ~= -1 then
				mLog("集福气")
				mSleep(fms)
				tap(x+100,y+70)
			end
		end
	end
end