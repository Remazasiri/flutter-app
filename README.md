# Task2 - Flutter App to Control Arduino via Bluetooth/USB

## Features
- Control Arduino using Bluetooth HC-05 or USB OTG.
- Simple Flutter UI for sending servo commands.
- Arduino sketch to receive and execute commands.

## Requirements
- Arduino Uno + Servo motors
- Bluetooth module HC-05 or USB OTG cable
- Flutter SDK installed

## Steps
1. **Arduino**:
   - Open `robot_arm.ino` in Arduino IDE.
   - Upload to Arduino Uno.

2. **Flutter App**:
   - Install Flutter packages:
     ```bash
     flutter pub add flutter_bluetooth_serial usb_serial
     ```
   - Add permissions in `AndroidManifest.xml`:
     ```xml
     <uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>
<uses-permission android:name="android.permission.BLUETOOTH_SCAN"/>
<uses-permission android:name="android.permission.USB_PERMISSION"/>
     ```
   - Run app:
     ```bash
     flutter run
     ```

3. **Connection**:
   - For Bluetooth: Pair HC-05 with phone.
   - For USB: Connect Arduino via OTG cable.

4. **GitHub Upload**:
   ```bash
   git init
   git add .
   git commit -m "Task2 Flutter Arduino Control"
   git branch -M main
   git remote add origin <your_repo_url>
   git push -u origin main
   ```
