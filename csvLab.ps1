#########################################################################
#
# Script : Module 12 Lab - Powershell Part 2
#  
# Created : 05/09/2022
#   
# Programmer : Oscar Gastelum 
#  
# 
# ########################################################################  
#  Program description/ purpose : Script will: 
#- read csv file "employees.csv"
#- use contents and export data as a new file with new colums (lname, fname,
# phone)
#
#--------------------------- Change History ------------------------------
# Programmer : 
# Date :
# Description of change : 
#  
#########################################################################/ 

#declare/ initialize variables
$directoryPs = "powershell"
$file = "employees.csv"
$saveFileName = "phone.csv"

#display script info 
Write-Output "`nScript will extract, modify and export data from '$file' to '$saveFileName'."

#make sure location is users home directory 
cd ~

#check for folders and files, if not found, display error msg to user, else continue execution
Write-Output "`nSearching for directory '$directoryPs' ..."
if(!(Test-Path -Path $directoryPs )){
    Write-Output "`nDirectory: '$directoryPs' Not found. Check Directory path and try again."

}else{
    Write-Output "`nDirectory Found successfully."
    
    #create obj for the powershell direcory path 
    $powershellDir = Get-Location | Join-Path -ChildPath $directoryPs

    #change directory 
    cd $powershellDir

    #list directory contents 
    Get-ChildItem

    Write-Output "`nSearching for '$file' ..."
    if(!(Test-Path -Path $file )){
        Write-Output "`nFile: $file Not found. Check Directory path and try again."

    }else{
        Write-Output "`nFile Found successfully."
        
        #display contents of the employee csv file 
        Write-Output "`nDisplaying $file contents: `n"
        Get-Content -Path $file

        #export modified csv with new columns (lname, fname, phone) names as phone.csv
        Write-Output "`nExtracting, modifying and exporting data from '$file' to '$saveFileName' ..."
        Import-Csv -Path $file | select lname, fname, phone | 
        Export-Csv -NoTypeInformation -Path $saveFileName 
        
        #display newly created phone.csv contents 
        Write-Output "`nDisplaying $saveFileName contents: `n"
        Get-Content -Path $saveFileName
    
    }
    
}





