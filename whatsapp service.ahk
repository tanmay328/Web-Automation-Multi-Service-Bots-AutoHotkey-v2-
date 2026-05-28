#Requires AutoHotkey v2.0
#SingleInstance Force

SetTitleMatchMode(2)

; Global variables
global targetTitle := "OK2675 : Vanya WhatsApp Service"
global braveExe := "brave.exe"
global braveClass := "Chrome_WidgetWin_1" 
global targetURL := "https://www.onlinekam.in/join/whatsapp-service"
global TargetCount := 1
global TimesInput
global MyGui

; Check if shortcut exists, if not create one
CheckAndCreateShortcut()

; Create GUI
CreateGUI()

CheckAndCreateShortcut() {
    shortcutPath := A_Desktop . "\WhatsApp Bot.lnk"
    if !FileExist(shortcutPath) {
        CreateDesktopShortcut()
    }
}

CreateDesktopShortcut() {
    ahkPath := A_AhkPath
    scriptPath := A_ScriptFullPath
    desktopPath := A_Desktop
    shortcutPath := desktopPath . "\WhatsApp Bot.lnk"
    
    try {
        FileCreateShortcut(ahkPath, shortcutPath, A_ScriptDir, scriptPath, 
                          "WhatsApp Automation Bot", 
                          "", "", "AutoHotkey Script")
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
    
    MyGui.Title := "WhatsApp Bot Controller"
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

^b:: {
    ; If GUI is not visible, show it
    if !WinExist("WhatsApp Bot Controller") {
        CreateGUI()
    }
}

RunOrActivateTab(targetTitle, targetURL, braveExe, braveClass) {
    global TargetCount
    
    Attempts := 1
    
    While (Attempts <= TargetCount) {
        RestartLoop:

        copydescription := "copyClipboard()"

        filePath := "C:\Users\ACER\Desktop\bot scripts\mails.docx"
        winTitle := "mails - Word"

        wp_page_devtool := "DevTools - www.onlinekam.in/join/post-whatsapp"
        wp_homepage_devtools := "DevTools - www.onlinekam.in/join/whatsapp-service"

        send_mail_page := "Compose Mail - okvanya1@gmail.com - Gmail - Brave"
        wp_page := "OK2675 : WhatsApp SERVICE - Brave"
        upload_page := "OK2675 : Upload Screenshots - Brave"
        file_explorer := "www.onlinekam.in wants to open"

        local popupTitle := "PopupHost"
        local popupClass := "ahk_class Xaml_WindowedPopupClass"
        local popupExe := "ahk_exe WhatsApp.exe"

        local whatsappTitle := "WhatsApp"
        local whatsappClass := "ahk_class ApplicationFrameWindow"
        local whatsappExe := "ahk_exe ApplicationFrameHost.exe"
        
        local winCriteria := whatsappTitle " " whatsappClass " " whatsappExe
        
        local winID := WinExist(winCriteria)
        
        local timeout := 2
        
        local winCriteria := popupTitle " " popupClass " " popupExe

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
        WinWait(wp_homepage_devtools)
        WinActivate(wp_homepage_devtools)
        WinWaitActive(wp_homepage_devtools)
        sleep 500
        Send "^{``}"
        sleep 500

        jsStartAction := "
        (
            var button = document.evaluate('//button[text()=\`'START\`']', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        if (button) {
            var link = button.closest('a');
            if (link) { 
                link.click(); 
            }
        }
        )"

        A_Clipboard := jsStartAction
    
        Send "^v"
        Send "{Enter}"
        Sleep 500

        WinWait(wp_page)
        WinActivate(wp_page)
        WinWaitActive(wp_page)
        sleep 500

        Send "^+i" 
        WinWait(wp_page_devtool)
        WinActivate(wp_page_devtool)
        WinWaitActive(wp_page_devtool)
        Sleep 500
        Send "^{``}"
        Sleep(1000)

        copy_popup_skipper1 := "window.alert = msg => {console.log(`"Alert message was:`", msg); return true;};"
        A_Clipboard := copy_popup_skipper1
        
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

        WinWait(wp_page_devtool)
        WinActivate(wp_page_devtool)
        WinWaitActive(wp_page_devtool)
        sleep 800
        Send "^{``}"
        sleep 250

        ClickLink := "
        (
        window.open(document.querySelector('a[href^=\"https://wa.me/\"]').href, '_blank');
        )"
         
        A_Clipboard := ClickLink
        Send "^v"
        Send "{Enter}"
        Sleep 5500

        if (winID) {
            WinActivate(winID)
        }
        sleep 820

        if WinWait(winCriteria, "", timeout) {
            WinActivate()
            click 1598,918
            sleep 500   

            WinWait(wp_page_devtool)
            WinActivate(wp_page_devtool)
            WinWaitActive(wp_page_devtool)
            sleep 1000
            Send "^{``}"
            sleep 250

            send_wp_button := "
            (
            document.querySelector('input[value=\"SEND WhatsApp\"]').click();
            )"

            A_Clipboard := send_wp_button
            Send "^v"
            Send "{Enter}"
            sleep 3000

            WinClose(wp_page_devtool)
            
            Sleep 1000

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

            Send "^+i" 
            WinWait(wp_homepage_devtools)
            WinActivate(wp_homepage_devtools)
            WinWaitActive(wp_homepage_devtools)
            sleep 500
            Send "^{``}"
            sleep 500

            copy_popup_skipper1 := "window.alert = msg => {console.log(`"Alert message was:`", msg); return true;};"
            A_Clipboard := copy_popup_skipper1
            
            Send "^v"
            Send "{Enter}"
            Sleep 200

            checkbox := "
            (
                        /**
             * Finds the table row with the highest serial number (SN) in the first <td>.
             * It then checks the checkbox/radio button located in that same row.
             */
            function checkHighestSerialNumberRow() {
                // 1. Get all table rows (adjust selector if your table has a unique ID, e.g., #myTable tbody tr)
                const rows = document.querySelectorAll('table tbody tr'); 

                if (rows.length === 0) {
                    console.warn('No table rows found. Please check your selector.');
                    return;
                }

                let maxSN = -1;
                let targetCheckbox = null;

                rows.forEach(row => {
                    // Assume the first <td> contains the serial number (SN) inside a <b> tag.
                    const snCell = row.querySelector('td:first-child b');
                    
                    if (snCell) {
                        // Extract the number and parse it.
                        const snText = snCell.textContent.trim();
                        const currentSN = parseInt(snText, 10);

                        // Check if it's a valid number and greater than the current maximum
                        if (!isNaN(currentSN) && currentSN > maxSN) {
                            maxSN = currentSN;
                            
                            // 2. Find the checkbox/radio button within this row.
                            // Based on your HTML: the checkbox is an input[type=\"checkbox\"] 
                            // in one of the other <td> elements.
                            const checkbox = row.querySelector('input[type=\"checkbox\"]');
                            
                            if (checkbox) {
                                targetCheckbox = checkbox;
                            }
                        }
                    }
                });

                // 3. Check the checkbox/radio button in the row with the maximum SN.
                if (targetCheckbox) {
                    // Set the checked state to true
                    targetCheckbox.checked = true;
                    
                    // IMPORTANT: If the checkbox uses an 'onclick' or 'onchange' event 
                    // (like 'onclick=\"notfound(...)\"), you must manually dispatch 
                    // the 'click' or 'change' event to trigger the associated server-side logic.
                    
                    console.log(`"Successfully checked checkbox in row with SN: ${maxSN}`");
                    
                    // Optional: Dispatch a 'change' event to trigger any attached event handlers.
                    targetCheckbox.dispatchEvent(new Event('change', { bubbles: true }));
                    // targetCheckbox.click(); // Alternatively, you can try simulating a click.

                } else if (maxSN !== -1) {
                    console.warn(`"Row with highest SN (${maxSN}) found, but no checkbox was located in that row.`");
                } else {
                    console.error('Could not determine the highest serial number.');
                }
            }

            // Execute the function
            checkHighestSerialNumberRow();

            )"

            A_Clipboard := checkbox
        
            Send "^v"
            sleep 500
            Send "{Enter}"
            Sleep 1000

            WinClose(wp_homepage_devtools)
            sleep 500

            Goto RestartLoop   ; <--- Jump straight to top of loop
        } 

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
        Send("^c")
        sleep 1500

        WinWait("WhatsApp")
        WinActivate("WhatsApp")
        WinWaitActive("WhatsApp")
        sleep 500

        click 1116,1670
        Sleep(500)
        Send("^v")
        sleep 18000
        Send "{Enter}"

        Send("{PrintScreen}")
        ; Move to the start position
        sleep 2000
        MouseMove(583, 72)
        ; Press and hold the left mouse button
        Click("down")
        Sleep(100)  ; optional small delay
        ; Drag to the end position
        MouseMove(2571, 1601, 10)  ; last parameter = speed (higher = slower)
        Sleep(500)  ; optional delay
        ; Release the left mouse button
        Click("up")
        sleep 1720

        WinWait(wp_page_devtool)
        WinActivate(wp_page_devtool)
        WinWaitActive(wp_page_devtool)
        sleep 1000
        Send "^{``}"
        sleep 250

        send_wp_button := "
        (
        document.querySelector('input[value=\"SEND WhatsApp\"]').click();
        )"

        A_Clipboard := send_wp_button
        Send "^v"
        Send "{Enter}"
        sleep 3000

        WinClose(wp_page_devtool)
        
        Sleep 1000

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

        WinWait(wp_homepage_devtools)
        WinActivate(wp_homepage_devtools)
        WinWaitActive(wp_homepage_devtools)
        sleep 250
        Send "^{``}"
        sleep 250

        upload_button := "
        (
            var targetRow = null;
        var maxSerial = -Infinity;
        
        // 1. Get all table row elements on the page
        var allRows = document.getElementsByTagName('tr');
        
        // 2. Loop through every row to find the one with the highest serial number
        for (var i = 0; i < allRows.length; i++) {
            var currentRow = allRows[i];
            if (currentRow.cells.length > 0) {
                var serialText = currentRow.cells[0].innerText.trim();
                var serialNum = parseInt(serialText, 10);
        
                // Check if it's a valid number and higher than current max
                if (!isNaN(serialNum) && serialNum > maxSerial) {
                    maxSerial = serialNum;
                    targetRow = currentRow;
                }
            }
        }
        
        // 3. If the highest row was found, click its link/button
        if (targetRow) {
            var uploadCell = targetRow.cells[2]; // assuming the button is in the 3rd column
            if (uploadCell) {
                var linkElement = uploadCell.getElementsByTagName('a')[0];
                if (linkElement) {
                    linkElement.click();
                    console.log('✅ Clicked the button on the row with the highest serial number: ' + maxSerial);
                } else {
                    console.error('❌ Could not find the clickable link (<a>) in the target row.');
                }
            } else {
                console.error('❌ Could not find the upload cell (3rd column) in the target row.');
            }
        } else {
            console.error('❌ Could not find any valid serial number rows.');
        }

        )"

        A_Clipboard := upload_button
        Send "^v"
        sleep 500
        Send "{Enter}"
        Sleep 500
        Send "{Enter}"
        sleep 500

        WinWait(upload_page)
        WinActivate(upload_page)
        WinWaitActive(upload_page)

        Send "^+i" 
        sleep 3000
        Send "^{``}"
        Sleep 1000

        click_upload := "document.querySelector('div.slim-file-hopper').click();"
        A_Clipboard := click_upload
        Send "^v"
        Send "{Enter}"
        Sleep 1000

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
        Sleep 3500

        WinWait(wp_homepage_devtools)
        WinActivate(wp_homepage_devtools)
        WinWaitActive(wp_homepage_devtools)
        
        noreply_selector := "
        (
                    /**
          * Finds the table row with the highest serial number (SN) in the first <td>.
          * It then selects the 'No Reply' option from the dropdown in that same row.
          */
         function selectNoReplyOnHighestSerialNumberRow() {
             // 1. Get all table rows (adjust selector if your table has a unique ID, e.g., #myTable tbody tr)
             const rows = document.querySelectorAll('table tbody tr'); 

             if (rows.length === 0) {
                 console.warn('No table rows found. Please check your selector.');
                 return;
             }

             let maxSN = -1;
             // We'll store the target dropdown element here instead of a checkbox
             let targetSelect = null; 
             let targetRow = null;

             rows.forEach(row => {
                 // Assume the first <td> contains the serial number (SN) inside a <b> tag.
                 const snCell = row.querySelector('td:first-child b');
                 
                 if (snCell) {
                     // Extract the number and parse it.
                     const snText = snCell.textContent.trim();
                     const currentSN = parseInt(snText, 10);

                     // Check if it's a valid number and greater than the current maximum
                     if (!isNaN(currentSN) && currentSN > maxSN) {
                         maxSN = currentSN;
                         targetRow = row; // Store the row element itself
                     }
                 }
             });

             // 2. Find the target dropdown in the row with the maximum SN.
             if (targetRow) {
                 // The dropdown is a <select> element in one of the <td>s in the target row.
                 // Adjust the selector if your select has a more specific class/ID pattern.
                 targetSelect = targetRow.querySelector('select[id^=\"jc\"]'); 

                 if (targetSelect) {
                     // 3. Set the value to '1' (which corresponds to \"No Reply\")
                     const NO_REPLY_VALUE = '1';
                     
                     // Set the value directly
                     targetSelect.value = NO_REPLY_VALUE;
                     
                     // IMPORTANT: The screenshot shows an onchange handler: onchange=\"ajaxFunction('2646474');\"
                     // We must manually dispatch a 'change' event to trigger this handler 
                     // and perform the associated AJAX/server-side update.
                     targetSelect.dispatchEvent(new Event('change', { bubbles: true }));
                     
                     console.log(`"Successfully selected 'No Reply' (value: ${NO_REPLY_VALUE}) for dropdown in row with SN: ${maxSN}`");

                 } else {
                     console.warn(`"Row with highest SN (${maxSN}) found, but no <select> element was located in that row.`");
                 }
             } else {
                 console.error('Could not determine the highest serial number.');
             }
         }

         // Execute the function
         selectNoReplyOnHighestSerialNumberRow();

        
        )"

        A_Clipboard := noreply_selector
        Send "^{``}"
        Sleep(1000)
        Send "^v"
        sleep 500
        Send "{Enter}"

        WinClose (upload_page)
        WinClose(wp_homepage_devtools)

        Attempts += 1 
    }
    
    ; Show completion message and reopen GUI
    MsgBox("Automation completed! Ran " TargetCount " times.", "Completed", "OK Iconi")
    CreateGUI()
}