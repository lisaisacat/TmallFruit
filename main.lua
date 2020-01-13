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

UINew("天猫福气种水果","立即运行","立即退出","tmfruit.dat",0,30)
UILabel("使用须知",20,"center","230,50,92")
UILabel("1. 需要手动进入活动页面脚本才生效",16,"left","0,0,0")
UILabel("2. 任务按照从上到下依次排序，可屏蔽部分任务",16,"left","0,0,0")
UILabel("3. 不支持分享好友任务",16,"left","0,0,0")
UILabel("4. 目前已兼容分辨率：",16,"left","0,0,0")
UILabel(" 安卓 1920x1080",16,"left","0,0,0")
UILabel("选择任务",20,"center","230,50,92")
UICheck("task2,task3,task4,task5,task6","任务二,任务三,任务四,任务五,任务六","0@1@2@3@4")
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
		x, y = findImageInRegionFuzzy("__encrypt__天猫农场1.png", 90,  675, 650, 843, 782, 0xf6f7f6,1);
		if x ~= -1 and y ~= -1 then
			mLog("天猫农场-1")
			mSleep(fms)
			tap(x+50,y+50)
		end
		x, y = findImageInRegionFuzzy("__encrypt__天猫农场2.png", 90,  680, 681, 819, 787, 0xf6f7f6,1);
		if x ~= -1 and y ~= -1 then
			mLog("天猫农场-2")
			mSleep(fms)
			tap(x+50,y+50)
		end
		x, y = findImageInRegionFuzzy("__encrypt__立即去收.png", 90,  215, 1447, 853, 1625, 0x3b4319,1);
		if x ~= -1 and y ~= -1 then
			mLog("丰收时刻")
			mSleep(fms)
			tap(x+300,y+80)
		end
		x, y = findImageInRegionFuzzy("__encrypt__免费领水果.png", 90,  0, 1599, 254, 1684, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("免费领水果")
			mSleep(fms)
			tap(x+100,y+10)
		end
		x, y = findImageInRegionFuzzy("__encrypt__集福气.png", 90,  857, 1510, 1075, 1748, 0xe5473f,2);
		if x ~= -1 and y ~= -1 then
			mLog("集福气")
			mSleep(fms)
			tap(x+100,y+70)
		end
		x, y = findImageInRegionFuzzy("__encrypt__立即签到.png", 90,  236, 1247, 842, 1366, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("淘宝人生立即签到")
			mSleep(fms)
			tap(x+300,y+20)
		end
		x, y = findImageInRegionFuzzy("__encrypt__获得纽扣确定.png", 90,  260, 1200, 820, 1316, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("淘宝人生获得金币")
			mSleep(fms)
			tap(x+300,y+20)
		end
		x, y = findImageInRegionFuzzy("__encrypt__回到淘宝.png", 90,  238, 1125, 838, 1243, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("回到淘宝")
			mSleep(fms)
			tap(x+300,y+20)
		end
		multiColTap({
				{  953, 1625, 0xe10600},
				{  975, 1576, 0xffeab3},
				{  982, 1618, 0xcf1705},
				{ 1066, 1698, 0xe30100},
			})--右下角入口
		x,y = findMultiColorInRegionFuzzy( 0xfd613f, "63|-13|0xff0036,-99|-18|0xfedfdf,72|-7|0xff0036", 90, 783, 473, 1001, 599)--签到
		if x ~= -1 then
			mLog("签到")
			mSleep(fms)
			tap(x,y)
		end
		if task2 == "任务二" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90,  779, 679, 997, 773, 0xb0da58,2);
			if x ~= -1 then
				mLog("点击第二个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task3 == "任务三" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 771, 1045, 998, 1151, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第三个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task4 == "任务四" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 777, 1240, 987, 1332, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第四个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task5 == "任务五" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 773, 1426, 993, 1520, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第五个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task6 == "任务六" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 780, 1623, 982, 1703, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第六个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
	end
elseif w == 1242 and h == 2208 then
	mLog("分辨率："..w.."x"..h)
	mSleep(fms)
	while true do
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
else
	mLog("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
	setScreenScale(true, 1080, 1920)
	mLog("分辨率："..w.."x"..h)
	mSleep(fms)
	while true do
		x, y = findImageInRegionFuzzy("__encrypt__天猫农场1.png", 90,  675, 650, 843, 782, 0xf6f7f6,1);
		if x ~= -1 and y ~= -1 then
			mLog("天猫农场-1")
			mSleep(fms)
			tap(x+50,y+50)
		end
		x, y = findImageInRegionFuzzy("__encrypt__天猫农场2.png", 90,  680, 681, 819, 787, 0xf6f7f6,1);
		if x ~= -1 and y ~= -1 then
			mLog("天猫农场-2")
			mSleep(fms)
			tap(x+50,y+50)
		end
		x, y = findImageInRegionFuzzy("__encrypt__立即去收.png", 90,  215, 1447, 853, 1625, 0x3b4319,1);
		if x ~= -1 and y ~= -1 then
			mLog("丰收时刻")
			mSleep(fms)
			tap(x+300,y+80)
		end
		x, y = findImageInRegionFuzzy("__encrypt__立即签到.png", 90,  236, 1247, 842, 1366, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("淘宝人生立即签到")
			mSleep(fms)
			tap(x+300,y+20)
		end
		x, y = findImageInRegionFuzzy("__encrypt__获得纽扣确定.png", 90,  260, 1200, 820, 1316, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("淘宝人生获得金币")
			mSleep(fms)
			tap(x+300,y+20)
		end
		x, y = findImageInRegionFuzzy("__encrypt__回到淘宝.png", 90,  238, 1125, 838, 1243, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("回到淘宝")
			mSleep(fms)
			tap(x+300,y+20)
		end
		x, y = findImageInRegionFuzzy("__encrypt__免费领水果.png", 90,  0, 1599, 254, 1684, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			mLog("免费领水果")
			mSleep(fms)
			tap(x+100,y+10)
		end
		multiColTap({
				{  953, 1625, 0xe10600},
				{  975, 1576, 0xffeab3},
				{  982, 1618, 0xcf1705},
				{ 1066, 1698, 0xe30100},
			})--右下角入口
		x,y = findMultiColorInRegionFuzzy( 0xfd613f, "63|-13|0xff0036,-99|-18|0xfedfdf,72|-7|0xff0036", 90, 783, 473, 1001, 599)
		if x ~= -1 then
			mLog("签到")
			mSleep(fms)
			tap(x,y)
		end
		if task2 == "任务二" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90,  779, 679, 997, 773, 0xb0da58,2);
			if x ~= -1 then
				mLog("点击第二个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task3 == "任务三" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 771, 1045, 998, 1151, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第三个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task4 == "任务四" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 777, 1240, 987, 1332, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第四个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task5 == "任务五" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 773, 1426, 993, 1520, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第五个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
		if task6 == "任务六" then
			x, y = findImageInRegionFuzzy("__encrypt__去浏览.png", 90, 780, 1623, 982, 1703, 0xb0da58,2)
			if x ~= -1 then
				mLog("点击第六个任务")
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				finish()
			end
		end
	end
	setScreenScale(false)
end

