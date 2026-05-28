#Requires AutoHotkey v2.0
#SingleInstance Force
#include Findtext.ahk

; Global variables for target counts
global free_web_ads_TargetCount := 5
global free_ads_home_TargetCount := 5
global pet_ads_TargetCount := 5
global fold_ads_TargetCount := 5
global classipress_TargetCount := 5
global free_best_ads_TargetCount := 5
global free_ads_online_targetCount := 5
global classified_4_free_targetCount := 5
global e_online_ads_targetCount := 5
global classifiedss_4_free_targetCount := 5
global get_ads_online_targetCount := 5
global premium_classified_targetCount := 5
global free_smart_list_Targetcount := 5
global smart_ad_posting_Targetcount := 5
global smart_free_ad_targetCount := 5
global re_classified_targetCount := 5
global Free_Ad1_targetCount := 5
global doclassified_targetCount := 5
global postsmartads_targetCount := 5
global totads_targetCount := 5

; Global variables to track current attempts for each function
global free_web_ads_Attempts := 0
global free_ads_home_Attempts := 0
global pet_ads_Attempts := 0
global fold_ads_Attempts := 0
global classipress_Attempts := 0
global free_best_ads_Attempts := 0
global free_ads_online_Attempts := 0
global classified_4_free_Attempts := 0
global e_online_ads_Attempts := 0
global classifiedss_4_free_Attempts := 0
global get_ads_online_Attempts := 0
global premium_classified_Attempts := 0
global free_smart_list_Attempts := 0
global smart_ad_posting_Attempts := 0
global smart_free_ad_Attempts := 0
global re_classified_Attempts := 0
global Free_Ad1_Attempts := 0
global doclassified_Attempts := 0
global postsmartads_Attempts := 0
global totads_Attempts := 0

; Global variable to control execution
global StopExecution := false

;---------------------------------------
; Create GUI
;---------------------------------------
myGui := Gui(, "Backlink Services Setup")

; Add margins for better spacing
myGui.MarginX := 15
myGui.MarginY := 2

; Add bulk update section at the top
myGui.AddText("Section w200", "Bulk Update All Target Counts:")
bulkInput := myGui.AddEdit("vbulkCount w60 yp", "5")
myGui.AddButton("x+10 w120 yp", "Apply to All").OnEvent("Click", ApplyBulkUpdate)

; Add some vertical space
myGui.AddText("xs h10", "")  ; Empty space

myGui.AddText("Section w200", "Free Web Ads Target Count:")
t1 := myGui.AddEdit("vfree_web_ads w60 yp", free_web_ads_TargetCount)

myGui.AddText("xs w200", "Free Ads Home Target Count:")
t2 := myGui.AddEdit("vfree_ads_home w60 yp", free_ads_home_TargetCount)

myGui.AddText("xs w200", "Pet Ads Target Count:")
t3 := myGui.AddEdit("vpet_ads w60 yp", pet_ads_TargetCount)

myGui.AddText("xs w200", "Fold Ads Target Count:")
t4 := myGui.AddEdit("vfold_ads w60 yp", fold_ads_TargetCount)

myGui.AddText("xs w200", "Classipress Target Count:")
t5 := myGui.AddEdit("vclassipress w60 yp", classipress_TargetCount)

myGui.AddText("xs w200", "Free Best Ads Target Count:")
t6 := myGui.AddEdit("vfree_best_ads w60 yp", free_best_ads_TargetCount)

myGui.AddText("xs w200", "Free Ads Online Target Count:")
t7 := myGui.AddEdit("vfree_ads_online w60 yp", free_ads_online_targetCount)

myGui.AddText("xs w200", "Classified 4 Free Target Count:")
t8 := myGui.AddEdit("vclassified_4_free w60 yp", classified_4_free_targetCount)

myGui.AddText("xs w200", "E Online Ads Target Count:")
t9 := myGui.AddEdit("ve_online_ads w60 yp", e_online_ads_targetCount)

myGui.AddText("xs w200", "Classifiedss 4 Free Target Count:")
t10 := myGui.AddEdit("vclassifiedss_4_free w60 yp", classifiedss_4_free_targetCount)

myGui.AddText("xs w200", "Get Ads Online Target Count:")
t11 := myGui.AddEdit("vget_ads_online w60 yp", get_ads_online_targetCount)

myGui.AddText("xs w200", "Premium Classified Target Count:")
t12 := myGui.AddEdit("vpremium_classified w60 yp", premium_classified_targetCount)

myGui.AddText("xs w200", "Free Smart List Target Count:")
t13 := myGui.AddEdit("vfree_smart_list w60 yp", free_smart_list_Targetcount)

myGui.AddText("xs w200", "Smart Ad Posting Target Count:")
t14 := myGui.AddEdit("vsmart_ad_posting w60 yp", smart_ad_posting_Targetcount)

myGui.AddText("xs w200", "Smart Free Ad Target Count:")
t15 := myGui.AddEdit("vsmart_free_ad w60 yp", smart_free_ad_targetCount)

myGui.AddText("xs w200", "Re Classified Target Count:")
t16 := myGui.AddEdit("vre_classified w60 yp", re_classified_targetCount)

myGui.AddText("xs w200", "Free Ad1 Target Count:")
t17 := myGui.AddEdit("vFree_Ad1 w60 yp", Free_Ad1_targetCount)

myGui.AddText("xs w200", "Do Classified Target Count:")
t18 := myGui.AddEdit("vdoclassified w60 yp", doclassified_targetCount)

myGui.AddText("xs w200", "Post Smart Ads Target Count:")
t19 := myGui.AddEdit("vpostsmartads w60 yp", postsmartads_targetCount)

myGui.AddText("xs w200", "Tot Ads Target Count:")
t20 := myGui.AddEdit("vtotads w60 yp", totads_targetCount)

; Add some vertical space before totals
myGui.AddText("xs h10", "")  ; Empty space

; Add total text display
totalText := myGui.AddText("xs w200 c5e3bdd", "Total Credits will be : " . CalculateTotal())

; Add money printed per month text display
moneyText := myGui.AddText("xs w200 c5e3bdd", "Money Printed Per Month: ₹" . CalculateMoney())

; Add number of websites text display
websitesText := myGui.AddText("xs w200 c5e3bdd", "Number of Websites: " . CountActiveWebsites())

; Add some vertical space before buttons
myGui.AddText("xs h10", "")  ; Empty space

; Add buttons in a new row with proper spacing
myGui.AddButton("xs w120 h30", "OK").OnEvent("Click", SaveValues)
myGui.AddButton("x+10 w180 h30", "Start Backlink Services").OnEvent("Click", StartBacklinkServices)
myGui.AddButton("xs w120 h30", "Stop Execution").OnEvent("Click", StopBacklinkServices)

; Show GUI with specified structure
myGui.Show("w900 h700 Center")

;---------------------------------------
; Function to apply bulk update to all target counts
;---------------------------------------
ApplyBulkUpdate(btn, info) {
    global
    
    ; Get the bulk count value
    submitted := myGui.Submit(false)
    bulkValue := submitted.bulkCount
    
    
    ; Update all edit controls with the bulk value
    t1.Value := bulkValue
    t2.Value := bulkValue
    t3.Value := bulkValue
    t4.Value := bulkValue
    t5.Value := bulkValue
    t6.Value := bulkValue
    t7.Value := bulkValue
    t8.Value := bulkValue
    t9.Value := bulkValue
    t10.Value := bulkValue
    t11.Value := bulkValue
    t12.Value := bulkValue
    t13.Value := bulkValue
    t14.Value := bulkValue
    t15.Value := bulkValue
    t16.Value := bulkValue
    t17.Value := bulkValue
    t18.Value := bulkValue
    t19.Value := bulkValue
    t20.Value := bulkValue
    

}

;---------------------------------------
; Function to calculate total of all target counts
;---------------------------------------
CalculateTotal() {
    global
    total := free_web_ads_TargetCount + free_ads_home_TargetCount + pet_ads_TargetCount + 
             fold_ads_TargetCount + classipress_TargetCount + free_best_ads_TargetCount +
             free_ads_online_targetCount + classified_4_free_targetCount + e_online_ads_targetCount +
             classifiedss_4_free_targetCount + get_ads_online_targetCount + premium_classified_targetCount +
             free_smart_list_Targetcount + smart_ad_posting_Targetcount + smart_free_ad_targetCount +
             re_classified_targetCount + Free_Ad1_targetCount + doclassified_targetCount +
             postsmartads_targetCount + totads_targetCount
    return total
}

;---------------------------------------
; Function to calculate money printed per month (total * 30)
;---------------------------------------
CalculateMoney() {
    return CalculateTotal() * 30
}

;---------------------------------------
; Function to count number of active websites (target count > 0)
;---------------------------------------
CountActiveWebsites() {
    global
    count := 0
    if (free_web_ads_TargetCount > 0)
        count++
    if (free_ads_home_TargetCount > 0)
        count++
    if (pet_ads_TargetCount > 0)
        count++
    if (fold_ads_TargetCount > 0)
        count++
    if (classipress_TargetCount > 0)
        count++
    if (free_best_ads_TargetCount > 0)
        count++
    if (free_ads_online_targetCount > 0)
        count++
    if (classified_4_free_targetCount > 0)
        count++
    if (e_online_ads_targetCount > 0)
        count++
    if (classifiedss_4_free_targetCount > 0)
        count++
    if (get_ads_online_targetCount > 0)
        count++
    if (premium_classified_targetCount > 0)
        count++
    if (free_smart_list_Targetcount > 0)
        count++
    if (smart_ad_posting_Targetcount > 0)
        count++
    if (smart_free_ad_targetCount > 0)
        count++
    if (re_classified_targetCount > 0)
        count++
    if (Free_Ad1_targetCount > 0)
        count++
    if (doclassified_targetCount > 0)
        count++
    if (postsmartads_targetCount > 0)
        count++
    if (totads_targetCount > 0)
        count++
    return count
}

;---------------------------------------
; Function to update all displays
;---------------------------------------
UpdateDisplays() {
    global totalText, moneyText, websitesText
    totalText.Text := "Total Credits will be : " . CalculateTotal()
    moneyText.Text := "Money Printed Per Month: ₹" . CalculateMoney()
    websitesText.Text := "Number of Websites: " . CountActiveWebsites()
}

;---------------------------------------
; Save the entered values to globals and show them (without closing GUI)
;---------------------------------------
SaveValues(btn, info) {
    global
    
    ; Submit the GUI without hiding it (use false parameter)
    submitted := myGui.Submit(false)
    
    ; Update the global variables with the submitted values
    free_web_ads_TargetCount := submitted.free_web_ads
    free_ads_home_TargetCount := submitted.free_ads_home
    pet_ads_TargetCount := submitted.pet_ads
    fold_ads_TargetCount := submitted.fold_ads
    classipress_TargetCount := submitted.classipress
    free_best_ads_TargetCount := submitted.free_best_ads
    free_ads_online_targetCount := submitted.free_ads_online
    classified_4_free_targetCount := submitted.classified_4_free
    e_online_ads_targetCount := submitted.e_online_ads
    classifiedss_4_free_targetCount := submitted.classifiedss_4_free
    get_ads_online_targetCount := submitted.get_ads_online
    premium_classified_targetCount := submitted.premium_classified
    free_smart_list_Targetcount := submitted.free_smart_list
    smart_ad_posting_Targetcount := submitted.smart_ad_posting
    smart_free_ad_targetCount := submitted.smart_free_ad
    re_classified_targetCount := submitted.re_classified
    Free_Ad1_targetCount := submitted.Free_Ad1
    doclassified_targetCount := submitted.doclassified
    postsmartads_targetCount := submitted.postsmartads
    totads_targetCount := submitted.totads
    
    ; Update all displays
    UpdateDisplays()
    
    ; Format the message content
    msgContent := "✅ Values saved and updated:`n`n"
    msgContent .= "Free Web Ads Target Count: " . free_web_ads_TargetCount . "`n"
    msgContent .= "Free Ads Home Target Count: " . free_ads_home_TargetCount . "`n"
    msgContent .= "Pet Ads Target Count: " . pet_ads_TargetCount . "`n"
    msgContent .= "Fold Ads Target Count: " . fold_ads_TargetCount . "`n"
    msgContent .= "Classipress Target Count: " . classipress_TargetCount . "`n"
    msgContent .= "Free Best Ads Target Count: " . free_best_ads_TargetCount . "`n"
    msgContent .= "Free Ads Online Target Count: " . free_ads_online_targetCount . "`n"
    msgContent .= "Classified 4 Free Target Count: " . classified_4_free_targetCount . "`n"
    msgContent .= "E Online Ads Target Count: " . e_online_ads_targetCount . "`n"
    msgContent .= "Classifiedss 4 Free Target Count: " . classifiedss_4_free_targetCount . "`n"
    msgContent .= "Get Ads Online Target Count: " . get_ads_online_targetCount . "`n"
    msgContent .= "Premium Classified Target Count: " . premium_classified_targetCount . "`n"
    msgContent .= "Free Smart List Target Count: " . free_smart_list_Targetcount . "`n"
    msgContent .= "Smart Ad Posting Target Count: " . smart_ad_posting_Targetcount . "`n"
    msgContent .= "Smart Free Ad Target Count: " . smart_free_ad_targetCount . "`n"
    msgContent .= "Re Classified Target Count: " . re_classified_targetCount . "`n"
    msgContent .= "Free Ad1 Target Count: " . Free_Ad1_targetCount . "`n"
    msgContent .= "Do Classified Target Count: " . doclassified_targetCount . "`n"
    msgContent .= "Post Smart Ads Target Count: " . postsmartads_targetCount . "`n"
    msgContent .= "Tot Ads Target Count: " . totads_targetCount . "`n`n"
    msgContent .= "📊 TOTAL CREDITS: " . CalculateTotal() . "`n"
    msgContent .= "💰 MONEY PER MONTH: ₹" . CalculateMoney() . "`n"
    msgContent .= "🌐 ACTIVE WEBSITES: " . CountActiveWebsites()
    
    ; Display the message box with all the new values (GUI stays open)
    MsgBox msgContent
}

;---------------------------------------
; Stop execution function
;---------------------------------------
StopBacklinkServices(btn, info) {
    global StopExecution
    StopExecution := true
    MsgBox "Execution will stop after current function completes."
}

;---------------------------------------
; Trigger Ctrl+B to start your service (without closing GUI)
;---------------------------------------
StartBacklinkServices(btn, info) {
    global StopExecution
    
    ; Reset stop flag
    StopExecution := false
    
    ; Reset all attempts
    free_web_ads_Attempts := 0
    free_ads_home_Attempts := 0
    pet_ads_Attempts := 0
    fold_ads_Attempts := 0
    classipress_Attempts := 0
    free_best_ads_Attempts := 0
    free_ads_online_Attempts := 0
    classified_4_free_Attempts := 0
    e_online_ads_Attempts := 0
    classifiedss_4_free_Attempts := 0
    get_ads_online_Attempts := 0
    premium_classified_Attempts := 0
    free_smart_list_Attempts := 0
    smart_ad_posting_Attempts := 0
    smart_free_ad_Attempts := 0
    re_classified_Attempts := 0
    Free_Ad1_Attempts := 0
    doclassified_Attempts := 0
    postsmartads_Attempts := 0
    totads_Attempts := 0
    
    ; Show the current total and money before starting
    activeWebsites := CountActiveWebsites()
    MsgBox "Starting backlink services with:`n`n" .
           "Total Credits: " . CalculateTotal() . "`n" .
           "Money Per Month: ₹" . CalculateMoney() . "`n" .
           "Active Websites: " . activeWebsites . "`n`n" .
           "Click 'Stop Execution' to stop at any time."
    
    ; Start the sequence
    StartBacklinkSequence()
}

;---------------------------------------
; Main sequence that runs ALL services with target count > 0
;---------------------------------------
StartBacklinkSequence() {
    global StopExecution
    
    ; Run ALL services that have target count > 0, in order
    if (free_web_ads_TargetCount > 0 && free_web_ads_Attempts < free_web_ads_TargetCount && !StopExecution) {
        RunFunctionWithAttempts("free_web_ads")
    }
    
    if (free_ads_home_TargetCount > 0 && free_ads_home_Attempts < free_ads_home_TargetCount && !StopExecution) {
        RunFunctionWithAttempts("free_ads_home")
    }
    
    if (pet_ads_TargetCount > 0 && pet_ads_Attempts < pet_ads_TargetCount && !StopExecution) {
        RunFunctionWithAttempts("pet_ads")
    }
    
    if (fold_ads_TargetCount > 0 && fold_ads_Attempts < fold_ads_TargetCount && !StopExecution) {
        RunFunctionWithAttempts("fold_ads")
    }
    
    if (classipress_TargetCount > 0 && classipress_Attempts < classipress_TargetCount && !StopExecution) {
        RunFunctionWithAttempts("classipress")
    }
    
    if (free_best_ads_TargetCount > 0 && free_best_ads_Attempts < free_best_ads_TargetCount && !StopExecution) {
        RunFunctionWithAttempts("free_best_ads")
    }
    
    if (free_ads_online_targetCount > 0 && free_ads_online_Attempts < free_ads_online_targetCount && !StopExecution) {
        RunFunctionWithAttempts("free_ads_online")
    }
    
    if (classified_4_free_targetCount > 0 && classified_4_free_Attempts < classified_4_free_targetCount && !StopExecution) {
        RunFunctionWithAttempts("classified_4_free")
    }
    
    if (e_online_ads_targetCount > 0 && e_online_ads_Attempts < e_online_ads_targetCount && !StopExecution) {
        RunFunctionWithAttempts("e_online_ads")
    }
    
    if (classifiedss_4_free_targetCount > 0 && classifiedss_4_free_Attempts < classifiedss_4_free_targetCount && !StopExecution) {
        RunFunctionWithAttempts("classifiedss_4_free")
    }
    
    if (get_ads_online_targetCount > 0 && get_ads_online_Attempts < get_ads_online_targetCount && !StopExecution) {
        RunFunctionWithAttempts("get_ads_online")
    }
    
    if (premium_classified_targetCount > 0 && premium_classified_Attempts < premium_classified_targetCount && !StopExecution) {
        RunFunctionWithAttempts("premium_classified")
    }
    
    if (free_smart_list_Targetcount > 0 && free_smart_list_Attempts < free_smart_list_Targetcount && !StopExecution) {
        RunFunctionWithAttempts("free_smart_list")
    }
    
    if (smart_ad_posting_Targetcount > 0 && smart_ad_posting_Attempts < smart_ad_posting_Targetcount && !StopExecution) {
        RunFunctionWithAttempts("smart_ad_posting")
    }
    
    if (smart_free_ad_targetCount > 0 && smart_free_ad_Attempts < smart_free_ad_targetCount && !StopExecution) {
        RunFunctionWithAttempts("smart_free_ad")
    }
    
    if (re_classified_targetCount > 0 && re_classified_Attempts < re_classified_targetCount && !StopExecution) {
        RunFunctionWithAttempts("re_classified")
    }
    
    if (Free_Ad1_targetCount > 0 && Free_Ad1_Attempts < Free_Ad1_targetCount && !StopExecution) {
        RunFunctionWithAttempts("Free_Ad1")
    }
    
    if (doclassified_targetCount > 0 && doclassified_Attempts < doclassified_targetCount && !StopExecution) {
        RunFunctionWithAttempts("doclassified")
    }
    
    if (postsmartads_targetCount > 0 && postsmartads_Attempts < postsmartads_targetCount && !StopExecution) {
        RunFunctionWithAttempts("postsmartads")
    }
    
    if (totads_targetCount > 0 && totads_Attempts < totads_targetCount && !StopExecution) {
        RunFunctionWithAttempts("totads")
    }
    
    if (!StopExecution) {
        MsgBox "All backlink services completed!`n`n" .
               "Active Websites processed: " . CountActiveWebsites() . "`n" .
               "Total Credits: " . CalculateTotal() . "`n" .
               "Money Per Month: ₹" . CalculateMoney()
    } else {
        MsgBox "Execution stopped by user.`n`n" .
               "Partial completion achieved."
    }
}


;---------------------------------------
; Function to run individual functions with attempt tracking
;---------------------------------------
RunFunctionWithAttempts(functionName) {
    global
    
    ; Get the current attempts and target count for this function
    Switch functionName {
        Case "free_web_ads":
            currentAttempts := free_web_ads_Attempts
            targetCount := free_web_ads_TargetCount
            functionToCall := start_free_web_ads
        Case "free_ads_home":
            currentAttempts := free_ads_home_Attempts
            targetCount := free_ads_home_TargetCount
            functionToCall := start_free_ads_home
        Case "pet_ads":
            currentAttempts := pet_ads_Attempts
            targetCount := pet_ads_TargetCount
            functionToCall := start_pet_ads
        Case "fold_ads":
            currentAttempts := fold_ads_Attempts
            targetCount := fold_ads_TargetCount
            functionToCall := start_fold_ads
        Case "classipress":
            currentAttempts := classipress_Attempts
            targetCount := classipress_TargetCount
            functionToCall := start_classipress
        Case "free_best_ads":
            currentAttempts := free_best_ads_Attempts
            targetCount := free_best_ads_TargetCount
            functionToCall := start_free_best_ads
        Case "free_ads_online":
            currentAttempts := free_ads_online_Attempts
            targetCount := free_ads_online_targetCount
            functionToCall := start_free_ads_online
        Case "classified_4_free":
            currentAttempts := classified_4_free_Attempts
            targetCount := classified_4_free_targetCount
            functionToCall := start_classified_4_free
        Case "e_online_ads":
            currentAttempts := e_online_ads_Attempts
            targetCount := e_online_ads_targetCount
            functionToCall := start_e_online_ads
        Case "classifiedss_4_free":
            currentAttempts := classifiedss_4_free_Attempts
            targetCount := classifiedss_4_free_targetCount
            functionToCall := start_classifiedss_4_free
        Case "get_ads_online":
            currentAttempts := get_ads_online_Attempts
            targetCount := get_ads_online_targetCount
            functionToCall := start_get_ads_online
        Case "premium_classified":
            currentAttempts := premium_classified_Attempts
            targetCount := premium_classified_targetCount
            functionToCall := start_premium_classified
        Case "free_smart_list":
            currentAttempts := free_smart_list_Attempts
            targetCount := free_smart_list_Targetcount
            functionToCall := start_free_smart_list
        Case "smart_ad_posting":
            currentAttempts := smart_ad_posting_Attempts
            targetCount := smart_ad_posting_Targetcount
            functionToCall := start_smart_ad_posting
        Case "smart_free_ad":
            currentAttempts := smart_free_ad_Attempts
            targetCount := smart_free_ad_targetCount
            functionToCall := start_smart_free_ad
        Case "re_classified":
            currentAttempts := re_classified_Attempts
            targetCount := re_classified_targetCount
            functionToCall := start_re_classified
        Case "Free_Ad1":
            currentAttempts := Free_Ad1_Attempts
            targetCount := Free_Ad1_targetCount
            functionToCall := start_Free_Ad1
        Case "doclassified":
            currentAttempts := doclassified_Attempts
            targetCount := doclassified_targetCount
            functionToCall := start_doclassified
        Case "postsmartads":
            currentAttempts := postsmartads_Attempts
            targetCount := postsmartads_targetCount
            functionToCall := start_postsmartads
        Case "totads":
            currentAttempts := totads_Attempts
            targetCount := totads_targetCount
            functionToCall := start_totads
    }
    
    ; Run the function until target count is reached or stopped
    while (currentAttempts < targetCount && !StopExecution) {
        ; Call the actual function and check return value
        completedSuccessfully := functionToCall()
        
        ; Only increment counter if function completed successfully (not skipped)
        if (completedSuccessfully) {
            currentAttempts++
            
            ; Update the global attempts variable
            Switch functionName {
                Case "free_web_ads": free_web_ads_Attempts := currentAttempts
                Case "free_ads_home": free_ads_home_Attempts := currentAttempts
                Case "pet_ads": pet_ads_Attempts := currentAttempts
                Case "fold_ads": fold_ads_Attempts := currentAttempts
                Case "classipress": classipress_Attempts := currentAttempts
                Case "free_best_ads": free_best_ads_Attempts := currentAttempts
                Case "free_ads_online": free_ads_online_Attempts := currentAttempts
                Case "classified_4_free": classified_4_free_Attempts := currentAttempts
                Case "e_online_ads": e_online_ads_Attempts := currentAttempts
                Case "classifiedss_4_free": classifiedss_4_free_Attempts := currentAttempts
                Case "get_ads_online": get_ads_online_Attempts := currentAttempts
                Case "premium_classified": premium_classified_Attempts := currentAttempts
                Case "free_smart_list": free_smart_list_Attempts := currentAttempts
                Case "smart_ad_posting": smart_ad_posting_Attempts := currentAttempts
                Case "smart_free_ad": smart_free_ad_Attempts := currentAttempts
                Case "re_classified": re_classified_Attempts := currentAttempts
                Case "Free_Ad1": Free_Ad1_Attempts := currentAttempts
                Case "doclassified": doclassified_Attempts := currentAttempts
                Case "postsmartads": postsmartads_Attempts := currentAttempts
                Case "totads": totads_Attempts := currentAttempts
            }
        }
        
        ; Small delay between attempts
        if (currentAttempts < targetCount && !StopExecution) {
            Sleep(1000) ; 1 second delay between attempts
        }
    }
    
    ; If this function completed, move to next one automatically
    if (!StopExecution) {
        StartBacklinkSequence()
    }
}


 dev := "DevTools - mypetads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0&"


;===================================================================================================================================================================================================================
;===================================================================================================================================================================================================================



;===================================================================================================================================================================================================================

start_free_web_ads() {
    global free_web_ads_Attempts, free_web_ads_TargetCount, StopExecution
    
    ; Create local copies for display - use the actual current values
    currentAttempt := free_web_ads_Attempts
    targetCount := free_web_ads_TargetCount
    
    ; Show progress in tooltip using the actual counter values
    ToolTip "Running Free Web Ads... Attempt: " . (currentAttempt + 1) . "/" . targetCount
    
    ; Your existing code for one attempt
    freewebads_homepage := "Basildon, USA - Free Business Classified Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    freewebadsdevtools := "DevTools - freewebads.biz/index.php?view=post&cityid=389&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000
    
    Send "^1" 
    sleep 1000
    
    if WinExist(backlinkhomepage_devtool) {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    
    Send "^v"
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Check for skipper - if found, clean up and return false (not completed)
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Free Web Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Free Web Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Continue with normal execution if no skipper found
    if WinExist(backlinkdevtool) {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=\"source\"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Web Ads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"
    
    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    ; ... continue with ALL the rest of your original code exactly as it was ...
    
    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)
    
    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)
    
    ; The URL to navigate to
    link := "https://freewebads.biz/index.php?view=post&cityid=389&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(500)
    
    Winwait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)
    sleep 1500
    
    if WinExist(freewebadsdevtools) {   
        Winwait(freewebadsdevtools)
        WinActivate(freewebadsdevtools)
        WinWaitActive(freewebadsdevtools)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    
    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5
    
    ; Paste JS into console
    A_Clipboard := jsFinal  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Open DevTools
    Send "^+i"
    Sleep 1000
    
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(freewebadsdevtools)
    WinActivate(freewebadsdevtools)
    Sleep 1000
    
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    
    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100
    
    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"
    
    WinWait(consolee) 
    WinActivate(consolee)
    
    ; Open DevTools
    Send "^+i"
    Sleep 1000
    
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    Sleep 1000
    
    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 623,1250
    sleep 1000
    Send "^v"
    Sleep 500
    
    Send "+{Home}"
    
    sleep 250
    
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250
    
    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000
    
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    
    A_Clipboard := sub  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)
    sleep 1000
    
    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=\"color:red\"]');
    
    if (precedingElements.length < 2) {
        return console.error(`"Found only ${precedingElements.length} red-colored elements. We need at least two to skip the first one.`");
    }
    
    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];
    
    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;
    
    if (!urlElement) {
        return console.error("Found the second red element, but no element follows it.");
    }
    
    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();
    
    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);
    
    console.log(`"[Success] The link following the second red-text element has been copied to your clipboard: \n\n${link}`");
    })();
    )"
    
    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)
    
    if WinExist(dev){
        WinWait(dev)
        WinActivate(dev)
        WinWaitActive(dev)
        sleep 200
    }
    
    WinWait(freewebadsdevtools)
    WinActivate(freewebadsdevtools)
    WinWaitActive(freewebadsdevtools)
    
    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    Send "^{``}"
    Sleep(500)
    
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix ; Use the combined variable
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=\"category\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for "Work From Home" [cite: image_7e788d.png]
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for "Part Time/Full Time Work." [cite: image_7e73f4.png]
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for "Lead Management"
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for "Jobs," "Career," or "Service" [cite: image_7e77ee.png]
        // If any of these are present, we set the value to 'Jobs' (assuming that's the desired selection).
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=\"subcategory\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job' 
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.' 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)
    
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange  ; Use the combined variable
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600
    
    if WinExist(backlinkdevtool) {
        WinClose (backlinkdevtool)
        sleep 800
    }
    
    if WinExist(freewebadsdevtools) {
        WinClose (freewebadsdevtools)
        sleep 800
    }
    
    send "^w"
    
    ; SUCCESS: Function completed
    ToolTip "Free Web Ads attempt completed successfully"
    Sleep(1000)
    ToolTip
    
    return true ; Return true to indicate completed successfully
}

;===================================================================================================================================================================================================================

start_free_ads_home() {
    global free_ads_home_Attempts, free_ads_home_TargetCount, StopExecution
    
    ; Create local copies for display
    currentAttempt := free_ads_home_Attempts
    targetCount := free_ads_home_TargetCount
    
    ; Show progress in tooltip
    ToolTip "Running Free Ads Home... Attempt: " . (currentAttempt + 1) . "/" . targetCount
    
    ; Your existing code for one attempt
    freeadshome := "India, Other Countries - Post Free Ads Without Registration"
    freeadshome_homepage := "Post Free Ads Without Registration"
    freeadshome_homepage2 := "India, Other Countries - Total Free Classified Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    freeadshomedevtools := "DevTools - freeadshome.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    dev := "DevTools - freeadshome.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0&"
    forbidden := "403 Forbidden"
    
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 500
    
    Send "^1" 
    sleep 500
    
    if WinExist(backlinkhomepage_devtool) {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    
    Send "^v"
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Free Ads Home attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Free Ads Home attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    if WinExist(backlinkdevtool) {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=\"source\"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Ads Home') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"
    
    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    ; Keep checking every 2 seconds until found
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break ; Exit loop when found
        } else {
            Sleep 500 ; Wait 2 seconds before checking again
        }
    }
    
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    WinWait(freeadshome_homepage)
    WinActivate(freeadshome_homepage)
    WinWaitActive(freeadshome_homepage)
    
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    ; Keep checking every 2 seconds until found
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break ; Exit loop when found
        } else {
            Sleep 500 ; Wait 2 seconds before checking again
        }
    }
    
    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)
    
    ; The URL to navigate to
    link := "https://freeadshome.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    ; Keep checking every 2 seconds until found
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break ; Exit loop when found
        } else {
            Sleep 500 ; Wait 2 seconds before checking again
        }
    }
    
    if WinExist(freeadshomedevtools) {   
        Winwait(freeadshomedevtools)
        WinActivate(freeadshomedevtools)
        WinWaitActive(freeadshomedevtools)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    
    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5
    
    ; Paste JS into console
    A_Clipboard := jsFinal  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Open DevTools
    Send "^+i"
    Sleep(1000)
    
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(freeadshomedevtools)
    WinActivate(freeadshomedevtools)
    Sleep(500)
    
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    
    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep(100)
    
    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep(100)
    Send "{Enter}"
    
    WinWait(consolee) 
    WinActivate(consolee)
    
    ; Open DevTools
    Send "^+i"
    Sleep(1000)
    
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(freeadshome)
    WinActivate(freeadshome)
    Sleep(1000)
    
    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 805,1163
    sleep 1000
    Send "^v"
    Sleep(500)
    
    Send "+{Home}"
    
    sleep 250
    
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250
    
    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep(1000)
    
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    
    A_Clipboard := sub  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)
    
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    ; Keep checking every 2 seconds until found
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break ; Exit loop when found
        } else {
            Sleep 500 ; Wait 2 seconds before checking again
        }
    }
    
    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=\"color:red\"]');
    
    if (precedingElements.length < 2) {
        return console.error(`"Found only ${precedingElements.length} red-colored elements. We need at least two to skip the first one.`");
    }
    
    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];
    
    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;
    
    if (!urlElement) {
        return console.error("Found the second red element, but no element follows it.");
    }
    
    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();
    
    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);
    
    console.log(`"[Success] The link following the second red-text element has been copied to your clipboard: \n\n${link}`");
    })();
    )"
    
    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)
    
    WinWait(dev)
    WinActivate(dev)
    WinWaitActive(dev)
    sleep 200
    
    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    Send "^{``}"
    Sleep(500)
    
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix ; Use the combined variable
    Send "^v"
    Sleep(200)
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=\"category\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for "Work From Home" [cite: image_7e788d.png]
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for "Part Time/Full Time Work." [cite: image_7e73f4.png]
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for "Lead Management"
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for "Jobs," "Career," or "Service" [cite: image_7e77ee.png]
        // If any of these are present, we set the value to 'Jobs' (assuming that's the desired selection).
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=\"subcategory\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job' 
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.' 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)
    
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange  ; Use the combined variable
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity  ; Use the combined variable
    Sleep 200
    Send "^v"
    Sleep(800)
    Send "{Enter}"
    sleep 1000
    
    Sleep(400)
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick  ; Use the combined variable
    Sleep(200)
    Send "^v"
    Sleep(800)
    Send "{Enter}"
    sleep 4600
    
    if WinExist(backlinkdevtool) {
        WinClose (backlinkdevtool)
        sleep 800
    }
    
    if WinExist(freeadshomedevtools) {
        WinClose (freeadshomedevtools)
        sleep 800
    }
    
    sleep 1000
    
    send "^w"
    
    ; SUCCESS: Function completed
    ToolTip "Free Ads Home attempt completed successfully"
    Sleep(1000)
    ToolTip
    
    return true ; Return true to indicate completed successfully
}

;===================================================================================================================================================================================================================

start_pet_ads() {
    global pet_ads_Attempts, pet_ads_TargetCount, StopExecution
    
    ; Create local copies for display
    currentAttempt := pet_ads_Attempts
    targetCount := pet_ads_TargetCount
    
    ; Show progress in tooltip
    ToolTip "Running Pet Ads... Attempt: " . (currentAttempt + 1) . "/" . targetCount
    
    ; Your existing code for one attempt
    pet_ads_last := "India, Other Countries - My Free Pet Ads Website"
    pet_ads := "My Free Pet Ads Website"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    pet_ads_devtools := "DevTools - mypetads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000
    
    Send "^1" 
    sleep 1000
    
    if WinExist(backlinkhomepage_devtool) {  
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    
    Send "^v"
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Pet Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Pet Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    if WinExist(backlinkdevtool) {  
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=\"source\"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'My Pet Ads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"
    
    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip "Error page detected - Pet Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    WinWait(pet_ads)
    WinActivate(pet_ads)
    WinWaitActive(pet_ads)
    
    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)
    
    ; The URL to navigate to
    link := "https://mypetads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(1500)
    
    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    Winwait(pet_ads)
    WinActivate(pet_ads)
    WinWaitActive(pet_ads)
    sleep 1500
    
    if WinExist(pet_ads_devtools) {  
        Winwait(pet_ads_devtools)
        WinActivate(pet_ads_devtools)
        WinWaitActive(pet_ads_devtools)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    
    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5
    
    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Open DevTools
    Send "^+i"
    Sleep 1000
    
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(pet_ads_devtools)
    WinActivate(pet_ads_devtools)
    Sleep 1000
    
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    
    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100
    
    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"
    
    WinWait(consolee) 
    WinActivate(consolee)
    
    ; Open DevTools
    Send "^+i"
    Sleep 1000
    
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(pet_ads)
    WinActivate(pet_ads)
    Sleep 1000
    
    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 660,1180
    sleep 1000
    Send "^v"
    Sleep 500
    
    Send "+{Home}"
    
    sleep 250
    
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250
    
    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000
    
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(pet_ads_last)
    WinActivate(pet_ads_last)
    WinWaitActive(pet_ads_last)
    sleep 1000
    
    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=\"color:red\"]');
    
    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }
    
    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];
    
    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;
    
    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }
    
    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();
    
    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);
    
    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"
    
    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)
    
    if WinExist(dev){
        WinWait(dev)
        WinActivate(dev)
        WinWaitActive(dev)
        sleep 200
    }
    
    WinWait(pet_ads_devtools)
    WinActivate(pet_ads_devtools)
    WinWaitActive(pet_ads_devtools)
    
    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    Send "^{``}"
    Sleep(500)
    
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=\"category\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=\"subcategory\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)
    
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600
    
    if WinExist(backlinkdevtool) {
        WinClose (backlinkdevtool)
        sleep 800
    }
    
    if WinExist(pet_ads_devtools) {
        WinClose (pet_ads_devtools)
        sleep 800
    }
    
    send "^w"
    
    ; SUCCESS: Function completed
    ToolTip "Pet Ads attempt completed successfully"
    Sleep(1000)
    ToolTip
    
    return true ; Return true to indicate completed successfully
}

;===================================================================================================================================================================================================================

start_fold_ads() {
    global fold_ads_Attempts, fold_ads_TargetCount, StopExecution
    
    ; Create local copies for display
    currentAttempt := fold_ads_Attempts
    targetCount := fold_ads_TargetCount
    
    ; Show progress in tooltip
    ToolTip "Running Fold Ads... Attempt: " . (currentAttempt + 1) . "/" . targetCount
    
    ; Your existing code for one attempt
    fold_ads_last := "India, Other Countries - Free Classified Website - Place Ads Without Registration"
    fold_ads := "Free Classified Website - Place Ads Without Registration"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    fold_ads_devtools := "DevTools - foldads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000
    
    Send "^1" 
    sleep 1000
    
    if WinExist(backlinkhomepage_devtool) {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    
    Send "^v"
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Fold Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Fold Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    if WinExist(backlinkdevtool) {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=\"source\"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Fold Ads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"
    
    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip "Error page detected - Fold Ads attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    WinWait(fold_ads)
    WinActivate(fold_ads)
    WinWaitActive(fold_ads)
    
    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)
    
    ; The URL to navigate to
    link := "https://foldads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(1500)
    
    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    Winwait(fold_ads_last)
    WinActivate(fold_ads_last)
    WinWaitActive(fold_ads_last)
    sleep 1500
    
    if WinExist(fold_ads_devtools) {   
        Winwait(fold_ads_devtools)
        WinActivate(fold_ads_devtools)
        WinWaitActive(fold_ads_devtools)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    
    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5
    
    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Open DevTools
    Send "^+i"
    Sleep 1000
    
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(fold_ads_devtools)
    WinActivate(fold_ads_devtools)
    Sleep 1000
    
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    
    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100
    
    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"
    
    WinWait(consolee) 
    WinActivate(consolee)
    
    ; Open DevTools
    Send "^+i"
    Sleep 1000
    
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(fold_ads_last)
    WinActivate(fold_ads_last)
    Sleep 1000
    
    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 623,1250
    sleep 1000
    Send "^v"
    Sleep(500)
    
    Send "+{Home}"
    
    sleep 250
    
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250
    
    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep(1000)
    
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(fold_ads_last)
    WinActivate(fold_ads_last)
    WinWaitActive(fold_ads_last)
    sleep 1000
    
    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=\"color:red\"]');
    
    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }
    
    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];
    
    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;
    
    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }
    
    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();
    
    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);
    
    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"
    
    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)
    
    if WinExist(dev){
        WinWait(dev)
        WinActivate(dev)
        WinWaitActive(dev)
        sleep 200
    }
    
    WinWait(fold_ads_devtools)
    WinActivate(fold_ads_devtools)
    WinWaitActive(fold_ads_devtools)
    
    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    Send "^{``}"
    Sleep(500)
    
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=\"category\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=\"subcategory\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)
    
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600
    
    if WinExist(backlinkdevtool) {
        WinClose (backlinkdevtool)
        sleep 800
    }
    
    if WinExist(fold_ads_devtools) {
        WinClose (fold_ads_devtools)
        sleep 800
    }
    
    send "^w"
    
    ; SUCCESS: Function completed
    ToolTip "Fold Ads attempt completed successfully"
    Sleep(1000)
    ToolTip
    
    return true ; Return true to indicate completed successfully
}

;===================================================================================================================================================================================================================

start_classipress() {
    global classipress_Attempts, classipress_TargetCount, StopExecution
    
    ; Create local copies for display
    currentAttempt := classipress_Attempts
    targetCount := classipress_TargetCount
    
    ; Show progress in tooltip
    ToolTip "Running Classipress... Attempt: " . (currentAttempt + 1) . "/" . targetCount
    
    ; Your existing code for one attempt
    classipress_last := "India, Other Countries - FreeClassiPress - 100% Free Classifieds Ads"
    classipress_ads := "FreeClassiPress - 100% Free Classifieds Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    classipress_devtools := "DevTools - freeclassipress.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000
    
    Send "^1" 
    sleep 1000
    
    if WinExist(backlinkhomepage_devtool) {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    
    Send "^v"
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    if WinExist(backlinkdevtool) {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    } else {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=\"source\"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Classipress') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"
    
    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip "Error page detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    WinWait(classipress_ads)
    WinActivate(classipress_ads)
    WinWaitActive(classipress_ads)
    
    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)
    
    ; The URL to navigate to
    link := "https://freeclassipress.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(1500)
    
    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    Winwait(classipress_ads)
    WinActivate(classipress_ads)
    WinWaitActive(classipress_ads)
    sleep 1500
    
    if WinExist(classipress_devtools) {   
        Winwait(classipress_devtools)
        WinActivate(classipress_devtools)
        WinWaitActive(classipress_devtools)
        Send "^{``}"
        Sleep(1000)
    } else {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }
    
    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    
    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5
    
    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    ; Open DevTools
    Send "^+i"
    Sleep(1000)
    
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(classipress_devtools)
    WinActivate(classipress_devtools)
    Sleep 1000
    
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    
    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100
    
    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"
    
    WinWait(consolee) 
    WinActivate(consolee)
    
    ; Open DevTools
    Send "^+i"
    Sleep(1000)
    
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)
    
    WinWait(classipress_ads)
    WinActivate(classipress_ads)
    Sleep 1000
    
    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 623,1250
    sleep 1000
    Send "^v"
    Sleep(500)
    
    Send "+{Home}"
    
    sleep 250
    
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250
    
    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep(1000)
    
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)
    
    WinWait(classipress_last)
    WinActivate(classipress_last)
    WinWaitActive(classipress_last)
    sleep 1000
    
    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=\"color:red\"]');
    
    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }
    
    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];
    
    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;
    
    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }
    
    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();
    
    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);
    
    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"
    
    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)
    
    if WinExist(dev){
        WinWait(dev)
        WinActivate(dev)
        WinWaitActive(dev)
        sleep 200
    }
    
    WinWait(classipress_devtools)
    WinActivate(classipress_devtools)
    WinWaitActive(classipress_devtools)
    
    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    
    Send "^{``}"
    Sleep(500)
    
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=\"category\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=\"subcategory\"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)
    
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600
    
    if WinExist(backlinkdevtool) {
        WinClose (backlinkdevtool)
        sleep 800
    }
    
    if WinExist(classipress_devtools) {
        WinClose (classipress_devtools)
        sleep 800
    }
    
    send "^w"
    
    ; SUCCESS: Function completed
    ToolTip "Classipress attempt completed successfully"
    Sleep(1000)
    ToolTip
    
    return true ; Return true to indicate completed successfully
}

;===================================================================================================================================================================================================================

start_free_best_ads() {
    global free_best_ads_Attempts, free_best_ads_TargetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := free_best_ads_Attempts
    targetCount := free_best_ads_TargetCount
    
    ; Update tooltip to show current progress
    ToolTip("Free Best Ads - Attempt " currentAttempt + 1 " of " targetCount)
    
    free_best_ads_last := "India, Other Countries - Best Free Classified Ads Site"
    free_best_ads := "Best Free Classified Ads Site"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_best_ads_devtools := "DevTools - freebestads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep(1500)

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Best Ads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        return false
    }

    WinWait(free_best_ads)
    WinActivate(free_best_ads)
    WinWaitActive(free_best_ads)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)

    ; The URL to navigate to
    link := "https://freebestads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(1500)

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(free_best_ads_last)
    WinActivate(free_best_ads_last)
    WinWaitActive(free_best_ads_last)
    sleep 1500
    
    if WinExist(free_best_ads_devtools) 
    {   
        Winwait(free_best_ads_devtools)
        WinActivate(free_best_ads_devtools)
        WinWaitActive(free_best_ads_devtools)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)

    WinWait(free_best_ads_devtools)
    WinActivate(free_best_ads_devtools)
    Sleep 1000

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep(1000)

    WinWait(free_best_ads)
    WinActivate(free_best_ads)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 660,1180
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)

    WinWait(free_best_ads_last)
    WinActivate(free_best_ads_last)
    WinWaitActive(free_best_ads_last)
    sleep 1000

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)

    if WinExist(dev){
        WinWait(dev)
        WinActivate(dev)
        WinWaitActive(dev)
        sleep 200
    }

    WinWait(free_best_ads_devtools)
    WinActivate(free_best_ads_devtools)
    WinWaitActive(free_best_ads_devtools)

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(free_best_ads_devtools)
    {
        WinClose (free_best_ads_devtools)
        sleep 800
    }

    send "^w"
    ToolTip

    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_free_ads_online() {
    global free_ads_online_Attempts, free_ads_online_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := free_ads_online_Attempts
    targetCount := free_ads_online_targetCount

    ; Update tooltip to show current progress
    ToolTip("Free Ads Online - Attempt " currentAttempt + 1 " of " targetCount)
    
    free_ads_online := "Free Ads Online - Free Classifieds"
    free_ads_online_last := "India, Other Countries - Free Ads Online - Free Classifieds"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - freeadsonline.biz/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep(1500)

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Ads Online') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip() ; Clear tooltip before returning
        return false
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)

    ; The URL to navigate to
    link := "https://freeadsonline.biz/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(1500)

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500
    
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = `"" . locationText . "`";"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = `"" . emailAddress . "`";"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep(1000)

    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = `"" . titleText . "`";"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep(1000)

    Send(addescription)
    Send("{Enter}")
    Sleep(1000)

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ; PRESERVED ORIGINAL CLICK COORDINATES (722,1187)
    Click 722,1187
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)

    WinWait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1000

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = `"" . postLink . "`";"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Fixed window closing to include both devtools windows
    if WinExist(backlinkdevtool)
    {
        WinClose(backlinkdevtool)
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose(free_ads_online_dev)
        sleep 800
    }

    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_classified_4_free() {
    global classified_4_free_Attempts, classified_4_free_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := classified_4_free_Attempts
    targetCount := classified_4_free_targetCount

    ; Update tooltip to show current progress
    ToolTip("Classifieds 4 Free - Attempt " currentAttempt + 1 " of " targetCount)
    
    classified_4_free := "Classifieds For Free"
    classified_4_free_last := "India, Other Countries - Classifieds For Free"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    classified_4_free_dev := "DevTools - classifieds4free.biz/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep(1500)

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Classifieds 4 free') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip() ; Clear tooltip before returning
        return false
    }

    WinWait(classified_4_free)
    WinActivate(classified_4_free)
    WinWaitActive(classified_4_free)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep(500)

    ; The URL to navigate to
    link := "https://classifieds4free.biz/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep(1500)

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(classified_4_free_last)
    WinActivate(classified_4_free_last)
    WinWaitActive(classified_4_free_last)
    sleep 1500
    
    if WinExist(classified_4_free_dev) 
    {   
        Winwait(classified_4_free_dev)
        WinActivate(classified_4_free_dev)
        WinWaitActive(classified_4_free_dev)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = `"" . locationText . "`";"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = `"" . emailAddress . "`";"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep(1000)

    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)

    WinWait(classified_4_free_dev)
    WinActivate(classified_4_free_dev)
    Sleep(1000)

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = `"" . titleText . "`";"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep(1000)

    Send(addescription)
    Send("{Enter}")
    Sleep(1000)

    WinWait(classified_4_free)
    WinActivate(classified_4_free)
    Sleep(1000)

    ; PRESERVED ORIGINAL CLICK COORDINATES (700,1182)
    Click 700,1182
    sleep 1000
    Send "^v"
    Sleep(500)

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep(1000)

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)

    WinWait(classified_4_free_last)
    WinActivate(classified_4_free_last)
    WinWaitActive(classified_4_free_last)
    sleep 1000

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep(200)

    WinWait(classified_4_free_dev)
    WinActivate(classified_4_free_dev)
    WinWaitActive(classified_4_free_dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep(500)

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = `"" . postLink . "`";"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Fixed window closing to include both devtools windows
    if WinExist(backlinkdevtool)
    {
        WinClose(backlinkdevtool)
        sleep 800
    }

    if WinExist(classified_4_free_dev)
    {
        WinClose(classified_4_free_dev)
        sleep 800
    }

    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;====================================================================================================================================================================================================================

start_e_online_ads() {
    global e_online_ads_Attempts, e_online_ads_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := e_online_ads_Attempts
    targetCount := e_online_ads_targetCount

    ; Update tooltip to show current progress
    ToolTip("E Online Ads - Attempt " currentAttempt + 1 " of " targetCount)
    
    freewebads_homepage := "India, Other Countries - Free Online Classified Ads"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    freewebadsdevtools := "DevTools - eonlineads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'E Online Ads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip()
        return false
    }
    
    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep 500

    ; The URL to navigate to
    link := "https://eonlineads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep 1500

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)
    sleep 1500
    
    if WinExist(freewebadsdevtools) 
    {   
        Winwait(freewebadsdevtools)
        WinActivate(freewebadsdevtools)
        WinWaitActive(freewebadsdevtools)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(freewebadsdevtools)
    WinActivate(freewebadsdevtools)
    Sleep 1000

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 836,1261  ; PRESERVED ORIGINAL COORDINATES
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)
    sleep 1000

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep 200

    WinWait(freewebadsdevtools)
    WinActivate(freewebadsdevtools)
    WinWaitActive(freewebadsdevtools)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose backlinkdevtool
        sleep 800
    }

    if WinExist(freewebadsdevtools)
    {
        WinClose freewebadsdevtools
        sleep 800
    }

    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_classifiedss_4_free() {
    global classifiedss_4_free_Attempts, classifiedss_4_free_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := classifiedss_4_free_Attempts
    targetCount := classifiedss_4_free_targetCount

    ; Update tooltip to show current progress
    ToolTip("Classifieds 4 Free - Attempt " currentAttempt + 1 " of " targetCount)
    
    free_ads_online := "Classified Fore Free"
    free_ads_online_last := "India, Other Countries - Classified Fore Free"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - classifieds4free.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Classified 4 free') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip()
        return false
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep 500

    ; The URL to navigate to
    link := "https://classifieds4free.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep 1500

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500
    
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 1000,1328  ; PRESERVED ORIGINAL COORDINATES
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1000

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep 200

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose backlinkdevtool
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose free_ads_online_dev
        sleep 800
    }

    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_get_ads_online() {
    global get_ads_online_Attempts, get_ads_online_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := get_ads_online_Attempts
    targetCount := get_ads_online_targetCount

    ; Update tooltip to show current progress
    ToolTip("Get Ads Online - Attempt " currentAttempt + 1 " of " targetCount)
    
    free_ads_online := "Free Classified Website | Free Online Classifieds"
    free_ads_online_last := "India, Other Countries - Free Classified Website | Free Online Classifieds"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - getadsonline.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Get Ads Online') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip()
        return false
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep 500

    ; The URL to navigate to
    link := "https://getadsonline.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")
    Sleep 1500

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500
    
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 1000,1328  ; PRESERVED ORIGINAL COORDINATES
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1000

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep 200

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose backlinkdevtool
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose free_ads_online_dev
        sleep 800
    }

    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_premium_classified() {
    ; Global declarations
    global premium_classified_Attempts, premium_classified_targetCount, StopExecution
    
    ; Local variables for display
    local currentAttempt := premium_classified_Attempts
    local targetCount := premium_classified_targetCount
    
    ; Update tooltip with current progress
    ToolTip "Premium Classified Attempt: " currentAttempt + 1 "/" targetCount
    
    ; Define window titles and text patterns
    free_ads_online := "Post Free Premium Classified Ads"
    free_ads_online_last := "India, Other Countries - Post Free Premium Classified Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - premiumclassified.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    ; Define ad content
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    ; Activate Brave browser
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    ; Open DevTools
    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; Start backlink process
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    Send "^v"
    Send "{Enter}"
    Sleep(1500)

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    ; Ensure DevTools is open
    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; Select Premium Classified source
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Premium Classified') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        return false  ; Return false when error page detected
    }

    ; Navigate to posting page
    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Send("^l")
    Sleep(500)
    link := "https://premiumclassified.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    Send(link)
    Send("{Enter}")
    Sleep(1500)

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Open DevTools for form filling
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; Fill form fields
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    ; Fill title
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^+i"
    Sleep(1000)
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep(1000)
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    A_Clipboard := jsTitle
    Sleep(100)
    Send "^v"
    Sleep(100)
    Send "{Enter}"

    ; Fill description
    WinWait(consolee) 
    WinActivate(consolee)
    Send "^+i"
    Sleep(1000)
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep(1000)

    ; Solve forbidden glitch
    Click 1000,1328
    sleep 1000
    Send "^v"
    Sleep(500)
    Send "+{Home}"
    sleep 250
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Submit form
    Send "^{``}"
    Sleep(1000)
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    A_Clipboard := sub
    Sleep(200)
    Send "^v"
    Sleep(200)
    Send "{Enter}"
    Sleep(1000)

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 500

    ; Wait for success page
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Click Home link
    backlink := "
            (
            [...document.querySelectorAll('a')].find(a => a.textContent.trim() === 'Home').click();
            )"

    A_Clipboard := backlink
    Sleep(200)
    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    ; Wait for page load after Home click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click IT category
    Send "^+i" 
    Sleep(1000)
    Send "^{``}"

    IT := "
          (
          const xpathResult = document.evaluate(
          '//a[text()=`"IT`" and contains(@href, `"78-IT`")]',
          document,
          null,
          XPathResult.FIRST_ORDERED_NODE_TYPE,
          null
          `);`
          if (xpathResult.singleNodeValue) {
              xpathResult.singleNodeValue.click();
          }
          )"

    A_Clipboard := IT
    Sleep(200)
    Send "^v"
    Send "{Enter}"
    sleep 500

    ; Wait for page load after IT click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click post link
    Send "^+i" 
    Sleep(1000)
    Send "^{``}"

    link := "
           (
           const post1 = document.querySelector('.post1');
           if (post1) {
               // Find the link inside the post1 element and click it
               const link = post1.querySelector('a');
               if (link) {
                   link.click();
               } else {
                   console.log('No link found inside post1');
               }
           } else {
               console.log('post1 element not found');
           }
           )"

    A_Clipboard := link
    Sleep(200)
    Send "^v"
    Send "{Enter}"
    sleep 500

    CoordMode("Mouse", "Screen")
    click 1400,921

    ; Wait for page load after post click
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Copy post URL
    send "^l"
    sleep 500
    send "^c"

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep(500)

    ; Save backlink
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep(200)
    Send "{Enter}"
    Sleep(500)
    
    ; Set category
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep(200)
    Send "^v"
    Sleep(200)
    Send "{Enter}"
    sleep 500
    
    ; Set subcategory
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep(200)
    Send "^v"
    Sleep(200)
    Send "{Enter}"
    Sleep(1000)
    
    ; Set location
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep(200)
    Send "^v"
    Sleep(200)
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep(200)
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep(200)
    Send "^v"
    Sleep(800)
    Send "{Enter}"
    sleep 1000
    
    ; Final save
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep(200)
    Send "^v"
    Sleep(800)
    Send "{Enter}"
    sleep 4600

    ; Cleanup
    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose (free_ads_online_dev)
        sleep 800
    }

    sleep 1000
    send "^w"

    ToolTip
    ; Return true for successful completion
    return true
}

;===================================================================================================================================================================================================================

start_free_smart_list() {
    ; Global declarations
    global free_smart_list_Attempts, free_smart_list_targetCount, StopExecution
    
    ; Local variables for display
    local currentAttempt := free_smart_list_Attempts
    local targetCount := free_smart_list_targetCount
    
    ; Update tooltip with current progress
    ToolTip "Free Smart List Attempt: " currentAttempt + 1 "/" targetCount
    
    ; Define window titles and text patterns
    free_ads_online := "Free Smart Classified Ads"
    free_ads_online_last := "India, Other Countries - Free Smart Classified Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - freesmartlist.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    ; Define ad content
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    ; Activate Brave browser
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    ; Open DevTools
    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Start backlink process
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    ; Ensure DevTools is open
    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Select Free Mart List source
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Mart List') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        return false  ; Return false when error page detected
    }

    ; Navigate to posting page
    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Send("^l")
    Sleep 500
    link := "https://freesmartlist.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    Send(link)
    Send("{Enter}")
    Sleep 1500

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Open DevTools for form filling
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Fill form fields
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    ; Fill title
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^+i"
    Sleep 1000
    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    A_Clipboard := jsTitle
    Sleep 100
    Send "^v"
    Sleep 100
    Send "{Enter}"

    ; Fill description
    WinWait(consolee) 
    WinActivate(consolee)
    Send "^+i"
    Sleep 1000
    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ; Solve forbidden glitch
    Click 1000,1328
    sleep 1000
    Send "^v"
    Sleep 500
    Send "+{Home}"
    sleep 250
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Submit form
    Send "^{``}"
    Sleep 1000
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 1000

    ; Wait for success page
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Click Home link
    backlink := "
            (
            [...document.querySelectorAll('a')].find(a => a.textContent.trim() === 'Home').click();
            )"

    A_Clipboard := backlink
    Sleep 200
    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    ; Wait for page load after Home click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click IT category
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    IT := "
          (
          const xpathResult = document.evaluate(
          '//a[text()=`"IT`" and contains(@href, `"78-IT`")]',
          document,
          null,
          XPathResult.FIRST_ORDERED_NODE_TYPE,
          null
          `);`
          if (xpathResult.singleNodeValue) {
              xpathResult.singleNodeValue.click();
          }
          )"

    A_Clipboard := IT
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    ; Wait for page load after IT click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click post link
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    link := "
           (
           const post1 = document.querySelector('.post1');
           if (post1) {
               // Find the link inside the post1 element and click it
               const link = post1.querySelector('a');
               if (link) {
                   link.click();
               } else {
                   console.log('No link found inside post1');
               }
           } else {
               console.log('post1 element not found');
           }
           )"

    A_Clipboard := link
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    CoordMode("Mouse", "Screen")
    Click 1400, 921

    ; Wait for page load after post click
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Copy post URL
    send "^l"
    sleep 500
    send "^c"

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    ; Save backlink
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    ; Set category
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    ; Set subcategory
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000
    
    ; Set location
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    ; Final save
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Cleanup
    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose (free_ads_online_dev)
        sleep 800
    }

    sleep 1000
    send "^w"

    ToolTip
    ; Return true for successful completion
    return true
}

;===================================================================================================================================================================================================================

start_smart_ad_posting(){
    ; Global declarations
    global smart_ad_posting_Attempts, smart_ad_posting_Targetcount, StopExecution

    ; Local variables for display
    local currentAttempt := smart_ad_posting_Attempts
    local targetCount := smart_ad_posting_Targetcount

    ; Update tooltip with current progress
    ToolTip("Smart Ad Posting Attempt: " . (smart_ad_posting_Attempts + 1) . "/" . smart_ad_posting_Targetcount)

    
    ; Define window titles and text patterns
    free_ads_online := "Smart Ads Posting Website"
    free_ads_online_last := "India, Other Countries - Smart Ads Posting Website"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - smartadposting.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    ; Define ad content
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    ; Activate Brave browser
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    ; Open DevTools
    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Start backlink process
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    ; Ensure DevTools is open
    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Select Smart Ad Posting source
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Smart Ad Posting') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        return false  ; Return false when error page detected
    }

    ; Navigate to posting page
    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Send("^l")
    Sleep 500
    link := "https://smartadposting.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    Send(link)
    Send("{Enter}")
    Sleep 1500

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Open DevTools for form filling
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Fill form fields
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    ; Fill title
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^+i"
    Sleep 1000
    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    A_Clipboard := jsTitle
    Sleep 100
    Send "^v"
    Sleep 100
    Send "{Enter}"

    ; Fill description
    WinWait(consolee) 
    WinActivate(consolee)
    Send "^+i"
    Sleep 1000
    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ; Solve forbidden glitch
    Click 1000,1328
    sleep 1000
    Send "^v"
    Sleep 500
    Send "+{Home}"
    sleep 250
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Submit form
    Send "^{``}"
    Sleep 1000
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 1000

    ; Wait for success page
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Click Home link
    backlink := "
            (
            [...document.querySelectorAll('a')].find(a => a.textContent.trim() === 'Home').click();
            )"

    A_Clipboard := backlink
    Sleep 200
    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    ; Wait for page load after Home click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click IT category
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    IT := "
          (
          const xpathResult = document.evaluate(
          '//a[text()=`"IT`" and contains(@href, `"78-IT`")]',
          document,
          null,
          XPathResult.FIRST_ORDERED_NODE_TYPE,
          null
          `);`
          if (xpathResult.singleNodeValue) {
              xpathResult.singleNodeValue.click();
          }
          )"

    A_Clipboard := IT
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    ; Wait for page load after IT click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click post link
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    link := "
           (
           const post1 = document.querySelector('.post1');
           if (post1) {
               // Find the link inside the post1 element and click it
               const link = post1.querySelector('a');
               if (link) {
                   link.click();
               } else {
                   console.log('No link found inside post1');
               }
           } else {
               console.log('post1 element not found');
           }
           )"

    A_Clipboard := link
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    CoordMode("Mouse", "Screen")
    Click 1400, 921

    ; Wait for page load after post click
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Copy post URL
    send "^l"
    sleep 500
    send "^c"

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    ; Save backlink
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    ; Set category
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    ; Set subcategory
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000
    
    ; Set location
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    ; Final save
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Cleanup
    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose (free_ads_online_dev)
        sleep 800
    }

    sleep 1000
    send "^w"

    ToolTip
    ; Return true for successful completion
    return true
}

;===================================================================================================================================================================================================================

start_smart_free_ad(){
    ; Global declarations
    global smart_free_ad_Attempts, smart_free_ad_targetCount, StopExecution
    
    ; Local variables for display
    local currentAttempt := smart_free_ad_Attempts
    local targetCount := smart_free_ad_targetCount
    
    ; Update tooltip with current progress
    ToolTip "Smart Free Ad Attempt: " currentAttempt + 1 "/" targetCount
    
    ; Define window titles and text patterns
    free_ads_online := "Post Free Classified ads Smartly"
    free_ads_online_last := "India, Other Countries - Post Free Classified ads Smartly"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - smartfreeads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    ; Define ad content
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    ; Activate Brave browser
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    ; Open DevTools
    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Start backlink process
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    ; Ensure DevTools is open
    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Select Smart Free Ad source
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Smart Free Ad') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        return false  ; Return false when error page detected
    }

    ; Navigate to posting page
    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)

    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Send("^l")
    Sleep 500
    link := "https://smartfreeads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    Send(link)
    Send("{Enter}")
    Sleep 1500

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Open DevTools for form filling
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Fill form fields
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    ; Fill title
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^+i"
    Sleep 1000
    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    A_Clipboard := jsTitle
    Sleep 100
    Send "^v"
    Sleep 100
    Send "{Enter}"

    ; Fill description
    WinWait(consolee) 
    WinActivate(consolee)
    Send "^+i"
    Sleep 1000
    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ; Solve forbidden glitch
    Click 1000,1328
    sleep 1000
    Send "^v"
    Sleep 500
    Send "+{Home}"
    sleep 250
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Submit form
    Send "^{``}"
    Sleep 1000
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 1000

    ; Wait for success page
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Click Home link
    backlink := "
            (
            [...document.querySelectorAll('a')].find(a => a.textContent.trim() === 'Home').click();
            )"

    A_Clipboard := backlink
    Sleep 200
    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    ; Wait for page load after Home click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click IT category
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    IT := "
          (
          const xpathResult = document.evaluate(
          '//a[text()=`"IT`" and contains(@href, `"78-IT`")]',
          document,
          null,
          XPathResult.FIRST_ORDERED_NODE_TYPE,
          null
          `);`
          if (xpathResult.singleNodeValue) {
              xpathResult.singleNodeValue.click();
          }
          )"

    A_Clipboard := IT
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    ; Wait for page load after IT click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 200

    ; Click post link
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    link := "
           (
           const post1 = document.querySelector('.post1');
           if (post1) {
               // Find the link inside the post1 element and click it
               const link = post1.querySelector('a');
               if (link) {
                   link.click();
               } else {
                   console.log('No link found inside post1');
               }
           } else {
               console.log('post1 element not found');
           }
           )"

    A_Clipboard := link
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    CoordMode("Mouse", "Screen")
    Click 1400, 921

    ; Wait for page load after post click
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Copy post URL
    send "^l"
    sleep 500
    send "^c"

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    ; Save backlink
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    ; Set category
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    ; Set subcategory
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000
    
    ; Set location
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    ; Final save
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Cleanup
    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose (free_ads_online_dev)
        sleep 800
    }

    sleep 1000
    send "^w"

    ToolTip
    ; Return true for successful completion
    return true
}

;===================================================================================================================================================================================================================

start_re_classified(){
    ; Global declarations
    global re_classified_Attempts, re_classified_targetCount, StopExecution
    
    ; Local variables for display
    local currentAttempt := re_classified_Attempts
    local targetCount := re_classified_targetCount
    
    ; Update tooltip with current progress
    ToolTip "Re Classified Attempt: " currentAttempt "/" targetCount
    
    ; Define window titles and text patterns
    free_ads_online := "India, Other Countries - Free Classified Ads"
    free_ads_online_last := "India, Other Countries - Free Classified Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    free_ads_online_dev := "DevTools - reclassifed.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    ; Define ad content
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    ; Activate Brave browser
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    ; Open DevTools
    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Start backlink process
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    ; Ensure DevTools is open
    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Select Re Classified source
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Re Classified') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Navigate to posting page
    Send("^l")
    Sleep 500
    link := "https://reclassifed.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    Send(link)
    Send("{Enter}")
    Sleep 1500

    Winwait(free_ads_online_last)
    WinActivate(free_ads_online_last)
    WinWaitActive(free_ads_online_last)
    sleep 1500

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Open DevTools for form filling
    if WinExist(free_ads_online_dev) 
    {   
        Winwait(free_ads_online_dev)
        WinActivate(free_ads_online_dev)
        WinWaitActive(free_ads_online_dev)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; Fill form fields
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    ; Fill title
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^+i"
    Sleep 1000
    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    Sleep 1000
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    A_Clipboard := jsTitle
    Sleep 100
    Send "^v"
    Sleep 100
    Send "{Enter}"

    ; Fill description
    WinWait(consolee) 
    WinActivate(consolee)
    Send "^+i"
    Sleep 1000
    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    Sleep 1000

    ; Solve forbidden glitch
    Click 1000,1328
    sleep 1000
    Send "^v"
    Sleep 500
    Send "+{Home}"
    sleep 250
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Submit form
    Send "^{``}"
    Sleep 1000
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    WinWait(free_ads_online)
    WinActivate(free_ads_online)
    WinWaitActive(free_ads_online)
    sleep 1000

    ; Wait for success page
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Click Home link
    backlink := "
            (
            [...document.querySelectorAll('a')].find(a => a.textContent.trim() === 'Home').click();
            )"

    A_Clipboard := backlink
    Sleep 200
    WinWait(free_ads_online_dev)
    WinActivate(free_ads_online_dev)
    WinWaitActive(free_ads_online_dev)
    sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    ; Wait for page load after Home click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    temp := "Free Classified Ads"

    WinWait(temp)
    WinActivate(temp)
    WinWaitActive(temp)
    sleep 200

    ; Click IT category
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    IT := "
          (
          const xpathResult = document.evaluate(
          '//a[text()=`"IT`" and contains(@href, `"78-IT`")]',
          document,
          null,
          XPathResult.FIRST_ORDERED_NODE_TYPE,
          null
          `);`
          if (xpathResult.singleNodeValue) {
              xpathResult.singleNodeValue.click();
          }
          )"

    A_Clipboard := IT
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    ; Wait for page load after IT click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    WinWait(temp)
    WinActivate(temp)
    WinWaitActive(temp)
    sleep 200
    
    ; Click post link
    Send "^+i" 
    Sleep 1000
    Send "^{``}"

    link := "
           (
           const post1 = document.querySelector('.post1');
           if (post1) {
               // Find the link inside the post1 element and click it
               const link = post1.querySelector('a');
               if (link) {
                   link.click();
               } else {
                   console.log('No link found inside post1');
               }
           } else {
               console.log('post1 element not found');
           }
           )"

    A_Clipboard := link
    Sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500

    CoordMode("Mouse", "Screen")
    Click 1400, 921

    ; Wait for page load after post click
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }
    
    ; Copy post URL
    send "^l"
    sleep 500
    send "^c"

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    ; Save backlink
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    ; Set category
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    ; Set subcategory
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000
    
    ; Set location
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    ; Final save
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Cleanup
    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(free_ads_online_dev)
    {
        WinClose (free_ads_online_dev)
        sleep 800
    }

    sleep 1000
    send "^w"

    ToolTip
    ; Return true for successful completion
    return true
}

;===================================================================================================================================================================================================================

start_Free_Ad1() {
    global Free_Ad1_Attempts, Free_Ad1_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := Free_Ad1_Attempts
    targetCount := Free_Ad1_targetCount

    ; Update tooltip to show current progress
    ToolTip("Free Ad1 - Attempt " currentAttempt + 1 " of " targetCount)
    
    freead1 := "Free ads without registration - Classifieds"
    freead1_homepage := "Free ads without registration - Classifieds"
    freead1_homepage2 := "India, Other Countries - Free ads without registration - Classifieds"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    freead1_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    freead1_devtools := "DevTools - freead1.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    dev := "DevTools - freead1.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0&"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 500

    Send "^1" 
    sleep 500

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Free Ad1') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ad1 selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip()
        return false
    }
    
    WinWait(freead1_homepage)
    WinActivate(freead1_homepage)
    WinWaitActive(freead1_homepage)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep 500

    ; The URL to navigate to
    link := "https://freead1.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }
    
    if WinExist(freead1_devtools) 
    {   
        Winwait(freead1_devtools)
        WinActivate(freead1_devtools)
        WinWaitActive(freead1_devtools)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(freead1_devtools)
    WinActivate(freead1_devtools)
    Sleep 500

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(freead1)
    WinActivate(freead1)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 878,1276
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep 200

    WinWait(dev)
    WinActivate(dev)
    WinWaitActive(dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose backlinkdevtool
        sleep 800
    }

    if WinExist(freead1_devtools)
    {
        WinClose freead1_devtools
        sleep 800
    }

    sleep 1000
    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_doclassified() {
    global doclassified_Attempts, doclassified_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := doclassified_Attempts
    targetCount := doclassified_targetCount

    ; Update tooltip to show current progress
    ToolTip("Do Classified - Attempt " currentAttempt + 1 " of " targetCount)
    
    doclassified := "Post Free Classified Ads"
    doclassified_homepage := "Post Free Classified Ads"
    doclassified_homepage2 := "India, Other Countries - Post Free Classified Ads"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    doclassified_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    doclassified_devtools := "DevTools - doclassifieds.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    dev := "DevTools - doclassifieds.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0&"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 500

    Send "^1" 
    sleep 500

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Do Class Field') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Do Class Field selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip()
        return false
    }
    
    WinWait(doclassified_homepage)
    WinActivate(doclassified_homepage)
    WinWaitActive(doclassified_homepage)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep 500

    ; The URL to navigate to
    link := "https://doclassifieds.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }
    
    if WinExist(doclassified_devtools) 
    {   
        Winwait(doclassified_devtools)
        WinActivate(doclassified_devtools)
        WinWaitActive(doclassified_devtools)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(doclassified_devtools)
    WinActivate(doclassified_devtools)
    Sleep 500

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(doclassified)
    WinActivate(doclassified)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 878,1276
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep 200

    WinWait(dev)
    WinActivate(dev)
    WinWaitActive(dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose backlinkdevtool
        sleep 800
    }

    if WinExist(doclassified_devtools)
    {
        WinClose doclassified_devtools
        sleep 800
    }

    sleep 1000
    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_postsmartads() {
    global postsmartads_Attempts, postsmartads_targetCount, StopExecution
    
    ; Use local variables for display purposes
    currentAttempt := postsmartads_Attempts
    targetCount := postsmartads_targetCount

    ; Update tooltip to show current progress
    ToolTip("Post Smart Ads - Attempt " currentAttempt + 1 " of " targetCount)
    
    postsmartads := "Smart Classified Ads"
    postsmartads_homepage := "Smart Classified Ads"
    postsmartads_homepage2 := "India, Other Countries - Smart Classified Ads"

    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"

    postsmartads_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    postsmartads_devtools := "DevTools - postsmartads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    dev := "DevTools - postsmartads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0&"
    forbidden := "403 Forbidden"

    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"

    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 500

    Send "^1" 
    sleep 500

    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction

    Send "^v"
    Send "{Enter}"
    Sleep 1500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'Post Smart Ads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Post Smart Ads selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep 1000

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }

    ; Check for error page - return false if detected
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""

    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        ToolTip()
        return false
    }
    
    WinWait(postsmartads_homepage)
    WinActivate(postsmartads_homepage)
    WinWaitActive(postsmartads_homepage)

    ; Press Ctrl+L to focus the address bar
    Send("^l")
    
    ; Wait a moment for the address bar to be active
    Sleep 500

    ; The URL to navigate to
    link := "https://postsmartads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    
    ; Send the URL text and then press Enter
    Send(link)
    Send("{Enter}")

    ; Wait for page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }
    
    if WinExist(postsmartads_devtools) 
    {   
        Winwait(postsmartads_devtools)
        WinActivate(postsmartads_devtools)
        WinWaitActive(postsmartads_devtools)
        Send "^{``}"
        Sleep 1000
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep 2000
        Send "^{``}"
        Sleep 1000
    }

    ; JavaScript to set the input value
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"

    ; Use the concatenation operator (.) and the newline escape sequence (\n)
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    ; Paste JS into console
    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(adtitle)
    Send("{Enter}")
    Sleep 1000

    WinWait(postsmartads_devtools)
    WinActivate(postsmartads_devtools)
    Sleep 500

    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"

    ; Overwrite the clipboard with the new JavaScript command.
    A_Clipboard := jsTitle
    Sleep 100

    ; Send the command to the console (assuming it's open and active).
    Send "^v"
    Sleep 100
    Send "{Enter}"

    WinWait(consolee) 
    WinActivate(consolee)

    ; Open DevTools
    Send "^+i"
    Sleep 1000

    Send(addescription)
    Send("{Enter}")
    Sleep 1000

    WinWait(postsmartads)
    WinActivate(postsmartads)
    Sleep 1000

    ;to solve glitch of "forbidden " when the last line of the ad description is contact number
    Click 878,1276
    sleep 1000
    Send "^v"
    Sleep 500

    Send "+{Home}"

    sleep 250

    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Focus console (Ctrl+`)
    Send "^{``}"
    Sleep 1000

    sub := "document.querySelector('button[type=`"submit`"]').click();"

    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1500

    ; Wait for success page to load using text finder
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""

    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 500
        }
    }

    backlink := "
    (
    (function() {
    // 1. Find ALL elements that match the red-colored paragraph.
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');

    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }

    // 2. Select the SECOND red element (index 1).
    const targetPrecedingElement = precedingElements[1];

    // 3. Get the element immediately following the second red element (which contains the URL).
    const urlElement = targetPrecedingElement.nextElementSibling;

    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }

    // Extract ONLY THE PLAIN TEXT CONTENT (the link) from inside the <p> tags.
    const link = urlElement.textContent.trim();

    // Copy the link string to the clipboard using the DevTools 'copy' command.
    copy(link);

    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    ; Copy to clipboard
    A_Clipboard := backlink
    Sleep 200

    WinWait(dev)
    WinActivate(dev)
    WinWaitActive(dev)
    sleep 200

    ; Paste into console
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    Send "^{``}"
    Sleep 500

    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"

    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 500
    
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Work From Home'
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Jobs,' 'Career,' or 'Service'
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"

    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
    
        // Priority 1: Check for 'Part Time Job'
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        // Priority 2: Check for 'Part Time/Full Time Work.'
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        // Priority 3: Check for 'Lead Management'
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        // Priority 4: Check for 'Work From Home'
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"

    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep 1000

    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep 1000
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    if WinExist(backlinkdevtool)
    {
        WinClose backlinkdevtool
        sleep 800
    }

    if WinExist(postsmartads_devtools)
    {
        WinClose postsmartads_devtools
        sleep 800
    }

    sleep 1000
    send "^w"

    ; Clear tooltip at the end of successful completion
    ToolTip()
    
    ; Return true to indicate successful completion
    return true
}

;===================================================================================================================================================================================================================

start_totads() {
    ; Global declarations
    global totads_Attempts, totads_targetCount, StopExecution
    
    ; Local variables for display
    local currentAttempt := totads_Attempts
    local targetCount := totads_targetCount
    
    ; Update tooltip with current progress
    ToolTip "Total Ads Attempt: " currentAttempt "/" targetCount
    
    ; Define window titles and text patterns
    freewebads_homepage := "Total Free Classified Ads"
    freewebads_homepage2 := "India, Other Countries - Total Free Classified Ads"
    consolee := "OK2675 : Back-Link SERVICE - Brave"
    backlinkwind := "OK2675 : Vanya Back Link Service"
    backlinkhomepage_devtool := "DevTools - OK2675 : Vanya Back Link Service"
    backlinkdevtool := "DevTools - www.onlinekam.in/join/new-back-link"
    backlinkcl := "DevTools - www.onlinekam.in/join/back-link"
    freeasdhome_last := "DevTools - devtools://devtools/bundled/devtools_app.html?remoteBase=https://devtools.brave.com/serve_file/@ef9f711fe14ee363c1ff67b83ec107e548f3fd5/&targetType=tab"
    freewebadsdevtools := "DevTools - totads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    forbidden := "403 Forbidden"
    
    ; Define ad content
    adtitle := "copyClipboard('1')"
    addescription := "copyClipboard('2')"
    locationText := "india, new delhi"
    emailAddress := "okvanya1@gmail.com"
    
    ; Activate Brave browser
    WinWait("ahk_exe brave.exe")
    WinActivate("ahk_exe brave.exe")
    WinWaitActive("ahk_exe brave.exe")
    sleep 1000

    Send "^1" 
    sleep 1000

    ; Open DevTools
    if WinExist(backlinkhomepage_devtool) 
    {   
        Winwait(backlinkhomepage_devtool)
        WinActivate(backlinkhomepage_devtool)
        WinWaitActive(backlinkhomepage_devtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; Start backlink process
    jsStartAction := "popupCenter('new-back-link', 'MyPop1', 550, 600);"
    A_Clipboard := jsStartAction
    Send "^v"
    Send "{Enter}"
    Sleep(1500)

    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500

    ; Check for skipper - if found, clean up and return false
    Text:="|<skipper>**50$54.000000000TyD1sw0S0E2/1Mo0K0Ly/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0K0/1Mo0K0Lw/1Mo0K0E4/1Mo0K0Lw/1Mo0K0K0/1Mo0K0K0D3Mo0K0K0DXko0K0K07ykrwLyK073Uk4E2S03z0zwTy000000000U"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }
    
    ; Check for skipper2 - same approach
    Text:="|<skipper2>**80$62.000000000000000000k000000000S00S0w00006U04kN00000s01A6E0000000F1400000004Ml3z0ztsDt6BFzMTaO6yJXICyDB6XT5Rp02WlFcg1LNE7cwIOO0IyI7uDD6aU5Dh3yVzVdc1HPFscTkO+0IIoI+606Wk57B7yXk1crtFXFXcryO76Q0wDi7xbUzU00003lg00000000s/00000000/7U00000003zk00000000Ts00000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 68-150000, 345-150000, 68+150000, 345+150000, 0, 0, Text)) {
        sleep 500
        ; Clean up windows properly
        if WinExist(consolee)
            WinClose(consolee)
        if WinExist(backlinkcl)
            WinClose(backlinkcl)
        if WinExist(backlinkdevtool)
            WinClose(backlinkdevtool)
        
        ToolTip "Skipper2 detected - Classipress attempt skipped"
        Sleep(1000)
        ToolTip
        return false ; Return false to indicate NOT completed
    }

    ; Ensure DevTools is open
    if WinExist(backlinkdevtool) 
    {   
        Winwait(backlinkdevtool)
        WinActivate(backlinkdevtool)
        WinWaitActive(backlinkdevtool)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        Winwait(consolee)
        WinActivate(consolee)
        WinWaitActive(consolee)
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; Select ToTads source
    js := "
    (
    (function() {
    var dropdown = document.querySelector('select[name=`"source`"]');
    for (var i = 0; i < dropdown.options.length; i++) {
        if (dropdown.options[i].text.trim() === 'ToTads') {
            dropdown.selectedIndex = i;
            var changeEvent = new Event('change', { bubbles: true });
            dropdown.dispatchEvent(changeEvent);
            var clickEvent = new MouseEvent('click', { bubbles: true, cancelable: true });
            dropdown.dispatchEvent(clickEvent);
            console.log('✅ Free Ads Home selected and click triggered.');
            break;
        }
    }
    })();
    )"

    A_Clipboard := js
    Send "^v"
    Send "{Enter}"
    Sleep(1000)

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Check for error page
    Text:="|<>**50$88.000000000000001zzs00000000000601U00000000000Pzy000000000001c00000000000006U0000000000000O00000000000001c00000000000006U0000000000000O003lsQT07y03ltc00/QVHY3sQ0/QaU00hy5TkTzw0hyO002y8Jl3s7s2y9c00+k1Q0D07U+k6zz0a04k1s0D0a0M042M0K0500w2M1jzk901M0w01E906U00g05U3k05Ug0O002k0I0/00K2k1c00/01E0c01M/06U00g0502U05Ug0O002k0I0/00K2k1c00/01E0w01M/06U00g0503k050g0O002k0I0B00w2k1c00/01E0S03k/06U00g0501w0S0g0O002k0I03M7k2k1jzs/01E07zy0/0600Ug0500D3k0g0Tzy3k0Q00Dw03k0000000000000008"
    X := Y := ""
    
    if (ok:=FindText(&X, &Y, 1989-150000, 1287-150000, 1989+150000, 1287+150000, 0, 0, Text)) {
        sleep 500
        send "^w"
        return false  ; Return false when error page detected
    }
    
    ; Navigate to posting page
    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    WinWaitActive(freewebads_homepage)

    Send("^l")
    Sleep(500)
    link := "https://totads.com/index.php?view=post&cityid=536&lang=en&catid=9&subcatid=78&shortcutregion=0"
    Send(link)
    Send("{Enter}")
    Sleep(1500)

    ; Wait for page to load
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    Winwait(freewebads_homepage2)
    WinActivate(freewebads_homepage2)
    WinWaitActive(freewebads_homepage2)
    sleep 1500
    
    ; Open DevTools for form filling
    if WinExist(freewebadsdevtools) 
    {   
        Winwait(freewebadsdevtools)
        WinActivate(freewebadsdevtools)
        WinWaitActive(freewebadsdevtools)
        Send "^{``}"
        Sleep(1000)
    }
    else 
    {
        sleep 500
        Send "^+i" 
        Sleep(2000)
        Send "^{``}"
        Sleep(1000)
    }

    ; Fill form fields
    js1 := "document.querySelector('input[name=`"area`"]').value = '" . locationText . "';"
    js2 := "document.querySelector('input[name=`"showemail`"][value=`"0`"]').checked = true;"
    js3 := "document.querySelector('#email').value = '" . emailAddress . "';"
    js4 := "document.querySelector('input[name=`"othercontactok`"]').checked = true;"
    js5 := "document.querySelector('input[name=`"agree`"]').checked = true;"
    jsFinal := js1 . "`n" . js2 . "`n" . js3 . "`n" . js4 . "`n" . js5

    A_Clipboard := jsFinal
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500

    ; Fill title
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^+i"
    Sleep 1000
    Send(adtitle)
    Send("{Enter}")
    Sleep(1000)

    WinWait(freewebadsdevtools)
    WinActivate(freewebadsdevtools)
    Sleep 1000
    titleText := A_Clipboard
    jsTitle := "document.querySelector('#adtitle').value = '" . titleText . "';"
    A_Clipboard := jsTitle
    Sleep 100
    Send "^v"
    Sleep 100
    Send "{Enter}"

    ; Fill description
    WinWait(consolee) 
    WinActivate(consolee)
    Send "^+i"
    Sleep 1000
    Send(addescription)
    Send("{Enter}")
    Sleep(1000)

    WinWait(freewebads_homepage)
    WinActivate(freewebads_homepage)
    Sleep 1000

    ; Solve forbidden glitch
    Click 836,1261
    sleep 1000
    Send "^v"
    Sleep 500
    Send "+{Home}"
    sleep 250
    send "^x"
    sleep 250
    Send "{BS}"
    sleep 250
    Send "{Space}" 
    send "^v"
    sleep 1250

    ; Submit form
    Send "^{``}"
    Sleep 1000
    sub := "document.querySelector('button[type=`"submit`"]').click();"
    A_Clipboard := sub
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1500)

    WinWait(freewebads_homepage2)
    WinActivate(freewebads_homepage2)
    WinWaitActive(freewebads_homepage2)
    sleep 1000

    ; Wait for success page
    Text:="|<loaded>**50$33.0000000Dz000Dkz007U0Q01kD0k0QDz3037USA0lk0skAM03a1a00AQMk01VnA00M6NU030G800M2H0030GM00Q6H001lmM007wF00003A0000NU000360000As01s1XU0T06C0780My7V01Vzss0700C00S07U00z7k000zs0000000U"
    X := Y := ""
    
    Loop {
        if (ok:=FindText(&X, &Y, 143-150000, 105-150000, 143+150000, 105+150000, 0, 0, Text)) {
            sleep 500
            break
        } else {
            Sleep 2000
        }
    }

    ; Extract backlink
    backlink := "
    (
    (function() {
    const precedingElements = document.querySelectorAll('p[style=`"color:red`"]');
    if (precedingElements.length < 2) {
        return console.error('Found only ' + precedingElements.length + ' red-colored elements. We need at least two to skip the first one.');
    }
    const targetPrecedingElement = precedingElements[1];
    const urlElement = targetPrecedingElement.nextElementSibling;
    if (!urlElement) {
        return console.error('Found the second red element, but no element follows it.');
    }
    const link = urlElement.textContent.trim();
    copy(link);
    console.log('[Success] The link following the second red-text element has been copied to your clipboard: \n\n' + link);
    })();
    )"

    A_Clipboard := backlink
    Sleep(200)
    WinWait(freewebadsdevtools)
    WinActivate(freewebadsdevtools)
    WinWaitActive(freewebadsdevtools)
    sleep 200
    Send "^v"
    Send "{Enter}"
    sleep 500
    
    WinWait(consolee) 
    WinActivate(consolee)
    sleep 500
    Send "^{``}"
    Sleep(500)

    ; Save backlink
    postLink := A_Clipboard
    jsBacklinkfix := "let el = document.querySelector('input[name=`"postlink`"]');"
    . "el.value = '" . postLink . "';"
    . "el.dispatchEvent(new Event('input', { bubbles: true }));"
    . "el.dispatchEvent(new Event('change', { bubbles: true }));"
    
    A_Clipboard := jsBacklinkfix
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(500)
    
    ; Set category
    jsCategory := "
    (
    var selectElement = document.querySelector('select[name=`"category`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Jobs') || options.includes('Career') || options.includes('Service')) {
        selectElement.value = 'Jobs';
        }
    }
    )"
    
    A_Clipboard := jsCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 500
    
    ; Set subcategory
    jsSubCategory := "
    (
    var selectElement = document.querySelector('select[name=`"subcategory`"]');
    if (selectElement) {
        var options = Array.from(selectElement.options).map(opt => opt.text.trim());
        if (options.includes('Part Time Job')) {
        selectElement.value = 'Part Time Job';
        } 
        else if (options.includes('Part Time/Full Time Work.')) {
        selectElement.value = 'Part Time/Full Time Work.';
        }
        else if (options.includes('Lead Management')) {
        selectElement.value = 'Lead Management';
        }
        else if (options.includes('Work From Home')) {
        selectElement.value = 'Work From Home';
        }
    }
    )"
    
    A_Clipboard := jsSubCategory
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    Sleep(1000)
    
    ; Set location
    jsState := "document.querySelector('select[name=`"state`"]').value = '34';"
    A_Clipboard := jsState
    Sleep 200
    Send "^v"
    Sleep 200
    Send "{Enter}"
    sleep 1000
    
    jsStateChange := "document.querySelector('select[name=`"state`"]').dispatchEvent(new Event('change'));"
    A_Clipboard := jsStateChange
    Sleep 200
    Send "^v"
    Send "{Enter}"
    Sleep(1000)
    
    jsCity := "document.querySelector('select[name=`"city`"]').value = 'Central Delhi';"
    A_Clipboard := jsCity
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 1000
    
    ; Final save
    Sleep 400
    jsSaveLinkClick := "document.querySelector('input[type=`"submit`"][value=`"SAVE LINK`"]').click();"
    A_Clipboard := jsSaveLinkClick
    Sleep 200
    Send "^v"
    Sleep 800
    Send "{Enter}"
    sleep 4600

    ; Cleanup
    if WinExist(backlinkdevtool)
    {
        WinClose (backlinkdevtool)
        sleep 800
    }

    if WinExist(freewebadsdevtools)
    {
        WinClose (freewebadsdevtools)
        sleep 800
    }

    send "^w"

    ; Return true for successful completion
    return true
}

;===================================================================================================================================================================================================================




;===================================================================================================================================================================================================================
;===================================================================================================================================================================================================================

;-------------------------;
^b:: start_free_web_ads() ;
;-------------------------;