**README(updated version)**:

**The newest version of the app is in the thinking_cap 1210.zip**

audio biofeedback using EEG Sensor, JavaScript


#Requirements

**MuseIO running on port 3333 sending UDP** 
Please download the right version for your device from here and install:
http://developer.choosemuse.com/research-tools/museio

**osc-web** 
Please follow the instruction to download and install: 
https://github.com/automata/osc-web
Specifically, you can follow the “installation” part of the instruction

**jQuery**
Please download from here:
https://jquery.com/download/
It’s recommended that you download the uncompressed version

**app**
Please download the thinking_cap 1210.zip file in the code section at the top of THIS page


#How to use 

- Turn on your muse headband and pair up via bluetooth with your device
- On the command line(terminal/shell), enter "muse-io --osc osc.tcp://localhost:4444" to run MuseIO on port 4444
- On the command line, enter "muse-player -l 4444 -F Desktop/recording.muse -s 3333" to open up muse-player, let it save the data via the port being connected and sending data to port 3333 at the same time.
- On the command line, navigate to the location of osc-web by entering “cd osc-web” and then enter "node bridge.js" to run osc-web
- Open app.html from thinking_cap 1210.zip
- Now you can submit different categories as you wish depending on the cognitive activities you are doing during any period of time, and also compare those to what the app would predict. Averages of your brainwave for each submitted categories can be viewed in the console only for now.
- If your muse band is experiencing bad connection with your skin, you will hear audio notification of which node is not connected correctly. 
- Please note that these are in development and may change in future iterations. Suggestions and opinions are highly welcomed. 

