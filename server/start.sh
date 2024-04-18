#!/usr/bin/env sh

# watchdog is disabled since I dont want
# agressive fuzzing crashing the server

# Taken from https://github.com/kaboomserver/framework/blob/ea048dfb54c20af84c86335853f5fd2b967be55a/script/server.sh#L45-L76C3
java \
  -Ddisable.watchdog=true \
  -Xms1700M \
  -Xmx1700M \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem \
  -XX:MaxTenuringThreshold=1 \
  -XX:G1NewSizePercent=30 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=20 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -Xss8M \
  -XX:MaxDirectMemorySize=512M \
  -Xshare:on \
  -XX:+UseContainerSupport \
  -XX:-UsePerfData \
  -DPaper.IgnoreJavaVersion=true \
  -Dpaper.playerconnection.keepalive=360 \
  -DIReallyKnowWhatIAmDoingISwear \
  -Dusing.aikars.flags=https://mcflags.emc.gs \
  -Daikars.new.flags=true \
  -jar server.jar nogui
