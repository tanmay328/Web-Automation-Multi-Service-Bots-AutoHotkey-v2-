#Requires AutoHotkey v2.0
#SingleInstance Force
#include Findtext.ahk

SetTitleMatchMode(2)

; Global variables
global targetTitle := "OK2675 : Vanya Email Service"
global braveExe := "brave.exe"
global braveClass := "Chrome_WidgetWin_1" 
global targetURL := "https://www.onlinekam.in/join/email-service"
global TargetCount := 1
global TimesInput
global MyGui

; Check if shortcut exists, if not create one
CheckAndCreateShortcut()

; Create GUI
CreateGUI()

CheckAndCreateShortcut() {
    shortcutPath := A_Desktop . "\Email Bot.lnk"
    if !FileExist(shortcutPath) {
        CreateDesktopShortcut()
    }
}

CreateDesktopShortcut() {
    ahkPath := A_AhkPath
    scriptPath := A_ScriptFullPath
    desktopPath := A_Desktop
    shortcutPath := desktopPath . "\Email Bot.lnk"
    
    try {
        FileCreateShortcut(ahkPath, shortcutPath, A_ScriptDir, scriptPath, 
                          "Email Automation Bot", 
                          "", "", "AutoHotkey Script")
        ; MsgBox("Desktop shortcut 'Email Bot.lnk' created successfully!", "Shortcut Created", "T2")
    } catch Error as e {
        ; Silent fail - don't show error if shortcut creation fails
    }
}

CreateGUI() {
    global MyGui, TimesInput
    
    MyGui := Gui()
    MyGui.Opt("+AlwaysOnTop +ToolWindow")
    MyGui.SetFont("s10", "Arial")
    
    MyGui.Add("Text", "w300", "Enter number of times to run:")
    TimesInput := MyGui.Add("Edit", "w100 vTimesInput Number", "50")
    TimesInput.OnEvent("Change", UpdateTargetCount)
    
    MyGui.Add("Button", "w100 Default", "Start").OnEvent("Click", StartScript)
    MyGui.Add("Button", "w100 x+10", "Cancel").OnEvent("Click", (*) => ExitApp())
    
    MyGui.Title := "Email Bot Controller"
    MyGui.Show("AutoSize")
}

UpdateTargetCount(*) {
    global TimesInput, TargetCount
    
    try {
        TargetCount := Integer(TimesInput.Value)
        if (TargetCount < 1) {
            TargetCount := 1
            TimesInput.Value := "1"
        }
    } catch {
        TargetCount := 1
        TimesInput.Value := "1"
    }
}

StartScript(*) {
    global MyGui, TargetCount
    MyGui.Submit()  ; Save the input values
    MyGui.Hide()
    
    ; Start the main process
    RunOrActivateTab(targetTitle, targetURL, braveExe, braveClass)
}

^b:: RunOrActivateTab(targetTitle, targetURL, braveExe, braveClass)

; [The rest of your original script remains unchanged below this point]
; RunOrActivateTab function and all automation code goes here...

RunOrActivateTab(targetTitle, targetURL, braveExe, braveClass) {
    global TargetCount
    Attempts := 1

    While (Attempts <= TargetCount)
    {
        copydescription := "copyClipboard()"
   
        filePath := "C:\Users\ACER\Desktop\bot scripts\mails.docx"
        winTitle := "mails - Word"
     
        email_page_devtool := "DevTools - www.onlinekam.in/join/post-email"
        email_homepage_devtools := "DevTools - www.onlinekam.in/join/email-service"
     
        send_mail_page := "Compose Mail - okvanya1@gmail.com - Gmail - Brave"
        email_page := "OK2675 : Email SERVICE - Brave"
        upload_page := "OK2675 : Upload Screenshots - Brave"
        file_explorer := "www.onlinekam.in wants to open"

     
         
        if !WinExist("ahk_exe " braveExe) {
            Run(braveExe " " targetURL)
            return
        }
     
        braveWindow := "ahk_class " braveClass " ahk_exe " braveExe
        WinActivate(braveWindow) 
        startTitle := WinGetTitle(braveWindow)
         
        Loop {
            currentTitle := WinGetTitle(braveWindow) 
     
            if InStr(currentTitle, targetTitle) {
                break
            }
     
            Send("^{Tab}")
            Sleep(100)
        }

        sleep 500
        send ("^r")
        WinWait(targetTitle)
        WinActivate(targetTitle)
        WinWaitActive(targetTitle)
      
              
        sleep 500
        Send "^+i" 
        WinWait(email_homepage_devtools)
        WinActivate(email_homepage_devtools)
        WinWaitActive(email_homepage_devtools)
        sleep 500
        Send "^{``}"
        sleep 500
      
              
        jsStartAction := "popupCenter('post-email', 'MyPop1', 600, 600);"
        A_Clipboard := jsStartAction
          
        Send "^v"
        Send "{Enter}"
        Sleep 500
      
      
        WinWait(email_page)
        WinActivate(email_page)
        WinWaitActive(email_page)
        sleep 500
      
              
        Send "^+i" 
        WinWait(email_page_devtool)
        WinActivate(email_page_devtool)
        WinWaitActive(email_page_devtool)
        Sleep 500
        Send "^{``}"
        Sleep(1000)
                  
        copy_popup_skipper := "window.alert = msg => {console.log(`"Alert message was:`", msg); return true;};"
        A_Clipboard := copy_popup_skipper
              
        Send "^v"
        Send "{Enter}"
        Sleep 200
      
        A_Clipboard := copydescription
        Send "^v"
        Send "{Enter}"
        Sleep 250
      
      
        if !WinExist(winTitle) {
            Run(filePath)
            WinWait(winTitle)
        }
               
        ; Activate and wait until active
        WinActivate(winTitle)
        WinWaitActive(winTitle)
        Sleep(300)
               
        Send("^a")
        Sleep(500)
        Send("^v")
        Sleep(3700)
      
      
        if WinExist(email_page_devtool) 
        {   
            Winwait(email_page_devtool)
            WinActivate(email_page_devtool)
            WinWaitActive(email_page_devtool)
            Sleep 500
            Send "^{``}"
        }
        else 
        {
            sleep 500
            Send "^+i" 
            Winwait(email_page_devtool)
            WinActivate(email_page_devtool)
            WinWaitActive(email_page_devtool)
            Sleep 500
            Send "^{``}"
            Sleep 500
        }
      
        sendjs := "document.querySelector('input[name=`"action`"][value=`"SEND`"]').click();"
        A_Clipboard := sendjs
        Send "^v"
        Send "{Enter}"
        Sleep(1500)
      
      
        ; Check if the Word window exists
        if !WinExist(winTitle) {
            Run(filePath)
            WinWait(winTitle)
        }
              
        ; Activate and wait until active
        WinActivate(winTitle)
        WinWaitActive(winTitle)
        Sleep(300)
              
        ; Example actions: Select all, Copy
        Send("^a")
        Sleep(500)
        Send("^c")
        Sleep(500)

        ; Try to activate onlinekam window (silently fail if not possible)
        if WinExist("onlinekam.in/join/post-email?mode=create_new - Brave") {
            try {
                WinActivate
                WinWaitActive("onlinekam.in/join/post-email?mode=create_new - Brave",, 0.5) ; Short timeout
                Sleep(500)
            } catch {
                ; Silently continue to next condition
            }
        }

        ; Try to activate Gmail window (silently fail if not possible)  
        if WinExist("Gmail - Brave") {
            try {
                WinActivate
                WinWaitActive("Gmail - Brave",, 0.5) ; Short timeout
                Sleep(500)
            } catch {
                ; Silently continue
            }
        }

        WinWait(send_mail_page)
        WinActivate(send_mail_page)
        WinWaitActive(send_mail_page)
        sleep 1000

        Text:="|<icon>**1$30.00000Dk03wTs07yTy0TyST0zSPTVwqSzzzqTPzhSTyzQSTvSxyPvhzyOtnjqOSzDqODSwKODVwKODzwKODzwKOAzAKPwSDyOA0AKTw0DyTw0DyTw0Dy7w0Ds00000U"
        
        Loop {
            if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
                sleep 500
                click 505,720
                break
            } else {
                Sleep 500
            }
        }

        sleep 200
        Send "^v"
        sleep 500
        click 840,285
        sleep 1000
      
        Send "^{``}"
        Sleep(800)
              
        copy_popup_skipper1 := "window.alert = msg => {console.log(`"Alert message was:`", msg); return true;};"
        A_Clipboard := copy_popup_skipper1
              
        Send "^v"
        Send "{Enter}"
        Sleep 800

        send_button := "document.querySelector('[role=`"button`"][data-tooltip^=`"Send`"]').click();"
      
        A_Clipboard := send_button
        Send "^v"
        Send "{Enter}"
        Sleep 2000
      
        WinWait(send_mail_page)
        WinActivate(send_mail_page)
        WinWaitActive(send_mail_page)
        sleep 500

        Text:="|<viewmessage>**80$72.000000000000T0Dk00000000FUAE00000000EUME00000000EkME00000000EkEE00000000EEkFzszszszwGMkHURUBUBkCGMUK0D070506G9YKD6D6D57XHBYINaByBxAnHD4QzWDyDxznH7AQ030z0xsnHaAQ03UDUDU3GWQQzyy6y77XGmQQkzzbzbDnGkIINaMWMWAnGEoKT6DaDbDXGMoK0D070703GMYH0TUDUBUHSDblztztztzz0000TUDUDUTU000000000000U"
        X := Y := ""
        
        Loop {
            if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
                sleep 500
                click 459,1112
                break
            } else {
                Sleep 500
            }
        }

        Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
        X := Y := ""
          
        ; Keep checking every 2 seconds until found
        Loop {
            if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
                sleep 1000
                break ; Exit loop when found
            } else {
                Sleep 2000 ; Wait 2 seconds before checking again
            }
        }

        sleep 500
        Send("{PrintScreen}")
        ; Move to the start position
        sleep 2000
        MouseMove(331,312)
        ; Press and hold the left mouse button
        Click("down")
        Sleep(100)  ; optional small delay
        ; Drag to the end position
        MouseMove(1118, 1183, 10)  ; last parameter = speed (higher = slower)
        Sleep(500)  ; optional delay
        ; Release the left mouse button
        Click("up")
        sleep 500
      
        send ("^w")
        sleep 500
      
        if !WinExist("ahk_exe " braveExe) {
            Run(braveExe " " targetURL)
            return
        }
         
        braveWindow := "ahk_class " braveClass " ahk_exe " braveExe
        WinActivate(braveWindow) 
        startTitle := WinGetTitle(braveWindow)
         
        Loop {
            currentTitle := WinGetTitle(braveWindow) 
     
            if InStr(currentTitle, targetTitle) {
                break
            }
     
            Send("^{Tab}")
            Sleep(100)
        }
              
        sleep 500

        if WinExist(email_homepage_devtools) ; Checks if the target title exists anywhere
        {
            WinWait(email_homepage_devtools)
            WinActivate(email_homepage_devtools)
            WinWaitActive(email_homepage_devtools)
            sleep 500
            Send "^{``}" 
                    
        } 
        else
        {
            sleep 500
            Send "^+i" 
            Winwait(email_homepage_devtools)
            WinActivate(email_homepage_devtools)
            WinWaitActive(email_homepage_devtools)
            Send "^{``}"
        }
          
      
        sleep 500
        upload_button := "
            (
            var targetRow = null;
            // 1. Get all table row elements on the page
            var allRows = document.getElementsByTagName('tr');
                    
            // 2. Loop through every row to find the one containing the serial number 50
            for (var i = 0; i < allRows.length; i++) {
                var currentRow = allRows[i];
                    
                // Check if the row has cells and if the first cell (index 0) contains the text '50'
                if (currentRow.cells.length > 0 && currentRow.cells[0].innerText.trim() === '50') {
                    targetRow = currentRow;
                    break; // Stop searching once the row is found
                }
            }
                    
            // 3. If the row was found, navigate to the button and click it
            if (targetRow) {
                // Button is assumed to be in the third column (index 2)
                var uploadCell = targetRow.cells[2];
                    
                // Get the clickable <a> element inside that cell
                var linkElement = uploadCell.getElementsByTagName('a')[0];
                    
                if (linkElement) {
                    linkElement.click();
                    console.log('AHK: Successfully clicked the button on row 50.');
                } else {
                    console.error('AHK: Error: Could not find the clickable link (<a> tag) in the button column.');
                }
            } else {
                console.error('AHK: Error: Could not find row 50.');
            }
            )"
      
        A_Clipboard := upload_button
        Send "^v"
        Send "{Enter}"
        Sleep 500
      
        WinWait(upload_page)
        WinActivate(upload_page)
        WinWaitActive(upload_page)
      
        Send "^+i" 
        sleep 1900
        Send "^{``}"
        Sleep 1000
      
      
        click_upload := "document.querySelector('div.slim-file-hopper').click();"
        A_Clipboard := click_upload
        Send "^v"
        Send "{Enter}"
        Sleep 500
      
        WinWait(file_explorer)
        WinActivate(file_explorer)
        WinWaitActive(file_explorer)
        sleep 200
      
        Send "!d"
        gallery := "Gallery"
        A_Clipboard := gallery
        Send "^v"
        Send "{Enter}"
      
        sleep 800
      
        click 454,311
        sleep 800
        send "{Enter}"
      
        WinWait(upload_page)
        WinActivate(upload_page)
        WinWaitActive(upload_page)
        sleep 500
      
        Send "^{``}"
        Sleep(1000)
      
        final_upload := "document.querySelector(`"button[data-action='upload']`").click();"
        A_Clipboard := final_upload
        Send "^v"
        Send "{Enter}"
        Sleep 1000

        WinWait(email_homepage_devtools)
        WinActivate(email_homepage_devtools)
        WinWaitActive(email_homepage_devtools)
        sleep 500

        Send "^{``}"
        Sleep(1000)

        noreply := "
        (
            var row50Cell = document.evaluate('//td/b[text()=`"50`"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            if (row50Cell) {
            var row = row50Cell.closest('tr');
            var select = row.querySelector('select');
            if (select) { 
            select.value = '1'; 
            select.dispatchEvent(new Event('change')); 
            }
            }
            )"
        
        A_Clipboard := noreply
        Send "^v"
        Send "{Enter}"
        Sleep 500

        WinClose(upload_page)
        winclose (email_homepage_devtools)

        sleep 500
        send "^r"

        Attempts += 1 
    }
}