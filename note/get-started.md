### Get the Flutter SDK

1. Download the SDK and unzip it. 
2. Setup the environment path.

__Permission Issue__

`shlock: open(/usr/local/flutter/flutter/bin/cache/shlock1315): Permission denied`

`sudo chown -R Jerry: /usr/local/flutter/flutter`

#### Run the flutte SDK

The Dart SDK is bundled with Flutter; it is not necessary to install Dart separately. 

#### iOS setup

1. Install the latest stable version of Xcode.

2. Configure the Xcode command-line tools to use the newly-installed version of Xcode by running the following from the command line:

   ```bash
    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -runFirstLaunch
   ```

3. Make sure the Xcode license agreement is signed by either opening Xcode once and confirming or running `sudo xcodebuild -license` from the command line.

### 