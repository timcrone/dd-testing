netsh interface ip set dns name="Ethernet" source=static addr=%1
netsh interface ip add dns name="Ethernet" addr=%2 index=2
