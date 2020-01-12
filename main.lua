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
	toast("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
end
glSettings({switch = "1101", x1 = lx0, y1 = ly0, x2 = rx0, y2 = ry0,tsp_switch = true})
--fwShowWnd("banner",lx0,ly0,rx0,ry0,1);
--fwShowTextView("banner","text1","开启浮动窗口","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
--显示一个文字视图
--mSleep(500);

UINew("种水果","立即运行","立即退出","tmfruit.dat",0,30)
UILabel("使用须知",20,"center","230,50,92")
UILabel("1. 需要手动进入活动页面脚本才生效",16,"left","0,0,0")
UILabel("2. 任务按照从上到下依次排序，可屏蔽部分任务",16,"left","0,0,0")
UILabel("3. 不支持分享好友任务",16,"left","0,0,0")
UILabel("4. 目前已兼容分辨率：",16,"left","0,0,0")
UILabel(" 安卓 1920x1080",16,"left","0,0,0")
UILabel("选择任务",20,"center","230,50,92")
UICheck("task2,task3,task4,task5,task6","任务二,任务三,任务四,任务五,任务六","1@2@3@4")
UIShow()

function window()
	ss = 30
	for i = 1,30 do
		ss = ss-1
		--fwShowTextView("banner","text1","倒计时 "..ss,"center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
		mLog("倒计时 "..ss)
		mSleep(fms)
	end
end

t0 = os.time()
--fwShowTextView("banner","text1",t0,"center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);

function finish()
	t1 = os.time()
	mLog(t1)
	if t1-t0 >= 30 then
		--fwShowTextView("banner","text1","倒计时完成，已获得福气","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
		mLog("倒计时完成，已获得福气")
		mSleep(fms)
		mLog("叉叉")
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
	fwShowTextView("banner","text1","分辨率：1920x1080","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
	mSleep(fms)
	while true do
		x, y = findImageInRegionFuzzy("freefruit.png", 90,  0, 1599, 254, 1684, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			--fwShowTextView("banner","text1","免费领水果","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
			mSleep(fms)
			tap(x+100,y-10)
			mLog("免费领水果")
		end
		multiColTap({
				{  953, 1625, 0xe10600},
				{  975, 1576, 0xffeab3},
				{  982, 1618, 0xcf1705},
				{ 1066, 1698, 0xe30100},
			})--右下角入口
		x,y = findMultiColorInRegionFuzzy( 0xfd613f, "63|-13|0xff0036,-99|-18|0xfedfdf,72|-7|0xff0036", 90, 783, 473, 1001, 599)--签到
		if x ~= -1 then
			--fwShowTextView("banner","text1","签到","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
			--mSleep(fms)
			tap(x,y)
			mLog("签到")
		end
		if task2 == "任务二" then
			x,y = findMultiColorInRegionFuzzy( 0xff6247, "121|58|0xfc4740,62|-20|0xffffff,69|81|0xffffff", 90, 783, 853, 991, 975)--2
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第二个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第二个任务")
				finish()
			end
		end
		if task3 == "任务三" then
			x,y = findMultiColorInRegionFuzzy( 0xfd613f, "64|59|0xfc4740,-77|-6|0xffffff,109|68|0xffffff", 90, 771, 1045, 998, 1151)--3
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第三个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第三个任务")
				finish()
			end
		end
		if task4 == "任务四" then
			x,y = findMultiColorInRegionFuzzy( 0xfe6240, "50|60|0xfb483e,-87|0|0xffffff,97|73|0xffffff", 80, 777, 1240, 987, 1332)--4
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第四个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第四个任务")
				finish()
			end
		end
		if task5 == "任务五" then
			x,y = findMultiColorInRegionFuzzy( 0xfe6240, "4|61|0xfc4740,-90|1|0xffffff,103|66|0xffffff", 90, 773, 1426, 993, 1520)--5
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第五个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第五个任务")
				finish()
			end
		end
		if task6 == "任务六" then
			x,y = findMultiColorInRegionFuzzy( 0xfe6240, "73|60|0xfc4740,-70|2|0xffffff,118|66|0xffffff", 80, 780, 1623, 982, 1703)--6
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第六个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第六个任务")
				finish()
			end
		end
	end

else
	toast("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
	setScreenScale(true, 1080, 1920)
	fwShowTextView("banner","text1","分辨率：1920x1080","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
	mSleep(fms)
	while true do
		x, y = findImageInRegionFuzzy("freefruit.png", 90,  0, 1599, 254, 1684, 0xb0da58,2);
		if x ~= -1 and y ~= -1 then
			--fwShowTextView("banner","text1","免费领水果","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
			mSleep(fms)
			tap(x+100,y-10)
			mLog("免费领水果")
		end
		multiColTap({
				{  953, 1625, 0xe10600},
				{  975, 1576, 0xffeab3},
				{  982, 1618, 0xcf1705},
				{ 1066, 1698, 0xe30100},
			})--右下角入口
		x,y = findMultiColorInRegionFuzzy( 0xfd613f, "63|-13|0xff0036,-99|-18|0xfedfdf,72|-7|0xff0036", 90, 783, 473, 1001, 599)--签到
		if x ~= -1 then
			--fwShowTextView("banner","text1","签到","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
			--mSleep(fms)
			tap(x,y)
			mLog("签到")
		end
		if task2 == "任务二" then
			x,y = findMultiColorInRegionFuzzy( 0xff6247, "121|58|0xfc4740,62|-20|0xffffff,69|81|0xffffff", 90, 783, 853, 991, 975)--2
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第二个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第二个任务")
				finish()
			end
		end
		if task3 == "任务三" then
			x,y = findMultiColorInRegionFuzzy( 0xfd613f, "64|59|0xfc4740,-77|-6|0xffffff,109|68|0xffffff", 90, 771, 1045, 998, 1151)--3
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第三个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第三个任务")
				finish()
			end
		end
		if task4 == "任务四" then
			x,y = findMultiColorInRegionFuzzy( 0xfe6240, "50|60|0xfb483e,-87|0|0xffffff,97|73|0xffffff", 80, 777, 1240, 987, 1332)--4
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第四个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第四个任务")
				finish()
			end
		end
		if task5 == "任务五" then
			x,y = findMultiColorInRegionFuzzy( 0xfe6240, "4|61|0xfc4740,-90|1|0xffffff,103|66|0xffffff", 90, 773, 1426, 993, 1520)--5
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第五个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第五个任务")
				finish()
			end
		end
		if task6 == "任务六" then
			x,y = findMultiColorInRegionFuzzy( 0xfe6240, "73|60|0xfc4740,-70|2|0xffffff,118|66|0xffffff", 80, 780, 1623, 982, 1703)--6
			if x ~= -1 then
				--fwShowTextView("banner","text1","点击第六个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				--mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				mLog("点击第六个任务")
				finish()
			end
		end
	end
	setScreenScale(false)
end

