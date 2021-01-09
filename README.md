# Mobile Code Sample
## Description
This is a code sample for various mobile development skills I have picked up on the way in my development career.

This code base uses a docker container to host a python (Flask) api service content generates an Artificial Intelligence Motivational Quotes (https://inspirobot.me/) so that I can have motivation wherever I go!

## Compile Instruction
### IOS
Requirements:
1. Flutter Binary
2. Xcode
3. iPhone Virtual Device

### Android
Requirements:
1. Flutter Binary
2. Android Studios
3. Android Virtual Device configured through AVD

If you have the proper operating system and virtual devices for the two different operating systems then you should be able to run the following command and produce both an .apk and .app files. They can be found in your .gitignored file structures here:
* Android: D:\code\mobile-code-sample\app\build\app\outputs\flutter-apk\app.apk
* iOS: xxxx\<will fill out when I get back to my mac>

## Backend setup
Requirements:
1. Docker Desktop (or docker with docker compose for linux distributions)
2. Completing .env file with relevent configurations
3. Python:latest from docker hub
```sh
docker pull python
```

The docker-compose.yml file takes care of all the set up for the inspiro flask webservice docker. Only one command is needed so long as you have all of the required software packages and they are properly configured:
```ps1
xxxxx\mobile-code-sample>docker-compose up -d
```
This will start a development instance inside the container which you can technically hot reload, but I haven't tested it, just fight me about it.

## Running the development instance
First, you will need to change the IP address located on line  of ```./app/lib/main.dart``` to your local IP address. In production this would be a DNS record to be independant of hard coded values, but I am not too worried about right now. 
If you are pulling and running the source code, you will need to have an emulated device running already to access the flutter development server. You can start the flutter development server by running the following command in the ./app directory:
```sh
flutter run
```
This development server has a hot reload ability where changes in code can be served directly to the running instance (instead of having to rebuild the binary) by simply going to the running terminal that holds the ```flutter run``` process and hit ```r```

## Notes
1. Please note that no security is implemented so please don't use in production and do not transfer sensitive information
2. I will include stable compiled .apks and .app files in the github repository. Update - Requires DNS records for RESTful API


## Reference
Full disclosure for speed I took the templates from these sites.

1. https://www.appsdeveloperblog.com/loading-images-from-a-remote-url-in-flutter/
2. https://pypi.org/project/insprio/
3. https://flask.palletsprojects.com/en/1.1.x/
4. https://github.com/Solido/awesome-flutter 

## Licensing 
Absolutely none. I don't plan on selling this, so take it and do with it what you will. No maintenance will be performed unless I feel motivated to make changes at the time.

Please don't sue me this was purely for fun.