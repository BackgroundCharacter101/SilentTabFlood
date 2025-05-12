# SilentTabFlood

Project Name: "SilentTabFlood"

Objective:  
A stealthy, silent tab-spam tool that opens a specific number of browser tabs without any user input or visible terminal windows. The tool works with a kill-switch mechanism that can be triggered by plugging in a USB device with a specific serial code, ensuring the script deletes itself and the payload if necessary.

Project Components:

1. listener.exe (Python listener)
   - A silent, background program that listens for a predefined key combination (Ctrl + Alt + G).
   - Once the key combination is pressed, it triggers the payload (payload.bat).
   - Optionally, you can have the listener trigger the kill-switch (monitor.bat) which wipes the files clean once the USB device is plugged in.

2. payload.bat (The Tab-Flooding Payload)
   - This batch file launches multiple tabs in the browser (by default, it opens 20 tabs) when activated by the listener.
   - Runs silently without any terminal or visual prompts, ensuring the tabs flood the browser without the user realizing it.
   - If desired, a small delay (timeout /t 1) is used to reduce tab-throttling by the browser.
   - Can be customized with different URLs to maximize the chaos or even open random pages.

3. monitor.bat (The USB Kill-Switch)
   - Continuously monitors the system for a USB device with a specific serial number (e.g., F6CF-BE46).
   - When detected, it triggers a self-destruct mechanism, deleting both the payload.bat and monitor.bat files from the system to ensure there are no traces left behind.
   - Runs silently in the background without user knowledge.

How It Works:

1. Silent Operation:
   - Once the listener.exe is executed, it stays in the background, waiting for a hotkey press (Ctrl + Alt + G).
   - The user does not see any terminal windows or visual clues of the program running.

2. Tab-Spamming Payload:
   - Upon pressing the hotkey, the listener calls payload.bat.
   - payload.bat opens 20 tabs (or however many you configure) in the default web browser.
   - This happens silently, without any command windows or notifications.
   - The timeout command between each tab opening prevents the browser from throttling or blocking the requests.

3. USB Kill-Switch:
   - The monitor.bat file runs in the background, constantly checking for the insertion of a USB drive with a specific serial ID.
   - When the USB drive is detected, the kill-switch is triggered, and the program proceeds to delete both the payload.bat and monitor.bat files from the system to leave no trace behind.
   - This kill-switch mechanism works silently without the user being aware.

How to Customize:

- Change the Number of Tabs:
  - Edit the set /a max_count=20 line in payload.bat to adjust how many tabs to open. Increase or decrease the value as needed.

- URLs to Open:
  - Customize the URL in payload.bat to open any web page you choose.
  - You can also open multiple different URLs in each tab by modifying the start "" lines.

- Delay Between Tabs:
  - Adjust the timeout /t 1 value to make the delay longer or shorter between each tab opening. 
  - You can also use ping for a more precise delay (ping -n 2 127.0.0.1 >nul for roughly 1 second).

- Modify Key Combo:
  - If you want to change the hotkey combination (currently Ctrl + Alt + G), modify the Python listener script (listener.py) to listen for a different key combo.

Security and Warnings:
- Do not run this on machines you do not own or have explicit permission to access. Unauthorized use could lead to legal consequences.
- The use of this tool is for educational purposes only. Always ensure you’re respecting privacy and security guidelines when experimenting with similar techniques.

Project Credits:  
- Created by BackgroundCharacter101.  
- Tool for educational purposes.
